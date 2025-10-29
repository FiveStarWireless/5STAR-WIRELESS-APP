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
    this.refreshTick, // bump this int to trigger reload
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
  bool get _ready => _controller != null;

  // Keep vertical scrolling enabled; add viewport meta if missing.
  static const String _forceScrollJS = r'''
    try {
      const html = document.documentElement;
      const body = document.body;

      html.style.overflowY = 'auto';
      html.style.touchAction = 'manipulation';
      body.style.overflowY = 'auto';
      body.style.touchAction = 'manipulation';

      let meta = document.querySelector('meta[name="viewport"]');
      if (!meta) {
        meta = document.createElement('meta');
        meta.name = 'viewport';
        meta.content = 'width=device-width, initial-scale=1, maximum-scale=1';
        document.head.appendChild(meta);
      }
    } catch (e) {}
  ''';

  Future<void> _reloadIfTickChanged(int? oldTick, int? newTick) async {
    if (_ready && oldTick != newTick) {
      await _controller!.reload();
    }
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);
    _reloadIfTickChanged(oldWidget.refreshTick, widget.refreshTick);

    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      _controller!.loadContent(newUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final startUrl = (widget.initialUrl == null || widget.initialUrl!.isEmpty)
        ? 'https://5star-wireless.com'
        : widget.initialUrl!;
    final w = widget.width ?? MediaQuery.of(context).size.width;
    final h = widget.height ?? MediaQuery.of(context).size.height;

    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        children: [
          WebViewX(
            key: const ValueKey('webviewx_plus'),
            initialContent: startUrl,
            initialSourceType: SourceType.url,
            onWebViewCreated: (c) async {
              _controller = c;
            },
            onPageStarted: (url) async {
              await _controller?.evalRawJavascript(_forceScrollJS);
            },
            onPageFinished: (url) async {
              await _controller?.evalRawJavascript(_forceScrollJS);
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
          if ((widget.showBackButton ?? true))
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
