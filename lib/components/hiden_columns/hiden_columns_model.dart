import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hiden_columns_widget.dart' show HidenColumnsWidget;
import 'package:flutter/material.dart';

class HidenColumnsModel extends FlutterFlowModel<HidenColumnsWidget> {
  ///  Local state fields for this component.

  List<ColumnModelStruct> columnsVisibleStatus = [];
  void addToColumnsVisibleStatus(ColumnModelStruct item) =>
      columnsVisibleStatus.add(item);
  void removeFromColumnsVisibleStatus(ColumnModelStruct item) =>
      columnsVisibleStatus.remove(item);
  void removeAtIndexFromColumnsVisibleStatus(int index) =>
      columnsVisibleStatus.removeAt(index);
  void insertAtIndexInColumnsVisibleStatus(int index, ColumnModelStruct item) =>
      columnsVisibleStatus.insert(index, item);
  void updateColumnsVisibleStatusAtIndex(
          int index, Function(ColumnModelStruct) updateFn) =>
      columnsVisibleStatus[index] = updateFn(columnsVisibleStatus[index]);

  int index = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<ColumnModelStruct, bool> checkboxValueMap = {};
  List<ColumnModelStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
