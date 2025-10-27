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
    this.refreshTick, // when this int changes, we reload()
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

  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  final _scrollController = ScrollController();

  bool get _ready => _controller != null;

  Future<void> _refreshNav() async {
    if (!_ready) return;
    final back = await _controller!.canGoBack();
    if (!mounted) return;
    setState(() => _canGoBack = back);
  }

  // Optional: emulate FF "Force Allow Scrolling" if a site disables touch scroll
  static const String _enableScrollJS = r'''
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
''';

  Future<bool> _onWillPop() async {
    if (_ready && await _controller!.canGoBack()) {
      await _controller!.goBack();
      await _refreshNav();
      return false; // consume system back
    }
    return true; // pop Flutter page
  }

  Future<void> _hardReload() async {
    if (_ready) {
      await _controller!.reload();
      await _refreshNav();
    }
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 🔁 Hard refresh when refreshTick changes
    if (widget.refreshTick != oldWidget.refreshTick) {
      _hardReload();
    }

    // 🔁 Load a new start URL if initialUrl changes
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      // NOTE: FlutterFlow's fork expects a single-argument loadContent(String)
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

    final size = MediaQuery.of(context).size;
    final double vw = widget.width ?? size.width;
    final double vh = widget.height ?? size.height;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SizedBox(
        width: vw,
        height: vh,
        child: Stack(
          children: [
            // RefreshIndicator wraps a minimal scrollable to enable the pull gesture.
            RefreshIndicator(
              key: _refreshKey,
              color: const Color(0xFF07BCFD),
              onRefresh: () async {
                await _hardReload();
              },
              child: ListView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    width: vw,
                    height: vh,
                    child: WebViewX(
                      key: const ValueKey('webviewx_plus'),
                      initialContent: startUrl,
                      initialSourceType: SourceType.url,
                      onWebViewCreated: (ctrl) async {
                        _controller = ctrl;
                        await _refreshNav();
                      },
                      onPageStarted: (url) async {
                        await _refreshNav();
                      },
                      onPageFinished: (url) async {
                        // Re-enable scrolling if needed
                        await _controller!.evalRawJavascript(_enableScrollJS);
                        await _refreshNav();
                      },
                      // navigationDelegate: (nav) => NavigationDecision.navigate,
                      webSpecificParams: WebSpecificParams(
                        webAllowFullscreenContent: true,
                      ),
                      mobileSpecificParams: MobileSpecificParams(
                        androidEnableHybridComposition: true,
                      ),
                      width: vw,
                      height: vh,
                    ),
                  ),
                ],
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
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
