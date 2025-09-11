import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_nav_copy_model.dart';
export 'main_nav_copy_model.dart';

class MainNavCopyWidget extends StatefulWidget {
  const MainNavCopyWidget({
    super.key,
    int? activeIndex,
  }) : this.activeIndex = activeIndex ?? 0;

  final int activeIndex;

  @override
  State<MainNavCopyWidget> createState() => _MainNavCopyWidgetState();
}

class _MainNavCopyWidgetState extends State<MainNavCopyWidget> {
  late MainNavCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainNavCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 64.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Theme.of(context).brightness == Brightness.light)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/5star_wireless_black2.jpeg'
                        : 'assets/images/5star-adaptive.png',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              if (Theme.of(context).brightness == Brightness.dark)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/ff_Experts_Logo_onDark@2x.png',
                    width: 180.0,
                    height: 40.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 200.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/5star_wireless_white12.png',
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                              alignment: Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                      ),
                      if (widget.activeIndex == 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 120.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.home_rounded,
                                        color: Color(0xFF07BCFD),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Home',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF07BCFD),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (widget.activeIndex == 0)
                                  Container(
                                    width: 100.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                              ],
                            ),
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.activeIndex == 1)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: 120.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.store,
                                            color: Color(0xFF07BCFD),
                                            size: 28.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Store',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF07BCFD),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (widget.activeIndex == 1)
                                      Container(
                                        width: 100.0,
                                        height: 3.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (widget.activeIndex == 2)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 120.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.home_repair_service,
                                        color: Color(0xFF07BCFD),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Service',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF07BCFD),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (widget.activeIndex == 2)
                                  Container(
                                    width: 100.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                              ],
                            ),
                          ),
                        ),
                      if (widget.activeIndex == 3)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: 130.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Color(0xFF07BCFD),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Cart',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF07BCFD),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                              ],
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        desktop: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.search_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
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
    );
  }
}
