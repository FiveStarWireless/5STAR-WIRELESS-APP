import '/flutter_flow/flutter_flow_util.dart';
import '/pages/main_nav/main_nav_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainNav component.
  late MainNavModel mainNavModel;

  @override
  void initState(BuildContext context) {
    mainNavModel = createModel(context, () => MainNavModel());
  }

  @override
  void dispose() {
    mainNavModel.dispose();
  }
}
