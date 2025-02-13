import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'hiden_columns_model.dart';
export 'hiden_columns_model.dart';

class HidenColumnsWidget extends StatefulWidget {
  const HidenColumnsWidget({
    super.key,
    this.columns,
    this.onColumnVisibleChanged,
  });

  final List<ColumnModelStruct>? columns;
  final Future Function(List<ColumnModelStruct> columns)?
      onColumnVisibleChanged;

  @override
  State<HidenColumnsWidget> createState() => _HidenColumnsWidgetState();
}

class _HidenColumnsWidgetState extends State<HidenColumnsWidget> {
  late HidenColumnsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HidenColumnsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.columnsVisibleStatus =
          widget.columns!.toList().cast<ColumnModelStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 266.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 276.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Builder(
                builder: (context) {
                  final columns = _model.columnsVisibleStatus.toList();

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      16.0,
                      0,
                      16.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: columns.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.0),
                    itemBuilder: (context, columnsIndex) {
                      final columnsItem = columns[columnsIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValueMap[columnsItem] ??=
                                  !columnsItem.isHidden,
                              onChanged: (newValue) async {
                                safeSetState(() => _model
                                    .checkboxValueMap[columnsItem] = newValue!);
                                if (newValue!) {
                                  _model.updateColumnsVisibleStatusAtIndex(
                                    columnsIndex,
                                    (e) => e..isHidden = false,
                                  );
                                  safeSetState(() {});
                                  await widget.onColumnVisibleChanged?.call(
                                    _model.columnsVisibleStatus,
                                  );
                                  await actions.printLog(
                                    'params: ${(widget.columns?.elementAtOrNull(columnsIndex))?.isHidden.toString()}',
                                  );
                                } else {
                                  _model.updateColumnsVisibleStatusAtIndex(
                                    columnsIndex,
                                    (e) => e..isHidden = true,
                                  );
                                  safeSetState(() {});
                                  await widget.onColumnVisibleChanged?.call(
                                    _model.columnsVisibleStatus,
                                  );
                                  await actions.printLog(
                                    'params: ${(widget.columns?.elementAtOrNull(columnsIndex))?.isHidden.toString()}',
                                  );
                                }
                              },
                              side: BorderSide(
                                width: 2,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            columnsItem.name,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 5.0)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
