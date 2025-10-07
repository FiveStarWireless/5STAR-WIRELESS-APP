import '/flutter_flow/flutter_flow_util.dart';
import '/pages/settings_overlay_sheet/settings_overlay_sheet_widget.dart';
import 'bottom_nav_widget.dart' show BottomNavWidget;
import 'package:flutter/material.dart';

class BottomNavModel extends FlutterFlowModel<BottomNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SettingsOverlaySheet component.
  late SettingsOverlaySheetModel settingsOverlaySheetModel;

  @override
  void initState(BuildContext context) {
    settingsOverlaySheetModel =
        createModel(context, () => SettingsOverlaySheetModel());
  }

  @override
  void dispose() {
    settingsOverlaySheetModel.dispose();
  }
}
