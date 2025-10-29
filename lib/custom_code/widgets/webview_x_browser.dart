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
    this.showRefreshButton = true,
    this.refreshTick,
    this.width,
    this.height,
    this.onRefreshPressed, // nullable
  }) : super(key: key);

  // === FF parameters ===
  final String? initialUrl;
  final bool? showBackButton;
  final bool? showRefreshButton;
  final int? refreshTick;

  // auto-passed
  final double? width;
  final double? height;

  // action callback for the Refresh FAB
  final Future<void> Function()? onRefreshPressed;

  @override
  State<WebviewXBrowser> createState() => _WebviewXBrowserState();
}

class _WebviewXBrowserState extends State<WebviewXBrowser> {
  WebViewXController? _controller;

  // Re-enable vertical scroll for pages that try to lock it.
  static const String _forceScrollJS = r'''
    (function(){
      try {
        var b = document.body;
        document.documentElement.style.overflowY = 'auto';
        document.documentElement.style.overscrollBehaviorY = 'auto';
        b.style.overflowY = 'auto';
        b.style.overscrollBehaviorY = 'auto';
        if(!document.querySelector('meta[name="viewport"]')){
          var m=document.createElement('meta');
          m.name='viewport';
          m.content='width=device-width, initial-scale=1, maximum-scale=1';
          document.head.appendChild(m);
        }
      } catch(e){}
    })();
  ''';

  bool get _ready => _controller != null;

  Future<void> _nudgeScroll() async {
    if (!_ready) return;
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      await _controller!.evalRawJavascript(_forceScrollJS);
    } catch (_) {}
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(covariant WebviewXBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Hard reload when refreshTick changes
    if (widget.refreshTick != oldWidget.refreshTick && _ready) {
      _controller!.reload();
    }

    // Navigate if the initialUrl changed
    final newUrl = widget.initialUrl ?? '';
    final oldUrl = oldWidget.initialUrl ?? '';
    if (_ready && newUrl.isNotEmpty && newUrl != oldUrl) {
      _controller!.loadContent(newUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String startUrl =
        (widget.initialUrl == null || widget.initialUrl!.isEmpty)
            ? 'https://5star-wireless.com'
            : widget.initialUrl!;

    return SizedBox(
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
              await _nudgeScroll();
            },
            onPageStarted: (_) async => await _nudgeScroll(),
            onPageFinished: (_) async => await _nudgeScroll(),
            webSpecificParams: const WebSpecificParams(
              webAllowFullscreenContent: true,
            ),
            mobileSpecificParams: const MobileSpecificParams(
              androidEnableHybridComposition: true,
            ),
            width: widget.width ?? MediaQuery.of(context).size.width,
            height: widget.height ?? MediaQuery.of(context).size.height,
          ),

          // Back FAB (optional)
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
                    await _nudgeScroll();
                  }
                },
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),

          // Refresh FAB (optional)
          if ((widget.showRefreshButton ?? true))
            Positioned(
              right: 12,
              top: 12,
              child: FloatingActionButton.small(
                heroTag: 'wv_refresh',
                backgroundColor: const Color(0xFF07BCFD),
                elevation: 3,
                onPressed: () async {
                  if (_ready) {
                    await _controller!.reload();
                    await _nudgeScroll();
                  }
                  if (widget.onRefreshPressed != null) {
                    await widget.onRefreshPressed!.call();
                  }
                },
                child: const Icon(Icons.refresh, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
