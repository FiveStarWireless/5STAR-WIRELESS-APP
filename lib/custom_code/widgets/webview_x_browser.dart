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
    this.showToolbar = true,
    // IMPORTANT: FlutterFlow auto-passes these; declare them here
    this.width,
    this.height,
  }) : super(key: key);

  // === Parameters from FF ===
  final String? initialUrl;
  final bool? showToolbar;

  // === Auto-passed by FlutterFlow (must be declared) ===
  final double? width;
  final double? height;

  @override
  State<WebviewXBrowser> createState() => _WebviewXBrowserState();
}

class _WebviewXBrowserState extends State<WebviewXBrowser> {
  WebViewXController? _controller;
  bool _canGoBack = false;
  bool _canGoForward = false;

  bool get _isReady => _controller != null;

  Future<void> _refreshNavState() async {
    if (!_isReady) return;
    final back = await _controller!.canGoBack();
    final fwd = await _controller!.canGoForward();
    if (!mounted) return;
    setState(() {
      _canGoBack = back;
      _canGoForward = fwd;
    });
  }

  Future<bool> _onWillPop() async {
    if (_isReady && await _controller!.canGoBack()) {
      await _controller!.goBack();
      await _refreshNavState();
      return false; // consume system back
    }
    return true; // pop Flutter page
  }

  @override
  Widget build(BuildContext context) {
    final bool showToolbar = widget.showToolbar ?? true;
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
                await _refreshNavState();
              },
              navigationDelegate: (nav) async {
                await _refreshNavState();
                return NavigationDecision.navigate;
              },
              onPageFinished: (url) async {
                await _refreshNavState();
              },
              webSpecificParams: const WebSpecificParams(
                webAllowFullscreenContent: true,
              ),
              mobileSpecificParams: const MobileSpecificParams(
                androidEnableHybridComposition: true,
                iosAllowsInlineMediaPlayback: true,
              ),
              height: widget.height ?? MediaQuery.of(context).size.height,
              width: widget.width ?? MediaQuery.of(context).size.width,
            ),
            if (showToolbar)
              Positioned(
                right: 12,
                bottom: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.55),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: 'Back',
                        onPressed: _canGoBack
                            ? () async {
                                await _controller!.goBack();
                                await _refreshNavState();
                              }
                            : null,
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      IconButton(
                        tooltip: 'Forward',
                        onPressed: _canGoForward
                            ? () async {
                                await _controller!.goForward();
                                await _refreshNavState();
                              }
                            : null,
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                      ),
                      IconButton(
                        tooltip: 'Reload',
                        onPressed: () async {
                          await _controller!.reload();
                          await _refreshNavState();
                        },
                        icon: const Icon(Icons.refresh, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
