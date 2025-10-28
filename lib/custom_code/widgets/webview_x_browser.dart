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
    this.refreshTick, // bump to force a reload
    this.width,
    this.height,
  }) : super(key: key);

  // FlutterFlow params
  final String? initialUrl;
  final bool? showBackButton;
  final int? refreshTick;

  // Auto-passed by FF
  final double? width;
  final double? height;

  @override
  State<WebviewXBrowser> createState() => _WebviewXBrowserState();
}

class _WebviewXBrowserState extends State<WebviewXBrowser> {
  WebViewXController? _controller;
  bool _canGoBack = false;

  // --- refresh / banners ---
  bool _isRefreshing = false;
  bool _showBanner = false;
  String _bannerText = '';
  Timer? _bannerTimer;

  // --- top-edge pull detector state ---
  static const double _edgeHeight = 40; // height of the pull detector band
  static const double _triggerDist = 90; // distance to trigger refresh
  double _edgeDownY = 0;
  double _edgeDragDy = 0;
  bool _edgePulling = false;
  double _edgeProgress = 0; // 0..1 progress used for indicator

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

  // Re-enable scrolling if site disables it
  static const String _enableScrollJS = r"""
(function(){
  try {
    document.documentElement.style.overflowX='auto';
    document.documentElement.style.overflowY='auto';
    document.body.style.overflowX='auto';
    document.body.style.overflowY='auto';
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

  /// Returns true if page is at top (scrollY==0)
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

    HapticFeedback.mediumImpact();
    setState(() => _isRefreshing = true);
    _showBannerNow('Refreshing...');

    // slight delay before reload → feels natural
    await Future.delayed(const Duration(milliseconds: 600));

    try {
      await _controller!.reload();
      // let the page settle a bit
      await Future.delayed(const Duration(milliseconds: 400));
    } catch (_) {}

    if (!mounted) return;
    setState(() => _isRefreshing = false);

    // show "Refreshed!" longer
    _showBannerNow('Refreshed!',
        autoHideAfter: const Duration(milliseconds: 1800));
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // external refresh trigger
    if (widget.refreshTick != oldWidget.refreshTick && _ready) {
      _doRefresh();
    }

    // new initial URL
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      // FF fork: single-arg loadContent
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

    // Pull indicator capsule (shows while pulling)
    Widget _buildPullIndicator() {
      if (!_edgePulling || _isRefreshing) return const SizedBox.shrink();
      final bool willTrigger = _edgeDragDy >= _triggerDist;

      return Positioned(
        top: MediaQuery.of(context).padding.top + 8,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xB107BCFD), // #b107bcfd
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.rotate(
                  angle: (_edgeProgress * 3.1415926), // rotate up to 180°
                  child: const Icon(Icons.arrow_downward,
                      size: 16, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text(
                  willTrigger ? 'Release to refresh' : 'Pull to refresh',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        width: w,
        height: h,
        child: Stack(
          children: [
            // --- The WebView (gets normal scroll gestures) ---
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
              height: h,
              width: w,
            ),

            // --- TOP-EDGE PULL DETECTOR (thin band so scrolling isn’t blocked) ---
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: _edgeHeight,
              child: GestureDetector(
                behavior:
                    HitTestBehavior.opaque, // only this thin strip handles
                onPanStart: (details) async {
                  if (await _atTop()) {
                    _edgeDownY = details.localPosition.dy;
                    _edgeDragDy = 0;
                    _edgePulling = true;
                    _edgeProgress = 0;
                    setState(() {});
                  }
                },
                onPanUpdate: (details) async {
                  if (!_edgePulling || _isRefreshing) return;
                  _edgeDragDy += details.delta.dy;

                  if (_edgeDragDy > 0 && await _atTop()) {
                    _edgeProgress =
                        (_edgeDragDy / _triggerDist).clamp(0.0, 1.0);
                  } else {
                    _edgeProgress = 0;
                  }
                  setState(() {});
                },
                onPanEnd: (details) async {
                  if (_edgePulling && !_isRefreshing) {
                    if (_edgeDragDy >= _triggerDist && await _atTop()) {
                      await _doRefresh();
                    }
                  }
                  _edgePulling = false;
                  _edgeProgress = 0;
                  _edgeDragDy = 0;
                  if (mounted) setState(() {});
                },
                onPanCancel: () {
                  _edgePulling = false;
                  _edgeProgress = 0;
                  _edgeDragDy = 0;
                  if (mounted) setState(() {});
                },
              ),
            ),

            // --- Small spinner while refreshing (top-right) ---
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

            // --- Back button (optional) ---
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

            // --- Pulling indicator capsule ---
            _buildPullIndicator(),

            // --- “Refreshing…” / “Refreshed!” banner ---
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
    );
  }
}
