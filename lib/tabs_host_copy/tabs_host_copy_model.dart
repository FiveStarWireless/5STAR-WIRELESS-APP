import '/components/main_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabs_host_copy_widget.dart' show TabsHostCopyWidget;
import 'package:flutter/material.dart';

class TabsHostCopyModel extends FlutterFlowModel<TabsHostCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFcmToken] action in TabsHostCopy widget.
  String? tokenOut;
  // State field(s) for tabsPager widget.
  PageController? tabsPagerController;

  int get tabsPagerCurrentIndex => tabsPagerController != null &&
          tabsPagerController!.hasClients &&
          tabsPagerController!.page != null
      ? tabsPagerController!.page!.round()
      : 0;
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
