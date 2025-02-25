import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/timeofuse/components/select_time_of_use/select_time_of_use_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'tou_details_view_model.dart';
export 'tou_details_view_model.dart';

class TouDetailsViewWidget extends StatefulWidget {
  const TouDetailsViewWidget({
    super.key,
    this.type,
    this.id,
    this.itemIndex,
  });

  final Flag? type;
  final int? id;
  final int? itemIndex;

  @override
  State<TouDetailsViewWidget> createState() => _TouDetailsViewWidgetState();
}

class _TouDetailsViewWidgetState extends State<TouDetailsViewWidget> {
  late TouDetailsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouDetailsViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.type != Flag.Add) {
        FFAppState().isLoading = false;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 300));
        _model.tou = await TimeOfUseGroup.readTimeOfUseIdCall.call(
          id: widget.id,
          includeTimeOfUseDetails: true,
        );

        if ((_model.tou?.succeeded ?? true)) {
          safeSetState(() {
            _model.codeTextController?.text = getJsonField(
              (_model.tou?.jsonBody ?? ''),
              r'''$.TimeOfUse.Code''',
            ).toString().toString();
          });
          safeSetState(() {
            _model.nameTextController?.text = getJsonField(
              (_model.tou?.jsonBody ?? ''),
              r'''$.TimeOfUse.Name''',
            ).toString().toString();
          });
          safeSetState(() {
            _model.descriptionTextController?.text = getJsonField(
              (_model.tou?.jsonBody ?? ''),
              r'''$.TimeOfUse.Description''',
            ).toString().toString();
          });
          FFAppState().timeOfUseDetail = (getJsonField(
            (_model.tou?.jsonBody ?? ''),
            r'''$.TimeOfUse.TimeOfUseDetails''',
            true,
          )!
                  .toList()
                  .map<TimeOfUseDetailsStruct?>(
                      TimeOfUseDetailsStruct.maybeFromMap)
                  .toList() as Iterable<TimeOfUseDetailsStruct?>)
              .withoutNulls
              .toList()
              .cast<TimeOfUseDetailsStruct>();
          FFAppState().TimeOfUseDetailList = (getJsonField(
            (_model.tou?.jsonBody ?? ''),
            r'''$.TimeOfUse.TimeOfUseDetails''',
            true,
          )!
                  .toList()
                  .map<TimeOfUseDetailListStruct?>(
                      TimeOfUseDetailListStruct.maybeFromMap)
                  .toList() as Iterable<TimeOfUseDetailListStruct?>)
              .withoutNulls
              .toList()
              .cast<TimeOfUseDetailListStruct>();
          FFAppState().timeBand = (getJsonField(
            (_model.tou?.jsonBody ?? ''),
            r'''$.TimeOfUse.TimeOfUseDetails[:].TimeBand''',
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
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'False',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
        }
      }
    });

    _model.codeTextController ??= TextEditingController();
    _model.codeFocusNode ??= FocusNode();

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  buttonSize: 30.0,
                  hoverColor: FlutterFlowTheme.of(context).alternate,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    context.safePop();
                    FFAppState().timeOfUseDetail = [];
                    FFAppState().TimeOfUseDetailList = [];
                    FFAppState().timeBand = [];
                    FFAppState().update(() {});
                  },
                ),
                Text(
                  () {
                    if (widget.type == Flag.Add) {
                      return 'Add TOU';
                    } else if (widget.type == Flag.Update) {
                      return 'Update TOU';
                    } else if (widget.type == Flag.Delete) {
                      return 'Delete TOU';
                    } else {
                      return 'View TOU';
                    }
                  }(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ].divide(SizedBox(width: 24.0)),
            ),
          ),
          Flexible(
            child: Builder(
              builder: (context) {
                if (widget.type == Flag.Add ? true : FFAppState().isLoading) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'gok72848' /* Code */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'v1h1nltt' /*  * */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _model.codeTextController,
                                                  focusNode:
                                                      _model.codeFocusNode,
                                                  autofocus: true,
                                                  readOnly: (widget.type ==
                                                          Flag.View) ||
                                                      (widget.type ==
                                                          Flag.Delete),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          offset:
                                                              Offset(1.0, 1.0),
                                                          blurRadius: 2.0,
                                                        )
                                                      ],
                                                    ),
                                                    alignLabelWithHint: true,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          offset:
                                                              Offset(2.0, 2.0),
                                                          blurRadius: 2.0,
                                                        )
                                                      ],
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                19.0,
                                                                16.0,
                                                                19.0),
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  maxLength: 200,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  validator: _model
                                                      .codeTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'z0ro78pv' /* Name */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'ljlqyghm' /*  * */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _model.nameTextController,
                                                  focusNode:
                                                      _model.nameFocusNode,
                                                  autofocus: false,
                                                  readOnly: (widget.type ==
                                                          Flag.View) ||
                                                      (widget.type ==
                                                          Flag.Delete),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          offset:
                                                              Offset(1.0, 1.0),
                                                          blurRadius: 2.0,
                                                        )
                                                      ],
                                                    ),
                                                    alignLabelWithHint: true,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          offset:
                                                              Offset(2.0, 2.0),
                                                          blurRadius: 2.0,
                                                        )
                                                      ],
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                19.0,
                                                                16.0,
                                                                19.0),
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  maxLength: 200,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  validator: _model
                                                      .nameTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '2fyy095c' /* Description */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _model
                                                .descriptionTextController,
                                            focusNode:
                                                _model.descriptionFocusNode,
                                            autofocus: false,
                                            readOnly: (widget.type ==
                                                    Flag.View) ||
                                                (widget.type == Flag.Delete),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                shadows: [
                                                  Shadow(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 2.0,
                                                  )
                                                ],
                                              ),
                                              alignLabelWithHint: true,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                shadows: [
                                                  Shadow(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    offset: Offset(2.0, 2.0),
                                                    blurRadius: 2.0,
                                                  )
                                                ],
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 19.0,
                                                          16.0, 19.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            maxLines: 3,
                                            maxLength: 250,
                                            maxLengthEnforcement:
                                                MaxLengthEnforcement.enforced,
                                            keyboardType: TextInputType.name,
                                            validator: _model
                                                .descriptionTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'i3iee1qq' /* Select TimeBand */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'pyfw407y' /*  * */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          if ((widget.type == Flag.Add) ||
                                              (widget.type == Flag.Update))
                                            wrapWithModel(
                                              model: _model.primaryButtonModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PrimaryButtonWidget(
                                                tbName: 'Add',
                                                btAction: () async {
                                                  FFAppState().indexColor =
                                                      FFAppState().indexColor +
                                                          1;
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .addToTimeOfUseDetail(
                                                          TimeOfUseDetailsStruct(
                                                    active: true,
                                                    timeBand:
                                                        TimeBandModelStruct(
                                                      startTime: '00:00:00',
                                                      endTime: '00:00:00',
                                                    ),
                                                    channel: ChannelStruct(),
                                                    timeBandId: 0,
                                                    channelId: 0,
                                                    priorityOrder: 1,
                                                  ));
                                                  FFAppState().addToTimeBand(
                                                      TimeBandModelStruct());
                                                  FFAppState()
                                                      .addToTimeOfUseDetailList(
                                                          TimeOfUseDetailListStruct(
                                                    priorityOrder: 1,
                                                  ));
                                                  FFAppState().update(() {});
                                                  FFAppState()
                                                      .addToListIndexColor(
                                                          FFAppState()
                                                              .indexColor);
                                                  FFAppState().update(() {});
                                                },
                                                exception: () async {},
                                              ),
                                            ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'zotzmnvp' /* TimeBand */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6vrhb4ty' /* Channel */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'mjh8m9ni' /* Register */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 24.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final timeOfUseDetial =
                                                              FFAppState()
                                                                  .timeOfUseDetail
                                                                  .toList();

                                                          return ReorderableListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            proxyDecorator: (Widget
                                                                        child,
                                                                    int index,
                                                                    Animation<
                                                                            double>
                                                                        animation) =>
                                                                Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        child),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                timeOfUseDetial
                                                                    .length,
                                                            itemBuilder: (context,
                                                                timeOfUseDetialIndex) {
                                                              final timeOfUseDetialItem =
                                                                  timeOfUseDetial[
                                                                      timeOfUseDetialIndex];
                                                              return Container(
                                                                key: ValueKey(
                                                                    "ListView_jnbonx4g" +
                                                                        '_' +
                                                                        timeOfUseDetialIndex
                                                                            .toString()),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      SelectTimeOfUseWidget(
                                                                    key: Key(
                                                                        'Keyc2o_${timeOfUseDetialIndex}_of_${timeOfUseDetial.length}'),
                                                                    itemIndex:
                                                                        timeOfUseDetialIndex,
                                                                    type: widget
                                                                        .type!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            onReorder: (int
                                                                    reorderableOldIndex,
                                                                int reorderableNewIndex) async {},
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'arlnporw' /* Time of use validate */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: custom_widgets.TOUValidationWidget(
                                        width: double.infinity,
                                        height: double.infinity,
                                        timeOfUseDetails:
                                            FFAppState().timeOfUseDetail,
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 20.0)),
                  );
                } else {
                  return Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 500.0,
                      height: 500.0,
                      child: custom_widgets.LoadingIndicatorWidget(
                        width: 500.0,
                        height: 500.0,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.secoundaryButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SecoundaryButtonWidget(
                    btName: 'Cancel',
                    btAction: () async {
                      context.safePop();
                      FFAppState().timeOfUseDetail = [];
                      FFAppState().TimeOfUseDetailList = [];
                      FFAppState().timeBand = [];
                      FFAppState().update(() {});
                    },
                  ),
                ),
                if ((widget.type == Flag.Add) ||
                    (widget.type == Flag.Update) ||
                    (widget.type == Flag.Delete))
                  wrapWithModel(
                    model: _model.primaryButtonModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: PrimaryButtonWidget(
                      tbName: 'Save',
                      btAction: () async {
                        var _shouldSetState = false;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if (widget.type == Flag.Add) {
                          if ((FFAppState().timeOfUseDetail.isNotEmpty) &&
                              (FFAppState().TimeOfUseDetailList.isNotEmpty) &&
                              (FFAppState()
                                  .timeOfUseDetail
                                  .where((e) =>
                                      e.timeBand.name != '')
                                  .toList()
                                  .isNotEmpty) &&
                              (FFAppState()
                                  .timeOfUseDetail
                                  .where((e) =>
                                      e.channel.code != '')
                                  .toList()
                                  .isNotEmpty)) {
                            if (functions.validateTimeBand(
                                    FFAppState().timeOfUseDetail.toList()) ==
                                'True') {
                              _model.add =
                                  await TimeOfUseGroup.createTimeOfUseCall.call(
                                code: _model.codeTextController.text,
                                name: _model.nameTextController.text,
                                description:
                                    _model.descriptionTextController.text,
                                dataJson: FFAppState()
                                    .TimeOfUseDetailList
                                    .map((e) => e.toMap())
                                    .toList(),
                              );

                              _shouldSetState = true;
                              if ((_model.add?.succeeded ?? true)) {
                                FFAppState().storeCode =
                                    _model.codeTextController.text;
                                safeSetState(() {});
                              } else {
                                await action_blocks.handleExceptions(
                                  context,
                                  message: valueOrDefault<String>(
                                    HandleErrorStruct.maybeFromMap(getJsonField(
                                      (_model.add?.jsonBody ?? ''),
                                      r'''$.error''',
                                    )?.toString())
                                        ?.warning,
                                    'Code field already exists. Please use a different value.',
                                  ),
                                  title: 'Warning',
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else {
                              await action_blocks.handleExceptions(
                                context,
                                message:
                                    'Some time bands in channel ${functions.validateTimeBand(FFAppState().timeOfUseDetail.toList())} do not fully cover 24/7. Please help to review again.',
                                title: 'Warning',
                              );
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                          } else {
                            await action_blocks.handleExceptions(
                              context,
                              message:
                                  'TimeBand Cannot Empty! Please Select TimeBand.',
                              title: 'Warning',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else if (widget.type == Flag.Update) {
                          if ((FFAppState().timeOfUseDetail.isNotEmpty) &&
                              (FFAppState().TimeOfUseDetailList.isNotEmpty) &&
                              (FFAppState()
                                  .timeOfUseDetail
                                  .where((e) =>
                                      e.timeBand.name != '')
                                  .toList()
                                  .isNotEmpty) &&
                              (FFAppState()
                                  .timeOfUseDetail
                                  .where((e) =>
                                      e.channel.code != '')
                                  .toList()
                                  .isNotEmpty)) {
                            if (functions.validateTimeBand(
                                    FFAppState().timeOfUseDetail.toList()) ==
                                'True') {
                              _model.update =
                                  await TimeOfUseGroup.updateTimeOfUseCall.call(
                                id: widget.id,
                                code: _model.codeTextController.text,
                                name: _model.nameTextController.text,
                                dataJson: FFAppState()
                                    .TimeOfUseDetailList
                                    .map((e) => e.toMap())
                                    .toList(),
                                description:
                                    _model.descriptionTextController.text,
                              );

                              _shouldSetState = true;
                              if ((_model.update?.succeeded ?? true)) {
                                FFAppState().storeCode =
                                    _model.codeTextController.text;
                                safeSetState(() {});
                              } else {
                                await action_blocks.handleExceptions(
                                  context,
                                  message: valueOrDefault<String>(
                                    HandleErrorStruct.maybeFromMap(getJsonField(
                                      (_model.update?.jsonBody ?? ''),
                                      r'''$.error''',
                                    )?.toString())
                                        ?.warning,
                                    'Code field already exists. Please use a different value.',
                                  ),
                                  title: 'Warning...!',
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else {
                              await action_blocks.handleExceptions(
                                context,
                                message:
                                    'Some time bands in channel ${functions.validateTimeBand(FFAppState().timeOfUseDetail.toList())} do not fully cover 24/7. Please help to review again.',
                                title: 'Warning',
                              );
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                          } else {
                            await action_blocks.handleExceptions(
                              context,
                              message:
                                  'TimeBand Cannot Empty! Please Select TimeBand.',
                              title: 'Warning',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          _model.delete =
                              await TimeOfUseGroup.deleteTimeOfUseCall.call(
                            id: widget.id,
                          );

                          _shouldSetState = true;
                          if (!(_model.delete?.succeeded ?? true)) {
                            await action_blocks.validateAuth(context);
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        }

                        FFAppState().timeOfUseDetail = [];
                        FFAppState().TimeOfUseDetailList = [];
                        FFAppState().timeBand = [];
                        FFAppState().update(() {});

                        context.pushNamed(
                          TouListWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        if (_shouldSetState) safeSetState(() {});
                      },
                      exception: () async {},
                    ),
                  ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
        ],
      ),
    );
  }
}
