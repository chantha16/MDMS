import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'c_filter_v1_model.dart';
export 'c_filter_v1_model.dart';

class CFilterV1Widget extends StatefulWidget {
  const CFilterV1Widget({
    super.key,
    this.types,
    this.deviceId,
    required this.limit,
    required this.offset,
  });

  final FlagStruct? types;
  final String? deviceId;
  final int? limit;
  final int? offset;

  @override
  State<CFilterV1Widget> createState() => _CFilterV1WidgetState();
}

class _CFilterV1WidgetState extends State<CFilterV1Widget> {
  late CFilterV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CFilterV1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultkuv = await DevicesGroup.readDeviceByIdCall.call();

      if ((_model.apiResultkuv?.succeeded ?? true)) {
        FFAppState().deviceModel = (getJsonField(
          (_model.apiResultkuv?.jsonBody ?? ''),
          r'''$.Device''',
          true,
        )!
                .toList()
                .map<DeviceModelStruct?>(DeviceModelStruct.maybeFromMap)
                .toList() as Iterable<DeviceModelStruct?>)
            .withoutNulls
            .toList()
            .cast<DeviceModelStruct>();
        safeSetState(() {});
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
      child: Container(
        width: 285.0,
        height: 350.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: FlutterFlowDropDown<String>(
                          multiSelectController: _model.phaseValueController ??=
                              FormListFieldController<String>(null),
                          options: List<String>.from(_model.phase),
                          optionLabels: _model.phase,
                          maxHeight: 400.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'bl4yfly2' /* Phase */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'e7uszrz7' /* Search */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: true,
                          isMultiSelect: true,
                          onMultiSelectChanged: (val) =>
                              safeSetState(() => _model.phaseValue = val),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: FlutterFlowDropDown<String>(
                          multiSelectController: _model.unitsValueController ??=
                              FormListFieldController<String>(null),
                          options: List<String>.from(_model.units),
                          optionLabels: _model.units,
                          maxHeight: 400.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'kctgzec3' /* Units */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'wmcrmpgv' /* Search */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: true,
                          isMultiSelect: true,
                          onMultiSelectChanged: (val) =>
                              safeSetState(() => _model.unitsValue = val),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: FlutterFlowDropDown<String>(
                          multiSelectController:
                              _model.flowDirectionValueController ??=
                                  FormListFieldController<String>(null),
                          options: List<String>.from(_model.flowDirection),
                          optionLabels: _model.flowDirection,
                          maxHeight: 400.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'yuocxwxn' /* FlowDirection */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            '43oecpie' /* Search */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: true,
                          isMultiSelect: true,
                          onMultiSelectChanged: (val) => safeSetState(
                              () => _model.flowDirectionValue = val),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: FlutterFlowDropDown<String>(
                          multiSelectController:
                              _model.apportionPolicyValueController ??=
                                  FormListFieldController<String>(null),
                          options: List<String>.from(_model.apportionPolicy),
                          optionLabels: _model.apportionPolicy,
                          maxHeight: 400.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'a4pjdezm' /* ApportionPolicy */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'p9vbmgez' /* Search */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: true,
                          isMultiSelect: true,
                          onMultiSelectChanged: (val) => safeSetState(
                              () => _model.apportionPolicyValue = val),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    wrapWithModel(
                      model: _model.primaryButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: PrimaryButtonWidget(
                        tbName: 'Ok',
                        btAction: () async {
                          FFAppState().storFilterMetrics = [];
                          safeSetState(() {});
                          _model.apiReadMetricsIdv1 = await DevicesGroup
                              .readDeviceMetricsByIdVTowCall
                              .call(
                            id: widget.deviceId,
                            whereJson: functions.queryFilterDMetrics(
                                FFAppState().dEndDate,
                                FFAppState().dStartDate,
                                _model.unitsValue?.toList(),
                                _model.phaseValue?.toList(),
                                _model.apportionPolicyValue?.toList(),
                                _model.flowDirectionValue?.toList()),
                            limit: widget.limit,
                            offset: widget.offset,
                          );

                          FFAppState().storeJsonData =
                              (_model.apiReadMetricsIdv1?.jsonBody ?? '');
                          FFAppState().jsonbodyStore = functions.filterMetrics(
                              (_model.apiReadMetricsIdv1?.jsonBody ?? ''),
                              FFAppState().nameList.toList(),
                              '',
                              5,
                              0);
                          FFAppState().update(() {});
                          FFAppState().dMetricsModel = (getJsonField(
                            FFAppState().storeJsonData,
                            r'''$.DeviceMetrics.Metrics''',
                            true,
                          )!
                                  .toList()
                                  .map<MetricsStruct?>(
                                      MetricsStruct.maybeFromMap)
                                  .toList() as Iterable<MetricsStruct?>)
                              .withoutNulls
                              .toList()
                              .cast<MetricsStruct>();
                          FFAppState().storFilterMetrics = (getJsonField(
                            FFAppState().storeJsonData,
                            r'''$.DeviceMetrics.Metrics''',
                            true,
                          )!
                                  .toList()
                                  .map<MetricsStruct?>(
                                      MetricsStruct.maybeFromMap)
                                  .toList() as Iterable<MetricsStruct?>)
                              .withoutNulls
                              .toList()
                              .cast<MetricsStruct>();
                          FFAppState().totalPage = getJsonField(
                            (_model.apiReadMetricsIdv1?.jsonBody ?? ''),
                            r'''$.DeviceMetrics.Paging.Item.Total''',
                          );
                          FFAppState().update(() {});
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        exception: () async {},
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
