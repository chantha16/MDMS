import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/components/table/table_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'sandbox1_widget.dart' show Sandbox1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Sandbox1Model extends FlutterFlowModel<Sandbox1Widget> {
  ///  Local state fields for this page.

  List<ColumnModelStruct> headers = [];
  void addToHeaders(ColumnModelStruct item) => headers.add(item);
  void removeFromHeaders(ColumnModelStruct item) => headers.remove(item);
  void removeAtIndexFromHeaders(int index) => headers.removeAt(index);
  void insertAtIndexInHeaders(int index, ColumnModelStruct item) =>
      headers.insert(index, item);
  void updateHeadersAtIndex(int index, Function(ColumnModelStruct) updateFn) =>
      headers[index] = updateFn(headers[index]);

  List<RowModelStruct> rows = [];
  void addToRows(RowModelStruct item) => rows.add(item);
  void removeFromRows(RowModelStruct item) => rows.remove(item);
  void removeAtIndexFromRows(int index) => rows.removeAt(index);
  void insertAtIndexInRows(int index, RowModelStruct item) =>
      rows.insert(index, item);
  void updateRowsAtIndex(int index, Function(RowModelStruct) updateFn) =>
      rows[index] = updateFn(rows[index]);

  int index = 0;

  List<CellModelStruct> cells = [];
  void addToCells(CellModelStruct item) => cells.add(item);
  void removeFromCells(CellModelStruct item) => cells.remove(item);
  void removeAtIndexFromCells(int index) => cells.removeAt(index);
  void insertAtIndexInCells(int index, CellModelStruct item) =>
      cells.insert(index, item);
  void updateCellsAtIndex(int index, Function(CellModelStruct) updateFn) =>
      cells[index] = updateFn(cells[index]);

  int subIndex = 0;

  List<String> headerTitle = ['Name', 'Description', 'Month Range'];
  void addToHeaderTitle(String item) => headerTitle.add(item);
  void removeFromHeaderTitle(String item) => headerTitle.remove(item);
  void removeAtIndexFromHeaderTitle(int index) => headerTitle.removeAt(index);
  void insertAtIndexInHeaderTitle(int index, String item) =>
      headerTitle.insert(index, item);
  void updateHeaderTitleAtIndex(int index, Function(String) updateFn) =>
      headerTitle[index] = updateFn(headerTitle[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Read All Seasons)] action in sandbox1 widget.
  ApiCallResponse? getSeasonResponse;
  // Stores action output result for [Custom Action - getKeyFromObject] action in sandbox1 widget.
  List<String>? columnKeys;
  // Model for Table component.
  late TableModel tableModel;

  @override
  void initState(BuildContext context) {
    tableModel = createModel(context, () => TableModel());
  }

  @override
  void dispose() {
    tableModel.dispose();
  }
}
