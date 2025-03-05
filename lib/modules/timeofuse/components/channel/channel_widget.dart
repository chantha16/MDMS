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
import 'channel_model.dart';
export 'channel_model.dart';

class ChannelWidget extends StatefulWidget {
  const ChannelWidget({
    super.key,
    this.itemIndex,
  });

  final int? itemIndex;

  @override
  State<ChannelWidget> createState() => _ChannelWidgetState();
}

class _ChannelWidgetState extends State<ChannelWidget> {
  late ChannelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().loading = false;
      safeSetState(() {});
      _model.apiChannelResponse = await ChannelsGroup.readAllChannelsCall.call(
        search: '%${_model.textController.text}%',
      );

      if ((_model.apiChannelResponse?.succeeded ?? true)) {
        _model.chennel = (getJsonField(
          (_model.apiChannelResponse?.jsonBody ?? ''),
          r'''$.Channel''',
          true,
        )!
                .toList()
                .map<ChannelStruct?>(ChannelStruct.maybeFromMap)
                .toList() as Iterable<ChannelStruct?>)
            .withoutNulls
            .toList()
            .cast<ChannelStruct>();
        safeSetState(() {});
        FFAppState().loading = true;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'njr1nedm' /* Channel */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 24.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () async {
                              FFAppState().loading = false;
                              safeSetState(() {});
                              await Future.delayed(
                                  const Duration(milliseconds: 600));
                              _model.apiRequestSearch =
                                  await ChannelsGroup.readAllChannelsCall.call(
                                search: '%${_model.textController.text}%',
                              );

                              if ((_model.apiRequestSearch?.succeeded ??
                                  true)) {
                                _model.chennel = (getJsonField(
                                  (_model.apiRequestSearch?.jsonBody ?? ''),
                                  r'''$.Channel''',
                                  true,
                                )!
                                        .toList()
                                        .map<ChannelStruct?>(
                                            ChannelStruct.maybeFromMap)
                                        .toList() as Iterable<ChannelStruct?>)
                                    .withoutNulls
                                    .toList()
                                    .cast<ChannelStruct>();
                                safeSetState(() {});
                                FFAppState().loading = true;
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '6y54yrxt' /* Search */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                            suffixIcon: _model.textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController?.clear();
                                      FFAppState().loading = false;
                                      safeSetState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 600));
                                      _model.apiRequestSearch =
                                          await ChannelsGroup
                                              .readAllChannelsCall
                                              .call(
                                        search:
                                            '%${_model.textController.text}%',
                                      );

                                      if ((_model.apiRequestSearch?.succeeded ??
                                          true)) {
                                        _model.chennel = (getJsonField(
                                          (_model.apiRequestSearch?.jsonBody ??
                                              ''),
                                          r'''$.Channel''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<ChannelStruct?>(
                                                        ChannelStruct.maybeFromMap)
                                                    .toList()
                                                as Iterable<ChannelStruct?>)
                                            .withoutNulls
                                            .toList()
                                            .cast<ChannelStruct>();
                                        safeSetState(() {});
                                        FFAppState().loading = true;
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'yna2r814' /* No. */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'iuzrtmfd' /* Code */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '60d2q7ya' /* Name */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
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
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (FFAppState().loading) {
                            return Builder(
                              builder: (context) {
                                final channelAll = _model.chennel.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: channelAll.length,
                                  itemBuilder: (context, channelAllIndex) {
                                    final channelAllItem =
                                        channelAll[channelAllIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.findChannel = await ChannelsGroup
                                            .readChannelsCall
                                            .call(
                                          id: channelAllItem.id,
                                        );

                                        if ((_model.findChannel?.succeeded ??
                                            true)) {
                                          context.safePop();
                                          FFAppState()
                                              .updateTimeOfUseDetailAtIndex(
                                            widget.itemIndex!,
                                            (e) => e
                                              ..channelId = getJsonField(
                                                (_model.findChannel?.jsonBody ??
                                                    ''),
                                                r'''$.Channel[:].Id''',
                                              )
                                              ..channel = (getJsonField(
                                                (_model.findChannel?.jsonBody ??
                                                    ''),
                                                r'''$.Channel''',
                                              )
                                                          .toList()
                                                          .map<ChannelStruct?>(
                                                              ChannelStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          ChannelStruct?>)
                                                  .withoutNulls
                                                  .firstOrNull,
                                          );
                                          FFAppState()
                                              .updateTimeOfUseDetailListAtIndex(
                                            widget.itemIndex!,
                                            (e) => e
                                              ..channelId = getJsonField(
                                                (_model.findChannel?.jsonBody ??
                                                    ''),
                                                r'''$.Channel[:].Id''',
                                              ),
                                          );
                                          FFAppState().updateTimeBandAtIndex(
                                            widget.itemIndex!,
                                            (e) => e
                                              ..channelId = getJsonField(
                                                (_model.findChannel?.jsonBody ??
                                                    ''),
                                                r'''$.Channel[:].Id''',
                                              ),
                                          );
                                          FFAppState().update(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                              functions.isOdd(channelAllIndex)
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  (FFAppState().offset +
                                                          channelAllIndex +
                                                          1)
                                                      .toString(),
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
                                                flex: 1,
                                                child: Text(
                                                  channelAllItem.code,
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
                                                flex: 4,
                                                child: Text(
                                                  channelAllItem.name,
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
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 500.0,
                                height: 600.0,
                                child: custom_widgets.LoadingIndicatorWidget(
                                  width: 500.0,
                                  height: 600.0,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
