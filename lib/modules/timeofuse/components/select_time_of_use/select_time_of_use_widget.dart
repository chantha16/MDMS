import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/timeofuse/components/channel/channel_widget.dart';
import '/modules/timeofuse/components/time_band/time_band_widget.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'select_time_of_use_model.dart';
export 'select_time_of_use_model.dart';

class SelectTimeOfUseWidget extends StatefulWidget {
  const SelectTimeOfUseWidget({
    super.key,
    this.itemIndex,
    this.timeBandId,
    this.channelId,
    required this.type,
  });

  final int? itemIndex;
  final int? timeBandId;
  final int? channelId;
  final Flag? type;

  @override
  State<SelectTimeOfUseWidget> createState() => _SelectTimeOfUseWidgetState();
}

class _SelectTimeOfUseWidgetState extends State<SelectTimeOfUseWidget> {
  late SelectTimeOfUseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectTimeOfUseModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.registerTextController?.text = FFAppState()
            .timeOfUseDetail
            .elementAtOrNull(widget.itemIndex!)!
            .registerDisplayCode;
      });
      _model.addToRegister('-');
      safeSetState(() {});
    });

    _model.registerTextController ??= TextEditingController();
    _model.registerFocusNode ??= FocusNode();
    _model.registerFocusNode!.addListener(() => safeSetState(() {}));
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

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (!((widget.type == Flag.View) ||
                    (widget.type == Flag.Delete))) {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: Container(
                          height: 800.0,
                          width: 1100.0,
                          child: TimeBandWidget(
                            itemIndex: widget.itemIndex,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            FFAppState()
                                .timeOfUseDetail
                                .elementAtOrNull(widget.itemIndex!)
                                ?.timeBand
                                .name,
                            'Select Time Band',
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.angleDown,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (!((widget.type == Flag.View) ||
                    (widget.type == Flag.Delete))) {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: ChannelWidget(
                          itemIndex: widget.itemIndex,
                        ),
                      );
                    },
                  );
                }
              },
              child: Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            FFAppState()
                                .timeOfUseDetail
                                .elementAtOrNull(widget.itemIndex!)
                                ?.channel
                                .code,
                            'Select Channel',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.angleDown,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.05,
            child: TextFormField(
              controller: _model.registerTextController,
              focusNode: _model.registerFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.registerTextController',
                Duration(milliseconds: 50),
                () async {
                  if (!((widget.type == Flag.View) ||
                      (widget.type == Flag.Delete))) {
                    FFAppState().updateTimeOfUseDetailAtIndex(
                      widget.itemIndex!,
                      (e) => e
                        ..registerDisplayCode =
                            _model.registerTextController.text,
                    );
                    FFAppState().updateTimeOfUseDetailListAtIndex(
                      widget.itemIndex!,
                      (e) => e
                        ..registerDisplayCode =
                            _model.registerTextController.text,
                    );
                    safeSetState(() {});
                    _model.updateRegisterAtIndex(
                      widget.itemIndex!,
                      (_) => _model.registerTextController.text,
                    );
                    safeSetState(() {});
                  }
                },
              ),
              autofocus: false,
              readOnly:
                  (widget.type == Flag.View) || (widget.type == Flag.Delete),
              obscureText: false,
              decoration: InputDecoration(
                isDense: false,
                alignLabelWithHint: false,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 18.0),
                hoverColor: FlutterFlowTheme.of(context).primaryBackground,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
              keyboardType: TextInputType.number,
              validator:
                  _model.registerTextControllerValidator.asValidator(context),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (!((widget.type == Flag.View) ||
                  (widget.type == Flag.Delete))) {
                if (widget.type == Flag.Add) {
                  FFAppState()
                      .removeAtIndexFromTimeOfUseDetail(widget.itemIndex!);
                  FFAppState()
                      .removeAtIndexFromTimeOfUseDetailList(widget.itemIndex!);
                  FFAppState().removeAtIndexFromTimeBand(widget.itemIndex!);
                  FFAppState().update(() {});
                } else {
                  FFAppState()
                      .removeAtIndexFromTimeOfUseDetail(widget.itemIndex!);
                  FFAppState().updateTimeOfUseDetailListAtIndex(
                    widget.itemIndex!,
                    (e) => e..active = false,
                  );
                  FFAppState().removeAtIndexFromTimeBand(widget.itemIndex!);
                  FFAppState().update(() {});
                }
              }
            },
            child: Icon(
              Icons.delete_forever,
              color: FlutterFlowTheme.of(context).error,
              size: 24.0,
            ),
          ),
        ),
      ].divide(SizedBox(width: 8.0)),
    );
  }
}
