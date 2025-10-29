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
    this.refreshTick, // external refresh trigger (increment the int)
    this.width,
    this.height,
  }) : super(key: key);

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

  bool get _ready => _controller != null;

  // Re-enable page scrolling and add a viewport meta if missing.
  static const String _enableScrollJS = r"""(function(){
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
  })();""";

  Future<void> _updateBackState() async {
    if (!_ready) return;
    final canBack = await _controller!.canGoBack();
    if (mounted) setState(() => _canGoBack = canBack);
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // External refresh trigger
    if (_ready && widget.refreshTick != oldWidget.refreshTick) {
      _controller!.reload();
    }

    // If the URL prop changes, navigate to it
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      // FF fork of webviewx_plus expects a single string parameter
      _controller!.loadContent(newUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String startUrl =
        (widget.initialUrl == null || widget.initialUrl!.isEmpty)
            ? 'https://5star-wireless.com'
            : widget.initialUrl!;
    final w = widget.width ?? double.infinity;
    final h = widget.height ?? double.infinity;

    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        children: [
          WebViewX(
            key: const ValueKey('webviewx_plus'),
            initialContent: startUrl,
            initialSourceType: SourceType.url,
            onWebViewCreated: (ctrl) async {
              _controller = ctrl;
              await _updateBackState();
            },
            onPageStarted: (url) => _updateBackState(),
            onPageFinished: (url) async {
              // Ensure the page remains scrollable
              await _controller!.evalRawJavascript(_enableScrollJS);
              await _updateBackState();
            },
            webSpecificParams:
                const WebSpecificParams(webAllowFullscreenContent: true),
            mobileSpecificParams: const MobileSpecificParams(
              androidEnableHybridComposition: true,
            ),
            width: w,
            height: h,
          ),
          if (widget.showBackButton ?? true)
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
                    await _updateBackState();
                  }
                },
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
