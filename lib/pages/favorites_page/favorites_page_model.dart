import '/flutter_flow/flutter_flow_util.dart';
import '/pages/bottom_nav/bottom_nav_widget.dart';
import 'favorites_page_widget.dart' show FavoritesPageWidget;
import 'package:flutter/material.dart';

class FavoritesPageModel extends FlutterFlowModel<FavoritesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomNav component.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    bottomNavModel.dispose();
  }
}
