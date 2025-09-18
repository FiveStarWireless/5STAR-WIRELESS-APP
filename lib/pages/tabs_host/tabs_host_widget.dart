import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/pages/main_nav/main_nav_widget.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
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
                          child: FlutterFlowWebView(
                            content:
                                'https://shopify.com/authentication/74726867197/login?client_id=19876919-bc0a-4288-819d-9873d41cac6e&locale=en&redirect_uri=https%3A%2F%2Fshopify.com%2Fauthentication%2F74726867197%2Foauth%2Fauthorize%3Fclient_id%3D19876919-bc0a-4288-819d-9873d41cac6e%26locale%3Den%26nonce%3Dd70e3e38-7545-4755-8823-d599e5cb9fbe%26redirect_uri%3Dhttps%253A%252F%252Fshopify.com%252F74726867197%252Faccount%252Fcallback%253Fsource%253Dcore%26region_country%3DUS%26response_type%3Dcode%26scope%3Dopenid%2Bemail%2Bcustomer-account-api%253Afull%26state%3D01K4ZVESFTTZFDY46ZXCGY31G7&region_country=US',
                            bypass: true,
                            height: 2000.0,
                            verticalScroll: true,
                            horizontalScroll: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.mainNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MainNavWidget(
                    activeIndex: FFAppState().activeTabIndex,
                    onHomeTap: () async {
                      FFAppState().activeTabIndex = 0;
                      safeSetState(() {});
                      HapticFeedback.lightImpact();
                      await _model.tabsPagerController?.animateToPage(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    onStoreTap: () async {
                      FFAppState().activeTabIndex = 1;
                      safeSetState(() {});
                      HapticFeedback.lightImpact();
                      await _model.tabsPagerController?.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    onServicesTap: () async {
                      FFAppState().activeTabIndex = 2;
                      safeSetState(() {});
                      HapticFeedback.lightImpact();
                      await _model.tabsPagerController?.animateToPage(
                        2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    onCartTap: () async {
                      FFAppState().activeTabIndex = 3;
                      safeSetState(() {});
                      HapticFeedback.lightImpact();
                      await _model.tabsPagerController?.animateToPage(
                        3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    onUserTap: () async {
                      FFAppState().activeTabIndex = 4;
                      safeSetState(() {});
                      HapticFeedback.lightImpact();
                      await _model.tabsPagerController?.animateToPage(
                        4,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    onThemeTap: () async {
                      FFAppState().isDarkMode = !FFAppState().isDarkMode;
                      safeSetState(() {});
                      HapticFeedback.lightImpact();
                    },
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
