import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/pages/main_nav/main_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_page_model.dart';
export 'user_page_model.dart';

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({super.key});

  static String routeName = 'UserPage';
  static String routePath = '/userPage';

  @override
  State<UserPageWidget> createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  late UserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPageModel());

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
          backgroundColor: Color(0xFF07BCFD),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Account',
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
            children: [
              Container(
                width: 394.8,
                height: MediaQuery.sizeOf(context).height * 0.75,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterFlowWebView(
                  content:
                      'https://shopify.com/authentication/74726867197/login?client_id=19876919-bc0a-4288-819d-9873d41cac6e&locale=en&redirect_uri=https%3A%2F%2Fshopify.com%2Fauthentication%2F74726867197%2Foauth%2Fauthorize%3Fclient_id%3D19876919-bc0a-4288-819d-9873d41cac6e%26locale%3Den%26nonce%3Dd70e3e38-7545-4755-8823-d599e5cb9fbe%26redirect_uri%3Dhttps%253A%252F%252Fshopify.com%252F74726867197%252Faccount%252Fcallback%253Fsource%253Dcore%26region_country%3DUS%26response_type%3Dcode%26scope%3Dopenid%2Bemail%2Bcustomer-account-api%253Afull%26state%3D01K4ZVESFTTZFDY46ZXCGY31G7&region_country=US',
                  bypass: true,
                  height: 2332.86,
                  verticalScroll: true,
                  horizontalScroll: true,
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.mainNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MainNavWidget(
                    activeIndex: 4,
                    onHomeTap: () async {},
                    onStoreTap: () async {},
                    onServicesTap: () async {},
                    onCartTap: () async {},
                    onUserTap: () async {},
                    onThemeTap: () async {},
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
