import '/flutter_flow/flutter_flow_util.dart';
import 'cadd_list_widget.dart' show CaddListWidget;
import 'package:flutter/material.dart';

class CaddListModel extends FlutterFlowModel<CaddListWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
