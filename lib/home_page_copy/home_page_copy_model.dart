import '/components/main_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
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
