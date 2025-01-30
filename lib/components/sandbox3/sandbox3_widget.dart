import '/components/data_table/data_table/data_table_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'sandbox3_model.dart';
export 'sandbox3_model.dart';

class Sandbox3Widget extends StatefulWidget {
  const Sandbox3Widget({super.key});

  @override
  State<Sandbox3Widget> createState() => _Sandbox3WidgetState();
}

class _Sandbox3WidgetState extends State<Sandbox3Widget> {
  late Sandbox3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sandbox3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().columnNameState = functions
          .apiResponseKey(FFAppState().SampleDummyJson2.toList())
          .toList()
          .cast<String>();
      FFAppState().rowItemState = functions
          .apiResponseValue(FFAppState().SampleDummyJson2.toList())
          .toList()
          .cast<dynamic>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.dataTableModel,
                    updateCallback: () => safeSetState(() {}),
                    child: DataTableWidget(
                      hidenCheckBox: false,
                      columnNames: FFAppState().columnNameState,
                      rowItems: FFAppState().SampleDummyJson2,
                      numberItems: FFAppState().SampleDummyJson1,
                      totalPage: 10,
                      currentPage: 1,
                      onNextPage: () async {},
                      onPreviousPage: () async {},
                      onSelectedItems: () async {},
                      onRowTap: () async {},
                      onSort: () async {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
