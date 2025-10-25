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
import 'package:webviewx_plus/webviewx_plus.dart';

class WebviewXBrowser extends StatefulWidget {
  const WebviewXBrowser({
    Key? key,
    required this.initialUrl,
    this.showBackButton = true,
    this.refreshTick,
    this.onAutoSwitchTab,
    this.width,
    this.height,
  }) : super(key: key);

  final String? initialUrl;
  final bool? showBackButton;
  final int? refreshTick;
  final Future<dynamic> Function()? onAutoSwitchTab;
  final double? width;
  final double? height;

  @override
  State<WebviewXBrowser> createState() => _WebviewXBrowserState();
}

class _WebviewXBrowserState extends State<WebviewXBrowser> {
  WebViewXController? _controller;
  bool _canGoBack = false;
  int _lastTabIndex = -1;

  bool get _ready => _controller != null;

  Future<void> _refreshNav() async {
    if (!_ready) return;
    final back = await _controller!.canGoBack();
    if (!mounted) return;
    setState(() => _canGoBack = back);
  }

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

  int _classifyTab(String url) {
    final u = url.toLowerCase();

    if (u == 'https://5star-wireless.com/' ||
        u.contains('5star-wireless.com/?')) return 0;
    if (u.contains('/collections/') || u.contains('/products/')) return 1;
    if (u.contains('/pages/our-services')) return 2;
    if (u.contains('/cart')) return 3;
    if (u.contains('/pages/wishlist')) return 4;
    if (u.contains('shopify.com/authentication') || u.contains('/account'))
      return 5;

    return -1;
  }

  Future<void> _detectAndSwitchTab() async {
    if (!_ready) return;
    try {
      final url =
          await _controller!.getContentUrl(); // ✅ Correct for latest version
      if (url == null || url.isEmpty) return;

      final idx = _classifyTab(url);
      if (idx < 0 || idx == _lastTabIndex) return;
      _lastTabIndex = idx;

      FFAppState().update(() {
        FFAppState().activeTabIndex = idx;
      });

      if (widget.onAutoSwitchTab != null) {
        await widget.onAutoSwitchTab!.call();
      }
    } catch (e) {
      debugPrint('URL detection error: $e');
    }
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.refreshTick != oldWidget.refreshTick && _ready) {
      _controller!.reload();
    }

    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      _controller!.loadContent(url: newUrl, sourceType: SourceType.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showBack = widget.showBackButton ?? true;
    final String startUrl = widget.initialUrl?.isNotEmpty == true
        ? widget.initialUrl!
        : 'https://5star-wireless.com/';

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        child: Stack(
          children: [
            WebViewX(
              key: const ValueKey('webviewx_plus'),
              initialContent: startUrl,
              initialSourceType: SourceType.url,
              onWebViewCreated: (ctrl) async {
                _controller = ctrl;
                await _refreshNav();
                await _detectAndSwitchTab();
              },
              onPageFinished: (url) async {
                await _controller!.evalRawJavascript(_enableScrollJS);
                await _refreshNav();
                await _detectAndSwitchTab();
              },
              navigationDelegate: (nav) async {
                await _detectAndSwitchTab();
                return NavigationDecision.navigate;
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
            if (showBack)
              Positioned(
                left: 12,
                top: 12,
                child: FloatingActionButton.small(
                  heroTag: 'wv_back',
                  backgroundColor: const Color(0xFF07BCFD),
                  onPressed: _canGoBack
                      ? () async {
                          await _controller!.goBack();
                          await _refreshNav();
                        }
                      : null,
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
