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
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WebviewXBrowser extends StatefulWidget {
  const WebviewXBrowser({
    Key? key,
    required this.initialUrl,
    this.showBackButton = true,
    this.refreshTick, // when this int changes, reload()
    // FlutterFlow auto-passes these; must be declared
    this.width,
    this.height,
  }) : super(key: key);

  // === FlutterFlow parameters ===
  final String? initialUrl;
  final bool? showBackButton;
  final int? refreshTick;

  // Auto-passed by FlutterFlow
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

  bool get _ready => _controller != null;

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
    return true; // pop Flutter page
  }

  /// Try to determine if the page is scrolled to the top.
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

  Future<void> _doRefresh() async {
    if (!_ready || _isRefreshing) return;
    HapticFeedback.mediumImpact();
    setState(() => _isRefreshing = true);
    try {
      await _controller!.reload();
      // give webview a moment to settle
      await Future.delayed(const Duration(milliseconds: 350));
    } catch (_) {}
    if (!mounted) return;
    setState(() => _isRefreshing = false);
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 🔁 reload when refreshTick changes
    if (widget.refreshTick != oldWidget.refreshTick && _ready) {
      _doRefresh();
    }

    // 🔁 load new URL if initialUrl changes
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      // FF-managed webviewx_plus fork expects a single String arg here
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

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        // Detect a downward pull from the top → refresh
        child: GestureDetector(
          onVerticalDragStart: (d) {
            _dragStartDy = d.globalPosition.dy;
            _armedForRefresh = true;
          },
          onVerticalDragUpdate: (d) async {
            if (!_armedForRefresh || _isRefreshing) return;
            final delta = d.globalPosition.dy - _dragStartDy;
            // require a decent pull distance
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
                  // optional: re-enable scrolling if the site disables it
                  await _controller!.evalRawJavascript(_enableScrollJS);
                  await _refreshNav();
                },
                webSpecificParams: const WebSpecificParams(
                  webAllowFullscreenContent: true,
                ),
                mobileSpecificParams: const MobileSpecificParams(
                  androidEnableHybridComposition: true,
                ),
                height: widget.height ?? MediaQuery.of(context).size.height,
                width: widget.width ?? MediaQuery.of(context).size.width,
              ),

              // Spinner overlay while refreshing
              if (_isRefreshing)
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 0,
                  right: 0,
                  child: Center(
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
                ),

              // Back button (5Star blue #07BCFD) — checks canGoBack on tap
              if (showBack)
                Positioned(
                  left: 12,
                  top: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
