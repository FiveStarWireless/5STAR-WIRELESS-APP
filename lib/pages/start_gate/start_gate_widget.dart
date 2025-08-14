import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'start_gate_model.dart';
export 'start_gate_model.dart';

class StartGateWidget extends StatefulWidget {
  const StartGateWidget({super.key});

  static String routeName = 'StartGate';
  static String routePath = '/startGate';

  @override
  State<StartGateWidget> createState() => _StartGateWidgetState();
}

class _StartGateWidgetState extends State<StartGateWidget> {
  late StartGateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartGateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn == true) {
        final _localAuth = LocalAuthentication();
        bool _isBiometricSupported = await _localAuth.isDeviceSupported();

        if (_isBiometricSupported) {
          try {
            _model.bioOk = await _localAuth.authenticate(
                localizedReason:
                    'Confirm it’s you to unlock your 5Star Wireless account.');
          } on PlatformException {
            _model.bioOk = false;
          }
          safeSetState(() {});
        }

        if (_model.bioOk == true) {
          context.goNamed(HomePageWidget.routeName);
        } else {
          context.pushNamed(WelcomepageWidget.routeName);
        }
      } else {
        context.goNamed(WelcomepageWidget.routeName);
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
            children: [],
          ),
        ),
      ),
    );
  }
}
