import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/bottom_nav/bottom_nav_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class _TabsHostWidgetState extends State<TabsHostWidget>
    with TickerProviderStateMixin {
  late TabsHostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabsHostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().clientId == '') {
        _model.newId = await actions.makeClientId(
          context,
        );
        FFAppState().clientId = _model.newId!;
      }
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 1500.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -100.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
          backgroundColor: Color(0xFF07BCFD),
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
                  return 'Wishlist';
                } else if (FFAppState().activeTabIndex == 5) {
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
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.tabsPagerController ??=
                              PageController(
                                  initialPage: max(
                                      0,
                                      min(
                                          valueOrDefault<int>(
                                            FFAppState().activeTabIndex,
                                            0,
                                          ),
                                          5))),
                          onPageChanged: (_) => safeSetState(() {}),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.WebviewXBrowser(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  initialUrl:
                                      'https://5star-wireless.com/?t=${FFAppState().homeNonce.toString()}',
                                  showBackButton: true,
                                  refreshTick: FFAppState().homeNonce,
                                  showRefreshButton: true,
                                  onRefreshPressed: () async {
                                    FFAppState().showRefreshedText = true;
                                    safeSetState(() {});
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation'] !=
                                        null) {
                                      await animationsMap[
                                              'containerOnActionTriggerAnimation']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 1500,
                                      ),
                                    );
                                    FFAppState().showRefreshedText = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.WebviewXBrowser(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  initialUrl:
                                      'https://5star-wireless.com/collections/all-products?t=${FFAppState().storeNonce.toString()}',
                                  showBackButton: true,
                                  refreshTick: FFAppState().storeNonce,
                                  showRefreshButton: true,
                                  onRefreshPressed: () async {},
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.WebviewXBrowser(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  initialUrl:
                                      'https://5star-wireless.com/pages/our-services?t=${FFAppState().servicesNonce.toString()}',
                                  showBackButton: true,
                                  refreshTick: FFAppState().servicesNonce,
                                  showRefreshButton: true,
                                  onRefreshPressed: () async {},
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.WebviewXBrowser(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  initialUrl:
                                      'https://5star-wireless.com/cart?t=${FFAppState().cartNonce.toString()}',
                                  showBackButton: true,
                                  refreshTick: FFAppState().cartNonce,
                                  showRefreshButton: true,
                                  onRefreshPressed: () async {},
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.WebviewXBrowser(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  initialUrl:
                                      'https://5star-wireless.com/pages/wishlist?t=${FFAppState().faveNonce.toString()}',
                                  showBackButton: true,
                                  refreshTick: FFAppState().faveNonce,
                                  showRefreshButton: true,
                                  onRefreshPressed: () async {},
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.WebviewXBrowser(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  initialUrl:
                                      'https://5star-wireless.com/account/login?t=${FFAppState().usersNonce.toString()}',
                                  showBackButton: true,
                                  refreshTick: FFAppState().usersNonce,
                                  showRefreshButton: true,
                                  onRefreshPressed: () async {},
                                ),
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
                        FFAppState().activeTabIndex = 1;
                        await _model.tabsPagerController?.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      onServicesTap: () async {
                        HapticFeedback.lightImpact();
                        FFAppState().activeTabIndex = 2;
                        await _model.tabsPagerController?.animateToPage(
                          2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      onCartTap: () async {
                        HapticFeedback.lightImpact();
                        FFAppState().activeTabIndex = 3;
                        await _model.tabsPagerController?.animateToPage(
                          3,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      onHomeTap: () async {
                        HapticFeedback.lightImpact();
                        FFAppState().activeTabIndex = 0;
                        await _model.tabsPagerController?.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      onUserTap: () async {
                        HapticFeedback.lightImpact();
                        FFAppState().activeTabIndex = 5;
                        await _model.tabsPagerController?.animateToPage(
                          5,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      onFaveTap: () async {
                        HapticFeedback.lightImpact();
                        FFAppState().activeTabIndex = 4;
                        await _model.tabsPagerController?.animateToPage(
                          4,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (FFAppState().showRefreshedText)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: 120.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Color(0xB107BCFD),
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: AnimatedDefaultTextStyle(
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 15.0,
                                letterSpacing: 2.5,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                          duration: Duration(milliseconds: 315),
                          curve: Curves.elasticOut,
                          child: Text(
                            'Refreshed!',
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation']!,
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
