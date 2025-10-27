import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rfreshbutton_model.dart';
export 'rfreshbutton_model.dart';

class RfreshbuttonWidget extends StatefulWidget {
  const RfreshbuttonWidget({super.key});

  static String routeName = 'Rfreshbutton';
  static String routePath = '/rfreshbutton';

  @override
  State<RfreshbuttonWidget> createState() => _RfreshbuttonWidgetState();
}

class _RfreshbuttonWidgetState extends State<RfreshbuttonWidget> {
  late RfreshbuttonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RfreshbuttonModel());

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
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
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
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.8),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        if (FFAppState().activeTabIndex == 0) {
                          FFAppState().homeNonce = FFAppState().homeNonce + 1;
                        } else if (FFAppState().activeTabIndex == 1) {
                          FFAppState().storeNonce = FFAppState().storeNonce + 1;
                        } else if (FFAppState().activeTabIndex == 2) {
                          FFAppState().servicesNonce =
                              FFAppState().servicesNonce + 1;
                        } else if (FFAppState().activeTabIndex == 3) {
                          FFAppState().cartNonce = FFAppState().cartNonce + 1;
                        } else if (FFAppState().activeTabIndex == 4) {
                          FFAppState().faveNonce = FFAppState().faveNonce + 1;
                        } else if (FFAppState().activeTabIndex == 5) {
                          FFAppState().usersNonce = FFAppState().usersNonce + 1;
                        }

                        await Future.delayed(
                          Duration(
                            milliseconds: 800,
                          ),
                        );
                        FFAppState().showToast = true;
                        safeSetState(() {});
                        await Future.delayed(
                          Duration(
                            milliseconds: 1200,
                          ),
                        );
                        FFAppState().showToast = false;
                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.replay_circle_filled_rounded,
                        color: Color(0xFF07BCFD),
                        size: 40.0,
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
