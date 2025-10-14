import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_model.dart';
export 'bottom_nav_model.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({
    super.key,
    int? activeIndex,
    required this.onStoreTap,
    required this.onServicesTap,
    required this.onCartTap,
    required this.onHomeTap,
    required this.onUserTap,
    required this.onFaveTap,
  }) : this.activeIndex = activeIndex ?? 0;

  final int activeIndex;
  final Future Function()? onStoreTap;
  final Future Function()? onServicesTap;
  final Future Function()? onCartTap;
  final Future Function()? onHomeTap;
  final Future Function()? onUserTap;
  final Future Function()? onFaveTap;

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  late BottomNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 61.0,
                decoration: BoxDecoration(
                  color: FFAppState().isDarkMode
                      ? Color(0xFF0F1115)
                      : Colors.white,
                  border: Border.all(
                    color: FFAppState().isDarkMode
                        ? Colors.transparent
                        : Color(0xFFE6E8EC),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FFAppState().isDarkMode
                                      ? Color(0xFF0F1115)
                                      : Colors.white,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await widget.onHomeTap?.call();
                                      },
                                      child: Icon(
                                        Icons.home,
                                        color: Color(0xFF07BCFD),
                                        size: 30.0,
                                      ),
                                    ),
                                    if (widget.activeIndex == 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 3.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF07BCFD),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(2.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                            border: Border.all(
                                              color: Color(0xFF07BCFD),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FFAppState().isDarkMode
                                    ? Color(0xFF0F1115)
                                    : Colors.white,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.onStoreTap?.call();
                                    },
                                    child: Icon(
                                      Icons.store_rounded,
                                      color: Color(0xFF07BCFD),
                                      size: 30.0,
                                    ),
                                  ),
                                  if (widget.activeIndex == 1)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 3.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF07BCFD),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: Color(0xFF07BCFD),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FFAppState().isDarkMode
                                    ? Color(0xFF0F1115)
                                    : Colors.white,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.onServicesTap?.call();
                                    },
                                    child: Icon(
                                      Icons.home_repair_service_rounded,
                                      color: Color(0xFF07BCFD),
                                      size: 30.0,
                                    ),
                                  ),
                                  if (widget.activeIndex == 2)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 3.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF07BCFD),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: Color(0xFF07BCFD),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FFAppState().isDarkMode
                                    ? Color(0xFF0F1115)
                                    : Colors.white,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.onCartTap?.call();
                                    },
                                    child: Icon(
                                      Icons.shopping_cart_rounded,
                                      color: Color(0xFF07BCFD),
                                      size: 30.0,
                                    ),
                                  ),
                                  if (widget.activeIndex == 3)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 3.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF07BCFD),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: Color(0xFF07BCFD),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FFAppState().isDarkMode
                                    ? Color(0xFF0F1115)
                                    : Colors.white,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.onUserTap?.call();
                                    },
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xFF07BCFD),
                                      size: 30.0,
                                    ),
                                  ),
                                  if (widget.activeIndex == 4)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 3.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF07BCFD),
                                          border: Border.all(
                                            color: Color(0xFF07BCFD),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FFAppState().isDarkMode
                                    ? Color(0xFF0F1115)
                                    : Colors.white,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.onFaveTap?.call();
                                    },
                                    child: Icon(
                                      Icons.star_rounded,
                                      color: Color(0xFF07BCFD),
                                      size: 30.0,
                                    ),
                                  ),
                                  if (widget.activeIndex == 5)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 3.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF07BCFD),
                                          border: Border.all(
                                            color: Color(0xFF07BCFD),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FFAppState().isDarkMode
                                      ? Color(0xFF0F1115)
                                      : Colors.white,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState().isDarkMode) {
                                      HapticFeedback.lightImpact();
                                      FFAppState().isDarkMode = false;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                    } else {
                                      HapticFeedback.lightImpact();
                                      FFAppState().isDarkMode = true;
                                      safeSetState(() {});
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (!FFAppState().isDarkMode)
                                        Icon(
                                          Icons.light_mode_rounded,
                                          color: Color(0xFF07BCFD),
                                          size: 30.0,
                                        ),
                                      if (FFAppState().isDarkMode)
                                        Icon(
                                          Icons.dark_mode_rounded,
                                          color: Color(0xFF07BCFD),
                                          size: 30.0,
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 3.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF07BCFD),
                                            border: Border.all(
                                              color: Color(0xFF07BCFD),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
