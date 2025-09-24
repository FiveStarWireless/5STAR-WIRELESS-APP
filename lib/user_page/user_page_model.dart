import '/components/main_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_page_widget.dart' show UserPageWidget;
import 'package:flutter/material.dart';

class UserPageModel extends FlutterFlowModel<UserPageWidget> {
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
