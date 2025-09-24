import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tabs_host_copy_model.dart';
export 'tabs_host_copy_model.dart';

class TabsHostCopyWidget extends StatefulWidget {
  const TabsHostCopyWidget({super.key});

  static String routeName = 'TabsHostCopy';
  static String routePath = '/tabsHostCopy';

  @override
  State<TabsHostCopyWidget> createState() => _TabsHostCopyWidgetState();
}

class _TabsHostCopyWidgetState extends State<TabsHostCopyWidget> {
  late TabsHostCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabsHostCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (isAndroid) {
        await requestPermission(notificationsPermission);
        _model.tokenOut = await actions.getFcmToken();
        if (_model.tokenOut == 'Is Not Empty') {
          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'fcm_tokens': FieldValue.arrayUnion(['tokenOut']),
              },
            ),
          });
        }
      } else if (isiOS) {
        await requestPermission(notificationsPermission);
        await actions.getFcmToken();
        if (_model.tokenOut == 'Is Not Empty') {
          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'fcm_tokens': FieldValue.arrayUnion(['tokenOut']),
              },
            ),
          });
        }
      }
    });

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
              wrapWithModel(
                model: _model.mainNavModel,
                updateCallback: () => safeSetState(() {}),
                child: MainNavWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
