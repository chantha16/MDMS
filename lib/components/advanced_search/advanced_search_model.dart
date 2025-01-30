import '/flutter_flow/flutter_flow_util.dart';
import 'advanced_search_widget.dart' show AdvancedSearchWidget;
import 'package:flutter/material.dart';

class AdvancedSearchModel extends FlutterFlowModel<AdvancedSearchWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
