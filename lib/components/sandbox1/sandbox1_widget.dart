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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sandbox1_model.dart';
export 'sandbox1_model.dart';

class Sandbox1Widget extends StatefulWidget {
  const Sandbox1Widget({super.key});

  @override
  State<Sandbox1Widget> createState() => _Sandbox1WidgetState();
}

class _Sandbox1WidgetState extends State<Sandbox1Widget> {
  late Sandbox1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sandbox1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getSeasonResponse = await SeasonGroup.readAllSeasonsCall.call();

      if ((_model.getSeasonResponse?.succeeded ?? true)) {
        _model.columnKeys = await actions.getKeyFromObject(
          getJsonField(
            (_model.getSeasonResponse?.jsonBody ?? ''),
            r'''$.Season''',
          ),
        );
        _model.index = 0;
        while (_model.index < _model.headerTitle.length) {
          _model.addToHeaders(ColumnModelStruct(
            id: functions.increment(_model.index),
            name: _model.headerTitle.elementAtOrNull(_model.index),
          ));
          _model.index = functions.increment(_model.index);
        }
        _model.index = 0;
        while (_model.index <
            ((_model.getSeasonResponse?.jsonBody ?? '')
                    .toList()
                    .map<SeasonModelStruct?>(SeasonModelStruct.maybeFromMap)
                    .toList() as Iterable<SeasonModelStruct?>)
                .withoutNulls
                .length) {
          _model.addToCells(CellModelStruct(
            data: SeasonModelStruct.maybeFromMap(getJsonField(
              (_model.getSeasonResponse?.jsonBody ?? ''),
              r'''$.Season''',
            ).toString())
                ?.name,
            columnId: 1,
          ));
          _model.addToCells(CellModelStruct(
            data: SeasonModelStruct.maybeFromMap(getJsonField(
              (_model.getSeasonResponse?.jsonBody ?? ''),
              r'''$.Season''',
            ).toString())
                ?.name,
            columnId: 2,
          ));
          _model.addToCells(CellModelStruct(
            data: SeasonModelStruct.maybeFromMap(getJsonField(
              (_model.getSeasonResponse?.jsonBody ?? ''),
              r'''$.Season''',
            ).toString())
                ?.name,
            columnId: 3,
          ));
          // Create row object
          _model.addToRows(RowModelStruct(
            cell: _model.cells,
            id: SeasonModelStruct.maybeFromMap(getJsonField(
              (_model.getSeasonResponse?.jsonBody ?? ''),
              r'''$.Season''',
            ))?.id,
          ));
          // Index increment
          _model.cells = [];
          _model.index = _model.index + 1;
        }
        await actions.printLog(
          'Column length: ${_model.headers.length.toString()}',
        );
        await actions.printLog(
          'Row length: ${_model.rows.length.toString()}',
        );
      }

      safeSetState(() {});
      await actions.printLog(
        'Column length: ${_model.headers.length.toString()}',
      );
      await actions.printLog(
        'Row length: ${_model.rows.length.toString()}',
      );
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
          child: wrapWithModel(
            model: _model.tableModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: TableWidget(
              columns: _model.headers,
              rows: _model.rows,
              isCheckbox: true,
              isMoreOption: true,
              isNumeric: true,
              onItemsSelected: () async {},
              onNextPage: () async {},
              onPreviousPage: () async {},
              onHiddenColumnChanged: (columns) async {
                _model.headers = _model.tableModel.columns
                    .toList()
                    .cast<ColumnModelStruct>();
                _model.rows =
                    _model.tableModel.rows.toList().cast<RowModelStruct>();
                safeSetState(() {});
              },
              onRowCheckedItem: (index, status) async {
                await actions.printLog(
                  index.toString(),
                );
                _model.updateRowsAtIndex(
                  index,
                  (e) => e..selected = status,
                );
                safeSetState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
