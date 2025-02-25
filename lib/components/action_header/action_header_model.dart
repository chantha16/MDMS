import '/flutter_flow/flutter_flow_util.dart';
import 'action_header_widget.dart' show ActionHeaderWidget;
import 'package:flutter/material.dart';

class ActionHeaderModel extends FlutterFlowModel<ActionHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchTF widget.
  FocusNode? searchTFFocusNode;
  TextEditingController? searchTFTextController;
  String? Function(BuildContext, String?)? searchTFTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTFFocusNode?.dispose();
    searchTFTextController?.dispose();
  }
}
