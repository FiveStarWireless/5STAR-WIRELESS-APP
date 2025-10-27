import '/flutter_flow/flutter_flow_util.dart';
import '/pages/bottom_nav/bottom_nav_widget.dart';
import 'tabs_host_copy_widget.dart' show TabsHostCopyWidget;
import 'package:flutter/material.dart';

class TabsHostCopyModel extends FlutterFlowModel<TabsHostCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - makeClientId] action in TabsHostCopy widget.
  String? newId;
  // State field(s) for tabsPager widget.
  PageController? tabsPagerController;

  int get tabsPagerCurrentIndex => tabsPagerController != null &&
          tabsPagerController!.hasClients &&
          tabsPagerController!.page != null
      ? tabsPagerController!.page!.round()
      : 0;
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
