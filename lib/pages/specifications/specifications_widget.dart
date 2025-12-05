import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'specifications_model.dart';
export 'specifications_model.dart';

class SpecificationsWidget extends StatefulWidget {
  const SpecificationsWidget({super.key});

  @override
  State<SpecificationsWidget> createState() => _SpecificationsWidgetState();
}

class _SpecificationsWidgetState extends State<SpecificationsWidget>
    with TickerProviderStateMixin {
  late SpecificationsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecificationsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().colorOptions = functions
          .uniqueVariantOptions(
              getJsonField(
                FFAppState().selectedProduct,
                r'''$.node.variants.edges''',
                true,
              )!,
              0)
          .toList()
          .cast<String>();
      safeSetState(() {});
      FFAppState().storageOptions = functions
          .uniqueVariantOptions(
              getJsonField(
                FFAppState().selectedProduct,
                r'''$.node.variants.edges''',
                true,
              )!,
              1)
          .toList()
          .cast<String>();
      safeSetState(() {});
      FFAppState().selectedStorageVariant = null;
      FFAppState().selectedStorage = ' ';
      safeSetState(() {});
      FFAppState().selectedColorVariant = null;
      FFAppState().selectedColor = ' ';
      safeSetState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 600.0,
      decoration: BoxDecoration(
        color: FFAppState().isDarkMode
            ? Color(0xFF0F1419)
            : FlutterFlowTheme.of(context).info,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    'Choose Variants',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .fontStyle,
                          ),
                          color: FFAppState().isDarkMode
                              ? FlutterFlowTheme.of(context).info
                              : Colors.black,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation1']!),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                getJsonField(
                  FFAppState().selectedProduct,
                  r'''$.node.featuredImage.url''',
                ).toString(),
                width: 150.0,
                height: 150.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
              child: Text(
                getJsonField(
                  FFAppState().selectedProduct,
                  r'''$.node.title''',
                ).toString(),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: FFAppState().isDarkMode
                          ? FlutterFlowTheme.of(context).info
                          : Colors.black,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Text(
                  '\$',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        color: FFAppState().isDarkMode
                            ? FlutterFlowTheme.of(context).info
                            : Colors.black,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation3']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Text(
                  FFAppState().selectedStorageVariant == null
                      ? ''
                      : getJsonField(
                          FFAppState().selectedStorageVariant,
                          r'''$.price.amount''',
                        ).toString(),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        color: FFAppState().isDarkMode
                            ? FlutterFlowTheme.of(context).info
                            : Colors.black,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation4']!),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: Builder(
                      builder: (context) {
                        final colorVariants =
                            FFAppState().colorOptions.toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: colorVariants.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          itemBuilder: (context, colorVariantsIndex) {
                            final colorVariantsItem =
                                colorVariants[colorVariantsIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 5.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.lightImpact();
                                          FFAppState().selectedColor =
                                              colorVariantsItem;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 15.0,
                                          height: 15.0,
                                          decoration: BoxDecoration(
                                            color:
                                                functions.variantColorFromName(
                                                    colorVariantsItem),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: FFAppState().isDarkMode
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : Colors.black,
                                              width:
                                                  FFAppState().selectedColor ==
                                                          colorVariantsItem
                                                      ? 4.0
                                                      : 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            FFAppState().selectedColor =
                                                colorVariantsItem;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FFAppState().selectedColor ==
                                                          colorVariantsItem
                                                      ? Color(0xFF07BCFD)
                                                      : Colors.transparent,
                                            ),
                                            child: Text(
                                              colorVariantsItem,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FFAppState()
                                                            .isDarkMode
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .info
                                                        : Colors.black,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final storageVariants =
                          FFAppState().storageOptions.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: storageVariants.length,
                        separatorBuilder: (_, __) => SizedBox(height: 10.0),
                        itemBuilder: (context, storageVariantsIndex) {
                          final storageVariantsItem =
                              storageVariants[storageVariantsIndex];
                          return Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  60.0, 0.0, 25.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FFAppState().selectedStorage ==
                                          storageVariantsItem
                                      ? Color(0xFF07BCFD)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      HapticFeedback.lightImpact();
                                      FFAppState().selectedStorage =
                                          storageVariantsItem;
                                      safeSetState(() {});
                                      FFAppState().selectedStorageVariant =
                                          functions.findVariantForStorage(
                                              getJsonField(
                                                FFAppState().selectedProduct,
                                                r'''$.node.variants.edges''',
                                                true,
                                              ),
                                              storageVariantsItem)!;
                                      safeSetState(() {});
                                    },
                                    child: Text(
                                      storageVariantsItem,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: FFAppState().isDarkMode
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if ((FFAppState().selectedColor != '') &&
                    (FFAppState().selectedStorageVariant != null))
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if ((FFAppState().selectedColor != '') &&
                          (FFAppState().selectedStorageVariant != null)) {
                        HapticFeedback.lightImpact();
                        FFAppState().addToCartItems(
                            FFAppState().selectedStorageVariant);
                        safeSetState(() {});
                      }
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Color(0xFF07BCFD),
                      size: 30.0,
                    ),
                  ),
                if ((FFAppState().selectedColor != '') &&
                    (FFAppState().selectedStorageVariant != null))
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if ((FFAppState().selectedColorVariant != null) &&
                          (FFAppState().selectedStorageVariant != null)) {
                        HapticFeedback.lightImpact();
                        FFAppState().addToWishlistItems(
                            FFAppState().selectedStorageVariant);
                        safeSetState(() {});
                      }
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF07BCFD),
                      size: 30.0,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                    child: Text(
                      'Specification',
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: FFAppState().isDarkMode
                                    ? FlutterFlowTheme.of(context).info
                                    : Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation5']!),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 20.0),
                    child: Text(
                      getJsonField(
                        FFAppState().selectedProduct,
                        r'''$.node.techSpecs.value''',
                      ).toString(),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            color: FFAppState().isDarkMode
                                ? FlutterFlowTheme.of(context).info
                                : Colors.black,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation6']!),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
