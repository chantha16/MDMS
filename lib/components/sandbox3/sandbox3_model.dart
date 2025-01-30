import '/components/data_table/data_table/data_table_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sandbox3_widget.dart' show Sandbox3Widget;
import 'package:flutter/material.dart';

class Sandbox3Model extends FlutterFlowModel<Sandbox3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for DataTable component.
  late DataTableModel dataTableModel;

  @override
  void initState(BuildContext context) {
    dataTableModel = createModel(context, () => DataTableModel());
  }

  @override
  void dispose() {
    dataTableModel.dispose();
  }
}
