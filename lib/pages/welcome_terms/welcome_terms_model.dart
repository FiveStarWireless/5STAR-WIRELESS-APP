import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'welcome_terms_widget.dart' show WelcomeTermsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class WelcomeTermsModel extends FlutterFlowModel<WelcomeTermsWidget> {
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
