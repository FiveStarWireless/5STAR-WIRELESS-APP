import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/pages/bottom_nav/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tabs_host_model.dart';
export 'tabs_host_model.dart';

class TabsHostWidget extends StatefulWidget {
  const TabsHostWidget({super.key});

  static String routeName = 'TabsHost';
  static String routePath = '/tabsHost';

  @override
  State<TabsHostWidget> createState() => _TabsHostWidgetState();
}

class _TabsHostWidgetState extends State<TabsHostWidget> {
  late TabsHostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabsHostModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor:
              FFAppState().isDarkMode ? Colors.black : Color(0xFF07BCFD),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              () {
                if (FFAppState().activeTabIndex == 0) {
                  return 'Home';
                } else if (FFAppState().activeTabIndex == 1) {
                  return 'Collection';
                } else if (FFAppState().activeTabIndex == 2) {
                  return 'Services';
                } else if (FFAppState().activeTabIndex == 3) {
                  return 'Cart';
                } else if (FFAppState().activeTabIndex == 4) {
                  return 'User';
                } else {
                  return '5Star Wireless';
                }
              }(),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: PageView(
                          controller: _model.tabsPagerController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (_) async {
                            FFAppState().activeTabIndex =
                                _model.tabsPagerCurrentIndex;
                            safeSetState(() {});
                            FFAppState().showSettingsTray = false;
                            safeSetState(() {});
                          },
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowWebView(
                                content: 'https://5star-wireless.com/',
                                bypass: true,
                                height: 2000.0,
                                verticalScroll: true,
                                horizontalScroll: true,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowWebView(
                                content:
                                    'https://5star-wireless.com/collections/all',
                                bypass: true,
                                height: 2000.0,
                                verticalScroll: true,
                                horizontalScroll: true,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowWebView(
                                content:
                                    'https://5star-wireless.com/pages/akko-protection',
                                bypass: true,
                                height: 2000.0,
                                verticalScroll: true,
                                horizontalScroll: true,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowWebView(
                                content: 'https://5star-wireless.com/cart',
                                bypass: true,
                                height: 2000.0,
                                verticalScroll: true,
                                horizontalScroll: true,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: wrapWithModel(
                      model: _model.bottomNavModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BottomNavWidget(
                        activeIndex: FFAppState().activeTabIndex,
                        onStoreTap: () async {
                          HapticFeedback.lightImpact();
                          FFAppState().showSettingsTray = false;
                          safeSetState(() {});
                          FFAppState().activeTabIndex = 1;
                          safeSetState(() {});
                          await _model.tabsPagerController?.animateToPage(
                            1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        onServicesTap: () async {
                          HapticFeedback.lightImpact();
                          FFAppState().showSettingsTray = false;
                          safeSetState(() {});
                          FFAppState().activeTabIndex = 2;
                          safeSetState(() {});
                          await _model.tabsPagerController?.animateToPage(
                            2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        onCartTap: () async {
                          HapticFeedback.lightImpact();
                          FFAppState().showSettingsTray = false;
                          safeSetState(() {});
                          FFAppState().activeTabIndex = 3;
                          safeSetState(() {});
                          await _model.tabsPagerController?.animateToPage(
                            3,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        onUserTap: () async {
                          await _model.tabsPagerController?.animateToPage(
                            4,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          FFAppState().activeTabIndex = 4;
                          safeSetState(() {});
                          FFAppState().showSettingsTray = false;
                          safeSetState(() {});
                        },
                        onThemeTap: () async {
                          if (FFAppState().isDarkMode) {
                            FFAppState().isDarkMode = false;
                            safeSetState(() {});
                            FFAppState().showSettingsTray = false;
                            safeSetState(() {});
                          } else {
                            FFAppState().isDarkMode = true;
                            safeSetState(() {});
                            FFAppState().showSettingsTray = false;
                            safeSetState(() {});
                          }
                        },
                        onSettingsTap: () async {
                          HapticFeedback.lightImpact();
                          if (FFAppState().showSettingsTray) {
                            FFAppState().showSettingsTray = false;
                            safeSetState(() {});
                          } else {
                            FFAppState().showSettingsTray = true;
                            safeSetState(() {});
                          }
                        },
                        onHomeTap: () async {
                          HapticFeedback.lightImpact();
                          FFAppState().showSettingsTray = false;
                          safeSetState(() {});
                          FFAppState().activeTabIndex = 0;
                          safeSetState(() {});
                          await _model.tabsPagerController?.animateToPage(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        onFavoritesTap: () async {},
                      ),
                    ),
                  ),
                ],
              ),
              if (FFAppState().showSettingsTray)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().showSettingsTray = false;
                    safeSetState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 106.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Visibility(
                      visible: FFAppState().showSettingsTray,
                      child: Container(
                        width: 220.0,
                        decoration: BoxDecoration(
                          color: FFAppState().showSettingsTray
                              ? Color(0xFF0F1115)
                              : Colors.white,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 21.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().isDarkMode
                                        ? Color(0xFF0F1115)
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
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
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().isDarkMode
                                        ? Color(0xFF0F1115)
                                        : Colors.white,
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().isDarkMode) {
                                        FFAppState().isDarkMode = false;
                                        safeSetState(() {});
                                        FFAppState().showSettingsTray = false;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().isDarkMode = true;
                                        safeSetState(() {});
                                        FFAppState().showSettingsTray = false;
                                        safeSetState(() {});
                                      }
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState().isDarkMode
                                        ? Color(0xFF0F1115)
                                        : Colors.white,
                                  ),
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
                                          await _model.tabsPagerController
                                              ?.animateToPage(
                                            4,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          FFAppState().activeTabIndex = 4;
                                          safeSetState(() {});
                                          FFAppState().showSettingsTray = false;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.person,
                                          color: Color(0xFF07BCFD),
                                          size: 30.0,
                                        ),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
