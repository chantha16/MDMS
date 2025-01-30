import '/components/data_table/data_table/data_table_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'sandbox3_widget.dart' show Sandbox3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
