// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WebviewXBrowser extends StatefulWidget {
  const WebviewXBrowser({
    Key? key,
    required this.initialUrl,
    this.showBackButton = true,
    this.refreshTick, // when this int changes, reload()
    this.width,
    this.height,
  }) : super(key: key);

  final String? initialUrl;
  final bool? showBackButton;
  final int? refreshTick;

  final double? width;
  final double? height;

  @override
  State<WebviewXBrowser> createState() => _WebviewXBrowserState();
}

class _WebviewXBrowserState extends State<WebviewXBrowser> {
  WebViewXController? _controller;
  bool _canGoBack = false;

  // Pull-to-refresh state
  bool _isRefreshing = false;
  double _dragStartDy = 0;
  bool _armedForRefresh = false;

  // Top banner state
  bool _showBanner = false;
  String _bannerText = '';
  Timer? _bannerTimer;

  bool get _ready => _controller != null;

  @override
  void dispose() {
    _bannerTimer?.cancel();
    super.dispose();
  }

  Future<void> _refreshNav() async {
    if (!_ready) return;
    final back = await _controller!.canGoBack();
    if (!mounted) return;
    setState(() => _canGoBack = back);
  }

  // Optional: emulate FF "Force Allow Scrolling"
  static const String _enableScrollJS = r"""
(function(){
  try {
    document.documentElement.style.overflowX='auto';
    document.documentElement.style.overflowY='auto';
    document.body.style.overflowX='auto';
    document.body.style.overflowY='auto';
    var meta=document.querySelector('meta[name=viewport]');
    if(!meta){
      meta=document.createElement('meta');
      meta.name='viewport';
      meta.content='width=device-width, initial-scale=1, maximum-scale=1';
      document.head.appendChild(meta);
    }
  } catch(e){}
})();
""";

  Future<bool> _onWillPop() async {
    if (_ready && await _controller!.canGoBack()) {
      await _controller!.goBack();
      await _refreshNav();
      return false; // consume system back
    }
    return true;
  }

  /// Check if the page is scrolled to top
  Future<bool> _atTop() async {
    if (!_ready) return true;
    try {
      final v = await _controller!.evalRawJavascript(
        'window.scrollY || document.documentElement.scrollTop || document.body.scrollTop || 0',
      );
      double y;
      if (v is num) {
        y = (v as num).toDouble();
      } else {
        y = double.tryParse('$v') ?? 0.0;
      }
      return y <= 0.0;
    } catch (_) {
      return true;
    }
  }

  void _showBannerNow(String text, {Duration? autoHideAfter}) {
    if (!mounted) return;
    setState(() {
      _bannerText = text;
      _showBanner = true;
    });
    _bannerTimer?.cancel();
    if (autoHideAfter != null) {
      _bannerTimer = Timer(autoHideAfter, () {
        if (mounted) setState(() => _showBanner = false);
      });
    }
  }

  Future<void> _doRefresh() async {
    if (!_ready || _isRefreshing) return;

    // Immediately show "Refreshing..." banner
    _showBannerNow('Refreshing...');
    HapticFeedback.mediumImpact();

    setState(() => _isRefreshing = true);

    try {
      await _controller!.reload();
      await Future.delayed(const Duration(milliseconds: 350));
    } catch (_) {}

    if (!mounted) return;
    setState(() => _isRefreshing = false);

    // Switch to "Refreshed!" and auto-hide
    _showBannerNow('Refreshed!',
        autoHideAfter: const Duration(milliseconds: 1500));
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // reload when refreshTick changes
    if (widget.refreshTick != oldWidget.refreshTick && _ready) {
      _doRefresh();
    }

    // load new URL if initialUrl changes
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      _controller!.loadContent(newUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showBack = widget.showBackButton ?? true;
    final String startUrl =
        (widget.initialUrl == null || widget.initialUrl!.isEmpty)
            ? 'https://5star-wireless.com'
            : widget.initialUrl!;

    final double w = widget.width ?? double.infinity;
    final double h = widget.height ?? double.infinity;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        width: w,
        height: h,
        // Detect a downward pull from the top → refresh
        child: GestureDetector(
          onVerticalDragStart: (d) {
            _dragStartDy = d.globalPosition.dy;
            _armedForRefresh = true;
          },
          onVerticalDragUpdate: (d) async {
            if (!_armedForRefresh || _isRefreshing) return;
            final delta = d.globalPosition.dy - _dragStartDy;
            if (delta > 80) {
              final top = await _atTop();
              if (top) {
                _armedForRefresh = false;
                await _doRefresh();
              }
            }
          },
          onVerticalDragEnd: (_) => _armedForRefresh = false,
          child: Stack(
            children: [
              WebViewX(
                key: const ValueKey('webviewx_plus'),
                initialContent: startUrl,
                initialSourceType: SourceType.url,
                onWebViewCreated: (ctrl) async {
                  _controller = ctrl;
                  await _refreshNav();
                },
                onPageStarted: (url) async => await _refreshNav(),
                onPageFinished: (url) async {
                  await _controller!.evalRawJavascript(_enableScrollJS);
                  await _refreshNav();
                },
                webSpecificParams: const WebSpecificParams(
                  webAllowFullscreenContent: true,
                ),
                mobileSpecificParams: const MobileSpecificParams(
                  androidEnableHybridComposition: true,
                ),
                height: h,
                width: w,
              ),

              // Small spinner while the refresh is running
              if (_isRefreshing)
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),

              // Back button (5Star blue #07BCFD)
              if (showBack)
                Positioned(
                  left: 12,
                  top: MediaQuery.of(context).padding.top + 12,
                  child: FloatingActionButton.small(
                    heroTag: 'wv_back',
                    backgroundColor: const Color(0xFF07BCFD),
                    elevation: 3,
                    onPressed: () async {
                      if (_ready && await _controller!.canGoBack()) {
                        await _controller!.goBack();
                        await _refreshNav();
                      }
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),

              // Top banner ("Refreshing..." → "Refreshed!")
              if (_showBanner)
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xB107BCFD), // #b107bcfd
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        _bannerText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
