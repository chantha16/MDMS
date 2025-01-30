import '/flutter_flow/flutter_flow_util.dart';
import 'event_view_widget.dart' show EventViewWidget;
import 'package:flutter/material.dart';

class EventViewModel extends FlutterFlowModel<EventViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for tpMainTap widget.
  TabController? tpMainTapController;
  int get tpMainTapCurrentIndex =>
      tpMainTapController != null ? tpMainTapController!.index : 0;

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tpMainTapController?.dispose();
  }
}
