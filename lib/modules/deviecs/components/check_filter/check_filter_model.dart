import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'check_filter_widget.dart' show CheckFilterWidget;
import 'package:flutter/material.dart';

class CheckFilterModel extends FlutterFlowModel<CheckFilterWidget> {
  ///  Local state fields for this component.

  List<MetricsStruct> dMetrics = [];
  void addToDMetrics(MetricsStruct item) => dMetrics.add(item);
  void removeFromDMetrics(MetricsStruct item) => dMetrics.remove(item);
  void removeAtIndexFromDMetrics(int index) => dMetrics.removeAt(index);
  void insertAtIndexInDMetrics(int index, MetricsStruct item) =>
      dMetrics.insert(index, item);
  void updateDMetricsAtIndex(int index, Function(MetricsStruct) updateFn) =>
      dMetrics[index] = updateFn(dMetrics[index]);

  List<String> listName = [];
  void addToListName(String item) => listName.add(item);
  void removeFromListName(String item) => listName.remove(item);
  void removeAtIndexFromListName(int index) => listName.removeAt(index);
  void insertAtIndexInListName(int index, String item) =>
      listName.insert(index, item);
  void updateListNameAtIndex(int index, Function(String) updateFn) =>
      listName[index] = updateFn(listName[index]);

  List<String> listCheckBox = [];
  void addToListCheckBox(String item) => listCheckBox.add(item);
  void removeFromListCheckBox(String item) => listCheckBox.remove(item);
  void removeAtIndexFromListCheckBox(int index) => listCheckBox.removeAt(index);
  void insertAtIndexInListCheckBox(int index, String item) =>
      listCheckBox.insert(index, item);
  void updateListCheckBoxAtIndex(int index, Function(String) updateFn) =>
      listCheckBox[index] = updateFn(listCheckBox[index]);

  int indexCheck = 0;

  bool isCheckBoxAlls = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for isCheckAll widget.
  bool? isCheckAllValue;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
