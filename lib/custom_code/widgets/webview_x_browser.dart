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
    this.refreshTick,
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

  // pull-to-refresh state (top-edge only)
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

  // optional scroll re-enabler
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
      return false;
    }
    return true;
  }

  Future<bool> _atTop() async {
    if (!_ready) return true;
    try {
      final v = await _controller!.evalRawJavascript(
        'window.scrollY || document.documentElement.scrollTop || document.body.scrollTop || 0',
      );
      final y = (v is num) ? v.toDouble() : double.tryParse('$v') ?? 0.0;
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
      await Future.delayed(const Duration(milliseconds: 350));
    } finally {
      if (mounted) setState(() => _isRefreshing = false);
    }
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // external refresh trigger
    if (widget.refreshTick != oldWidget.refreshTick && _ready) {
      _doRefresh();
    }

    // change URL
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      _controller!.loadContent(newUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final showBack = widget.showBackButton ?? true;
    final startUrl = (widget.initialUrl == null || widget.initialUrl!.isEmpty)
        ? 'https://5star-wireless.com'
        : widget.initialUrl!;

    final w = widget.width ?? double.infinity;
    final h = widget.height ?? double.infinity;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        width: w,
        height: h,
        child: Stack(
          children: [
            // ---- The WebView itself (receives normal scroll gestures) ----
            WebViewX(
              key: const ValueKey('webviewx_plus'),
              initialContent: startUrl,
              initialSourceType: SourceType.url,
              onWebViewCreated: (ctrl) async {
                _controller = ctrl;
                await _refreshNav();
              },
              onPageStarted: (_) async => _refreshNav(),
              onPageFinished: (_) async {
                await _controller!.evalRawJavascript(_enableScrollJS);
                await _refreshNav();
              },
              webSpecificParams: const WebSpecificParams(
                webAllowFullscreenContent: true,
              ),
              mobileSpecificParams: const MobileSpecificParams(
                androidEnableHybridComposition: true,
              ),
              width: w,
              height: h,
            ),

            // ---- A *thin* top-edge pull zone (doesn't block normal scrolling) ----
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              // 24–32 px feels right; tweak if you want a bigger/smaller target
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragStart: (d) async {
                  // only arm if page is already at the top
                  if (await _atTop()) {
                    _dragStartDy = d.globalPosition.dy;
                    _armedForRefresh = true;
                  } else {
                    _armedForRefresh = false;
                  }
                },
                onVerticalDragUpdate: (d) async {
                  if (!_armedForRefresh || _isRefreshing) return;
                  final delta = d.globalPosition.dy - _dragStartDy;
                  if (delta > 80) {
                    _armedForRefresh = false;
                    await _doRefresh();
                  }
                },
                onVerticalDragEnd: (_) => _armedForRefresh = false,
                child: const SizedBox(height: 28),
              ),
            ),

            // ---- Refresh spinner overlay ----
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

            // ---- Back button ----
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
    );
  }
}
