import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'table_widget.dart' show TableWidget;
import 'package:flutter/material.dart';

class TableModel extends FlutterFlowModel<TableWidget> {
  ///  Local state fields for this component.

  bool isMoreOption = true;

  bool isSelectedAll = false;

  List<ColumnModelStruct> columns = [];
  void addToColumns(ColumnModelStruct item) => columns.add(item);
  void removeFromColumns(ColumnModelStruct item) => columns.remove(item);
  void removeAtIndexFromColumns(int index) => columns.removeAt(index);
  void insertAtIndexInColumns(int index, ColumnModelStruct item) =>
      columns.insert(index, item);
  void updateColumnsAtIndex(int index, Function(ColumnModelStruct) updateFn) =>
      columns[index] = updateFn(columns[index]);

  List<RowModelStruct> rows = [];
  void addToRows(RowModelStruct item) => rows.add(item);
  void removeFromRows(RowModelStruct item) => rows.remove(item);
  void removeAtIndexFromRows(int index) => rows.removeAt(index);
  void insertAtIndexInRows(int index, RowModelStruct item) =>
      rows.insert(index, item);
  void updateRowsAtIndex(int index, Function(RowModelStruct) updateFn) =>
      rows[index] = updateFn(rows[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
