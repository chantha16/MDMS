import '/flutter_flow/flutter_flow_util.dart';
import 'cutomize_data_table_widget.dart' show CutomizeDataTableWidget;
import 'package:flutter/material.dart';

class CutomizeDataTableModel extends FlutterFlowModel<CutomizeDataTableWidget> {
  ///  Local state fields for this component.

  List<dynamic> itemState = [];
  void addToItemState(dynamic item) => itemState.add(item);
  void removeFromItemState(dynamic item) => itemState.remove(item);
  void removeAtIndexFromItemState(int index) => itemState.removeAt(index);
  void insertAtIndexInItemState(int index, dynamic item) =>
      itemState.insert(index, item);
  void updateItemStateAtIndex(int index, Function(dynamic) updateFn) =>
      itemState[index] = updateFn(itemState[index]);

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
