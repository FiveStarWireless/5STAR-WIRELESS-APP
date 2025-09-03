import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'welcome_terms_copy_widget.dart' show WelcomeTermsCopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class WelcomeTermsCopyModel extends FlutterFlowModel<WelcomeTermsCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for chkAgree widget.
  bool? chkAgreeValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
