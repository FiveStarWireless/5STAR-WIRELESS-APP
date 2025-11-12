import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/old/bottom_nav/bottom_nav_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_list_model.dart';
export 'product_list_model.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  static String routeName = 'ProductList';
  static String routePath = '/productList';

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late ProductListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userRecord =
          await UsersRecord.getDocumentOnce(currentUserReference!);
      FFAppState().favoriteIds =
          _model.userRecord!.wishlistIds.toList().cast<String>();
      safeSetState(() {});
      FFAppState().cartIds = _model.userRecord!.cartIds.toList().cast<String>();
      safeSetState(() {});
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
          backgroundColor: Color(0xFF07BCFD),
          automaticallyImplyLeading: false,
          title: Text(
            'All Products',
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
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(ShopifyProductsListCall.call()))
                        .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF07BCFD),
                              ),
                            ),
                          ),
                        );
                      }
                      final gridViewShopifyProductsListResponse =
                          snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final items = getJsonField(
                            gridViewShopifyProductsListResponse.jsonBody,
                            r'''$.data.products.edges''',
                          ).toList();

                          return RefreshIndicator(
                            onRefresh: () async {
                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15.0,
                                mainAxisSpacing: 15.0,
                                childAspectRatio: 0.7,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: items.length,
                              itemBuilder: (context, itemsIndex) {
                                final itemsItem = items[itemsIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FFAppState().isDarkMode
                                        ? Colors.black
                                        : Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.8,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(14.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          getJsonField(
                                            itemsItem,
                                            r'''$.node.featuredImage.url''',
                                          ).toString(),
                                          width: 180.0,
                                          height: 180.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        getJsonField(
                                          itemsItem,
                                          r'''$.node.title''',
                                        ).toString(),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          '\$${getJsonField(
                                            itemsItem,
                                            r'''$.node.priceRange.minVariantPrice.amount''',
                                          ).toString()}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if (FFAppState()
                                                    .favoriteIds
                                                    .contains(getJsonField(
                                                      itemsItem,
                                                      r'''$.node.id''',
                                                    ).toString()) ==
                                                false)
                                              Icon(
                                                Icons.star_border_rounded,
                                                color: Color(0xFF07BCFD),
                                                size: 25.0,
                                              ),
                                            if (FFAppState()
                                                    .favoriteIds
                                                    .contains(getJsonField(
                                                      itemsItem,
                                                      r'''$.node.id''',
                                                    ).toString()) ==
                                                true)
                                              Icon(
                                                Icons.star_rate_rounded,
                                                color: Color(0xFF07BCFD),
                                                size: 25.0,
                                              ),
                                            if (FFAppState()
                                                    .cartIds
                                                    .contains(getJsonField(
                                                      itemsItem,
                                                      r'''$.node.id''',
                                                    ).toString()) ==
                                                false)
                                              Icon(
                                                Icons.add_shopping_cart_rounded,
                                                color: Color(0xFF07BCFD),
                                                size: 25.0,
                                              ),
                                            if (FFAppState()
                                                    .cartIds
                                                    .contains(getJsonField(
                                                      itemsItem,
                                                      r'''$.node.id''',
                                                    ).toString()) ==
                                                true)
                                              Icon(
                                                Icons
                                                    .remove_shopping_cart_rounded,
                                                color: Color(0xFF07BCFD),
                                                size: 25.0,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomNavModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavWidget(
                  onStoreTap: () async {},
                  onServicesTap: () async {},
                  onCartTap: () async {},
                  onHomeTap: () async {},
                  onUserTap: () async {},
                  onFaveTap: () async {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
