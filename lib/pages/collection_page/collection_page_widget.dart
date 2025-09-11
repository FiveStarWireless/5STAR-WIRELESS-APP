import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/pages/main_nav/main_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'collection_page_model.dart';
export 'collection_page_model.dart';

class CollectionPageWidget extends StatefulWidget {
  const CollectionPageWidget({super.key});

  static String routeName = 'CollectionPage';
  static String routePath = '/collectionPage';

  @override
  State<CollectionPageWidget> createState() => _CollectionPageWidgetState();
}

class _CollectionPageWidgetState extends State<CollectionPageWidget> {
  late CollectionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CollectionPageModel());

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
              'Products',
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
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.mainNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MainNavWidget(),
                ),
              ),
              Container(
                width: 394.8,
                height: 793.2,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterFlowWebView(
                  content: 'https://5star-wireless.com/collections/all',
                  bypass: true,
                  height: 2332.86,
                  verticalScroll: true,
                  horizontalScroll: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
