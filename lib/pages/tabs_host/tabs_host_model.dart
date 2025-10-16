import '/flutter_flow/flutter_flow_util.dart';
import '/pages/bottom_nav/bottom_nav_widget.dart';
import '/index.dart';
import 'tabs_host_widget.dart' show TabsHostWidget;
import 'package:flutter/material.dart';

class TabsHostModel extends FlutterFlowModel<TabsHostWidget> {
  ///  State fields for stateful widgets in this page.

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
