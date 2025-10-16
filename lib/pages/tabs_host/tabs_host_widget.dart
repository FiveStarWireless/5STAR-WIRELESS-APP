import '/flutter_flow/flutter_flow_icon_button.dart';
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
                                content:
                                    'https://5star-wireless.com/?t=\${FFAppState().reloadTick.toString()}',
                                bypass: true,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
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
                                    'https://5star-wireless.com/collections',
                                bypass: true,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
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
                                    'https://5star-wireless.com/pages/our-services',
                                bypass: true,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
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
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
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
                                    'https://shopify.com/authentication/74726867197/login?client_id=19876919-bc0a-4288-819d-9873d41cac6e&locale=en&redirect_uri=%2Fauthentication%2F74726867197%2Foauth%2Fauthorize%3Fclient_id%3D19876919-bc0a-4288-819d-9873d41cac6e%26locale%3Den%26nonce%3D04303ac9-6b51-4e6c-be0d-71883e4ebdb4%26redirect_uri%3Dhttps%253A%252F%252Fshopify.com%252F74726867197%252Faccount%252Fcallback%253Fsource%253Dcore%26region_country%3DUS%26response_type%3Dcode%26scope%3Dopenid%2Bemail%2Bcustomer-account-api%253Afull%26state%3DhWN3vsVGFZFkI5LEcVl5MkiY&region_country=US',
                                bypass: true,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                verticalScroll: true,
                                horizontalScroll: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.bottomNavModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BottomNavWidget(
                      activeIndex: FFAppState().activeTabIndex,
                      onStoreTap: () async {
                        HapticFeedback.lightImpact();
                        await _model.tabsPagerController?.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        FFAppState().activeTabIndex = 1;
                        safeSetState(() {});
                      },
                      onServicesTap: () async {
                        HapticFeedback.lightImpact();
                        await _model.tabsPagerController?.animateToPage(
                          2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        FFAppState().activeTabIndex = 2;
                        safeSetState(() {});
                      },
                      onCartTap: () async {
                        HapticFeedback.lightImpact();
                        await _model.tabsPagerController?.animateToPage(
                          3,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        FFAppState().activeTabIndex = 3;
                        safeSetState(() {});
                      },
                      onHomeTap: () async {
                        HapticFeedback.lightImpact();
                        await _model.tabsPagerController?.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        FFAppState().activeTabIndex = 0;
                        safeSetState(() {});
                      },
                      onUserTap: () async {
                        HapticFeedback.lightImpact();
                        await _model.tabsPagerController?.animateToPage(
                          4,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        FFAppState().activeTabIndex = 4;
                        safeSetState(() {});
                      },
                      onFaveTap: () async {
                        HapticFeedback.lightImpact();
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.86),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: Colors.transparent,
                          icon: Icon(
                            Icons.refresh_rounded,
                            color: Color(0xFF07BCFD),
                            size: 30.0,
                          ),
                          onPressed: () async {
                            HapticFeedback.lightImpact();
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(TabsHostWidget.routeName);

                            await Future.delayed(
                              Duration(
                                milliseconds: 500,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Refreshed!',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF07BCFD),
                              ),
                            );
                          },
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
    );
  }
}
