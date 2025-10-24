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
    this.refreshTick, // When this int changes, we reload()
    // FlutterFlow auto-passes these; must be declared
    this.width,
    this.height,
  }) : super(key: key);

  // === FlutterFlow Parameters ===
  final String? initialUrl;
  final bool? showBackButton;
  final int?
      refreshTick; // Bind per tab (home/store/services/cart/favorites/user)

  // Auto-passed by FlutterFlow
  final double? width;
  final double? height;

  @override
  State<WebviewXBrowser> createState() => _WebviewXBrowserState();
}

class _WebviewXBrowserState extends State<WebviewXBrowser> {
  WebViewXController? _controller;
  bool _canGoBack = false;

  bool get _ready => _controller != null;

  Future<void> _refreshNav() async {
    if (!_ready) return;
    final back = await _controller!.canGoBack();
    if (!mounted) return;
    setState(() => _canGoBack = back);
  }

  // Optional: emulate FF's "Force Allow Scrolling"
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

  // React to parameter changes coming from FlutterFlow
  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 1) Hard refresh when the tick changes
    if (widget.refreshTick != oldWidget.refreshTick && _ready) {
      _controller!.reload();
    }

    // 2) If initialUrl changes, load the new URL
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      _controller!.loadContent(newUrl, SourceType.url);
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
              navigationDelegate: (nav) async {
                await _refreshNav();
                return NavigationDecision.navigate;
              },
              onPageFinished: (url) async {
                // Optional: re-enable scrolling if the site disables it
                await _controller!.evalRawJavascript(_enableScrollJS);
                await _refreshNav();
              },
              webSpecificParams: const WebSpecificParams(
                webAllowFullscreenContent: true,
              ),
              // Do not include iosAllowsInlineMediaPlayback (not exposed on FF fork)
              mobileSpecificParams: const MobileSpecificParams(
                androidEnableHybridComposition: true,
              ),
              height: widget.height ?? MediaQuery.of(context).size.height,
              width: widget.width ?? MediaQuery.of(context).size.width,
            ),

            // Back button (5Star blue #07BCFD)
            if (showBack)
              Positioned(
                left: 12,
                top: 12,
                child: FloatingActionButton.small(
                  heroTag: 'wv_back',
                  backgroundColor: const Color(0xFF07BCFD), // ← #07BCFD
                  elevation: 3,
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
