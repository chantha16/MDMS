import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'time_band_model.dart';
export 'time_band_model.dart';

class TimeBandWidget extends StatefulWidget {
  const TimeBandWidget({
    super.key,
    this.itemIndex,
  });

  final int? itemIndex;

  @override
  State<TimeBandWidget> createState() => _TimeBandWidgetState();
}

class _TimeBandWidgetState extends State<TimeBandWidget> {
  late TimeBandModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = false;
      safeSetState(() {});
      _model.timeBand = await TimeBandGroup.readAllTimeBandCall.call(
        search: '%${_model.searchTextController.text}%',
      );

      if ((_model.timeBand?.succeeded ?? true)) {
        _model.timeBandModel = (getJsonField(
          (_model.timeBand?.jsonBody ?? ''),
          r'''$.TimeBand''',
          true,
        )!
                .toList()
                .map<TimeBandModelStruct?>(TimeBandModelStruct.maybeFromMap)
                .toList() as Iterable<TimeBandModelStruct?>)
            .withoutNulls
            .toList()
            .cast<TimeBandModelStruct>();
        safeSetState(() {});
        FFAppState().isLoading = true;
        safeSetState(() {});
      }
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 1100.0,
        height: 800.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            controller: _model.searchTextController,
                            focusNode: _model.searchFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                FFAppState().isLoading = false;
                                safeSetState(() {});
                                _model.searchTimeBand = await TimeBandGroup
                                    .readAllTimeBandCall
                                    .call(
                                  search:
                                      '%${_model.searchTextController.text}%',
                                  limit: 2500,
                                  offset: 0,
                                  includeTimeBandAttributes: false,
                                );

                                if ((_model.searchTimeBand?.succeeded ??
                                    true)) {
                                  _model.timeBandModel = (getJsonField(
                                    (_model.searchTimeBand?.jsonBody ?? ''),
                                    r'''$.TimeBand''',
                                    true,
                                  )!
                                              .toList()
                                              .map<TimeBandModelStruct?>(
                                                  TimeBandModelStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<TimeBandModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<TimeBandModelStruct>();
                                  safeSetState(() {});
                                  FFAppState().isLoading = true;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'tyj6v1yz' /* Search */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              suffixIcon: _model
                                      .searchTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.searchTextController?.clear();
                                        FFAppState().isLoading = false;
                                        safeSetState(() {});
                                        _model.searchTimeBand =
                                            await TimeBandGroup
                                                .readAllTimeBandCall
                                                .call(
                                          search:
                                              '%${_model.searchTextController.text}%',
                                          limit: 2500,
                                          offset: 0,
                                          includeTimeBandAttributes: false,
                                        );

                                        if ((_model.searchTimeBand?.succeeded ??
                                            true)) {
                                          _model.timeBandModel = (getJsonField(
                                            (_model.searchTimeBand?.jsonBody ??
                                                ''),
                                            r'''$.TimeBand''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<TimeBandModelStruct?>(
                                                          TimeBandModelStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      TimeBandModelStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<TimeBandModelStruct>();
                                          safeSetState(() {});
                                          FFAppState().isLoading = true;
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.searchTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 100.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          hoverColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '8c4sll3j' /* No */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'q1wt0x07' /* Name */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'mdc5l0ca' /* Start Time */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '235eh6zv' /* End Time */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'oynmq76n' /* Description */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().loading) {
                              return Builder(
                                builder: (context) {
                                  final model = _model.timeBandModel.toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: model.length,
                                    itemBuilder: (context, modelIndex) {
                                      final modelItem = model[modelIndex];
                                      return Container(
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: functions.isOdd(modelIndex)
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.findID =
                                                  await TimeBandGroup
                                                      .readTimeBandByIdCall
                                                      .call(
                                                id: modelItem.id,
                                              );

                                              if ((_model.findID?.succeeded ??
                                                  true)) {
                                                context.safePop();
                                                FFAppState()
                                                    .updateTimeOfUseDetailAtIndex(
                                                  widget.itemIndex!,
                                                  (e) => e
                                                    ..timeBandId = getJsonField(
                                                      (_model.findID
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.TimeBand.Id''',
                                                    )
                                                    ..timeBand =
                                                        TimeBandModelStruct
                                                            .maybeFromMap(
                                                                getJsonField(
                                                      (_model.findID
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.TimeBand''',
                                                    )),
                                                );
                                                FFAppState()
                                                    .updateTimeOfUseDetailListAtIndex(
                                                  widget.itemIndex!,
                                                  (e) => e
                                                    ..timeBandId = getJsonField(
                                                      (_model.findID
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.TimeBand.Id''',
                                                    ),
                                                );
                                                FFAppState()
                                                    .updateTimeBandAtIndex(
                                                  widget.itemIndex!,
                                                  (_) => TimeBandModelStruct
                                                      .maybeFromMap(
                                                          getJsonField(
                                                    (_model.findID?.jsonBody ??
                                                        ''),
                                                    r'''$.TimeBand''',
                                                  ))!,
                                                );
                                                FFAppState().update(() {});
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      (_model.findID
                                                              ?.exceptionMessage ??
                                                          ''),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      (_model.offset +
                                                              modelIndex +
                                                              1)
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Text(
                                                    modelItem.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    modelItem.startTime,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    modelItem.endTime,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 11,
                                                  child: Text(
                                                    modelItem.description,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              return Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  child: custom_widgets.LoadingIndicatorWidget(
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
