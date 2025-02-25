import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'check_filter_model.dart';
export 'check_filter_model.dart';

class CheckFilterWidget extends StatefulWidget {
  const CheckFilterWidget({
    super.key,
    required this.listNames,
    this.filter,
    required this.offset,
    required this.limit,
    required this.filterName,
  });

  final List<String>? listNames;
  final String? filter;
  final int? offset;
  final int? limit;
  final String? filterName;

  @override
  State<CheckFilterWidget> createState() => _CheckFilterWidgetState();
}

class _CheckFilterWidgetState extends State<CheckFilterWidget> {
  late CheckFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckFilterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(_model.checkboxGroupValues != null &&
          (_model.checkboxGroupValues)!.isNotEmpty)) {
        safeSetState(() {
          _model.isCheckAllValue = true;
        });
        safeSetState(() => _model.checkboxGroupValueController?.value =
            List.from(((widget.listNames!).toList().toSet().toList())));
      } else if (_model.isCheckAllValue == false) {
        FFAppState().isCheckAlls = false;
        safeSetState(() {});
        safeSetState(() {
          _model.isCheckAllValue = false;
        });
      } else {
        return;
      }
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
    context.watch<FFAppState>();
    context.watch<epower_library_llyhdh_app_state.FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
      child: Container(
        width: 200.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                    child: Checkbox(
                      value: _model.isCheckAllValue ??=
                          FFAppState().isCheckAlls,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.isCheckAllValue = newValue!);
                        if (newValue!) {
                          safeSetState(() =>
                              _model.checkboxGroupValueController?.value =
                                  List.from(((widget.listNames!)
                                      .toList()
                                      .toSet()
                                      .toList())));
                        } else {
                          safeSetState(() =>
                              _model.checkboxGroupValueController?.value = []);
                        }
                      },
                      side: BorderSide(
                        width: 2,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'bg5tb3o0' /* Select All */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 2.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            FlutterFlowCheckboxGroup(
              options:
                  ((widget.listNames!).toList().toSet().toList()).toList(),
              onChanged: (val) async {
                safeSetState(() => _model.checkboxGroupValues = val);
                FFAppState().listCheckBox =
                    _model.checkboxGroupValues!.toList().cast<String>();
                FFAppState().isCheckAlls = _model.isCheckAllValue!;
                _model.isCheckBoxAlls = _model.isCheckAllValue!;
                if (widget.filter == LabelMetrics.Units.name) {
                  FFAppState().dMetricsModel = (getJsonField(
                    functions.filterMetrics(
                        FFAppState().storeJsonData,
                        _model.checkboxGroupValues?.toList(),
                        widget.filterName,
                        widget.limit!,
                        widget.offset!),
                    r'''$.DeviceMetrics.Metrics''',
                    true,
                  )!
                          .toList()
                          .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                          .toList() as Iterable<MetricsStruct?>)
                      .withoutNulls
                      .toList()
                      .cast<MetricsStruct>();
                } else if (widget.filter == LabelMetrics.FlowDirection.name) {
                  FFAppState().dMetricsModel = (getJsonField(
                    functions.filterMetrics(
                        FFAppState().storeJsonData,
                        _model.checkboxGroupValues?.toList(),
                        widget.filterName,
                        widget.limit!,
                        widget.offset!),
                    r'''$.DeviceMetrics.Metrics''',
                    true,
                  )!
                          .toList()
                          .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                          .toList() as Iterable<MetricsStruct?>)
                      .withoutNulls
                      .toList()
                      .cast<MetricsStruct>();
                } else if (widget.filter == LabelMetrics.Phase.name) {
                  FFAppState().dMetricsModel = (getJsonField(
                    functions.filterMetrics(
                        FFAppState().storeJsonData,
                        _model.checkboxGroupValues?.toList(),
                        widget.filterName,
                        widget.limit!,
                        widget.offset!),
                    r'''$.DeviceMetrics.Metrics''',
                    true,
                  )!
                          .toList()
                          .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                          .toList() as Iterable<MetricsStruct?>)
                      .withoutNulls
                      .toList()
                      .cast<MetricsStruct>();
                } else {
                  FFAppState().dMetricsModel = (getJsonField(
                    functions.filterMetrics(
                        FFAppState().storeJsonData,
                        _model.checkboxGroupValues?.toList(),
                        widget.filterName,
                        widget.limit!,
                        widget.offset!),
                    r'''$.DeviceMetrics.Metrics''',
                    true,
                  )!
                          .toList()
                          .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                          .toList() as Iterable<MetricsStruct?>)
                      .withoutNulls
                      .toList()
                      .cast<MetricsStruct>();
                }

                if (_model.isCheckAllValue!) {
                  FFAppState().isCheckAlls = false;
                  safeSetState(() {});
                } else {
                  FFAppState().isCheckAlls = true;
                  safeSetState(() {});
                }
              },
              controller: _model.checkboxGroupValueController ??=
                  FormFieldController<List<String>>(
                List.from(FFAppState().listCheckBox ?? []),
              ),
              activeColor: FlutterFlowTheme.of(context).primary,
              checkColor: FlutterFlowTheme.of(context).info,
              checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              itemPadding: EdgeInsets.all(8.0),
              checkboxBorderRadius: BorderRadius.circular(4.0),
              initialized: _model.checkboxGroupValues != null,
            ),
          ],
        ),
      ),
    );
  }
}
