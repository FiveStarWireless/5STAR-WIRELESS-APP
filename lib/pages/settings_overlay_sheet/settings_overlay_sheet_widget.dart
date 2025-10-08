import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'settings_overlay_sheet_model.dart';
export 'settings_overlay_sheet_model.dart';

class SettingsOverlaySheetWidget extends StatefulWidget {
  const SettingsOverlaySheetWidget({
    super.key,
    this.onThemeTap,
    this.onUserTap,
    this.onFavoriteTap,
  });

  final Future Function()? onThemeTap;
  final Future Function()? onUserTap;
  final Future Function()? onFavoriteTap;

  @override
  State<SettingsOverlaySheetWidget> createState() =>
      _SettingsOverlaySheetWidgetState();
}

class _SettingsOverlaySheetWidgetState
    extends State<SettingsOverlaySheetWidget> {
  late SettingsOverlaySheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsOverlaySheetModel());

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

    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 35.0, 95.0),
            child: Container(
              width: 50.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: FFAppState().showSettingsTray
                    ? Color(0xFF0F1115)
                    : Colors.white,
              ),
              child: Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FFAppState().isDarkMode
                            ? Color(0xFF0F1115)
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFF07BCFD),
                            size: 30.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: 50.0,
                              height: 3.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF07BCFD),
                                border: Border.all(
                                  color: Color(0xFF07BCFD),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FFAppState().isDarkMode
                            ? Color(0xFF0F1115)
                            : Colors.white,
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().isDarkMode) {
                            HapticFeedback.lightImpact();
                            FFAppState().isDarkMode = false;
                            safeSetState(() {});
                            Navigator.pop(context);
                          } else {
                            HapticFeedback.lightImpact();
                            FFAppState().isDarkMode = true;
                            safeSetState(() {});
                            Navigator.pop(context);
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!FFAppState().isDarkMode)
                              Icon(
                                Icons.light_mode_rounded,
                                color: Color(0xFF07BCFD),
                                size: 30.0,
                              ),
                            if (FFAppState().isDarkMode)
                              Icon(
                                Icons.dark_mode_rounded,
                                color: Color(0xFF07BCFD),
                                size: 30.0,
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Container(
                                width: 50.0,
                                height: 3.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF07BCFD),
                                  border: Border.all(
                                    color: Color(0xFF07BCFD),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FFAppState().isDarkMode
                            ? Color(0xFF0F1115)
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().activeTabIndex = 4;
                              safeSetState(() {});
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.person,
                              color: Color(0xFF07BCFD),
                              size: 30.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: 50.0,
                              height: 3.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF07BCFD),
                                border: Border.all(
                                  color: Color(0xFF07BCFD),
                                ),
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
          ),
        ),
      ],
    );
  }
}
