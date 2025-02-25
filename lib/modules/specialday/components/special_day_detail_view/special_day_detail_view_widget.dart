import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/special_day_action/special_day_action_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'special_day_detail_view_model.dart';
export 'special_day_detail_view_model.dart';

class SpecialDayDetailViewWidget extends StatefulWidget {
  const SpecialDayDetailViewWidget({
    super.key,
    this.type,
    this.types,
    this.details,
    this.specialDayId,
    this.detailsSpecial,
  });

  final Flag? type;
  final FlagStruct? types;
  final SpecialDayDetailsModelStruct? details;
  final int? specialDayId;
  final SpecialDayModelStruct? detailsSpecial;

  @override
  State<SpecialDayDetailViewWidget> createState() =>
      _SpecialDayDetailViewWidgetState();
}

class _SpecialDayDetailViewWidgetState
    extends State<SpecialDayDetailViewWidget> {
  late SpecialDayDetailViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialDayDetailViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().loading = false;
      safeSetState(() {});
      _model.apiResultSpecialDayView =
          await SpecialDayGroup.sepcialDayIdCall.call(
        id: widget.specialDayId,
        includeSpecialDayDetail: true,
        search: '%${_model.textController3.text}%',
      );

      if ((_model.apiResultSpecialDayView?.succeeded ?? true)) {
        _model.specialDayDetail = (getJsonField(
          (_model.apiResultSpecialDayView?.jsonBody ?? ''),
          r'''$.SpecialDay[:].SpecialDayDetails''',
          true,
        )!
                .toList()
                .map<SpecialDayDetailsModelStruct?>(
                    SpecialDayDetailsModelStruct.maybeFromMap)
                .toList() as Iterable<SpecialDayDetailsModelStruct?>)
            .withoutNulls
            .toList()
            .cast<SpecialDayDetailsModelStruct>();
        _model.specailDay = SpecialDayModelStruct.maybeFromMap(getJsonField(
          (_model.apiResultSpecialDayView?.jsonBody ?? ''),
          r'''$.SpecailDay''',
        ));
        safeSetState(() {});
        safeSetState(() {
          _model.nameTextController?.text = getJsonField(
            (_model.apiResultSpecialDayView?.jsonBody ?? ''),
            r'''$.SpecialDay[:].Name''',
          ).toString().toString();
        });
        safeSetState(() {
          _model.descriptionTextController?.text = valueOrDefault<String>(
            getJsonField(
              (_model.apiResultSpecialDayView?.jsonBody ?? ''),
              r'''$.SpecialDay[:].Description''',
            )?.toString().toString(),
            '-',
          );
        });
        FFAppState().loading = true;
        safeSetState(() {});
      }
    });

    _model.nameTextController ??=
        TextEditingController(text: _model.specailDay?.name);
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??=
        TextEditingController(text: _model.specailDay?.description);
    _model.descriptionFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
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
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 40.0,
                hoverColor: FlutterFlowTheme.of(context).alternate,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                showLoadingIndicator: true,
                onPressed: () async {
                  context.safePop();
                },
              ),
              Text(
                () {
                  if (widget.type == Flag.Add) {
                    return 'Add Special Day';
                  } else if (widget.type == Flag.Update) {
                    return 'Update Special Day';
                  } else if (widget.type == Flag.Delete) {
                    return 'Delete Special Day';
                  } else {
                    return 'View Special Day';
                  }
                }(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 330.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '4bns1wnl' /* Special Day */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'uodbbkq9' /* Name */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'yodbjsgb' /*  * */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              TextFormField(
                                                controller:
                                                    _model.nameTextController,
                                                focusNode: _model.nameFocusNode,
                                                autofocus: false,
                                                readOnly: () {
                                                  if (widget.type ==
                                                      Flag.Add) {
                                                    return (FFAppState().view ==
                                                        true);
                                                  } else if (widget.type ==
                                                      Flag.Update) {
                                                    return (FFAppState().view !=
                                                        false);
                                                  } else if (widget.type ==
                                                      Flag.Delete) {
                                                    return (FFAppState().view ==
                                                        false);
                                                  } else {
                                                    return (FFAppState().view ==
                                                        false);
                                                  }
                                                }(),
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
                                                          ),
                                                  alignLabelWithHint: true,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
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
                                                          .fromSTEB(16.0, 19.0,
                                                              16.0, 19.0),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
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
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'dumuttez' /* Description */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'idp79c46' /*   */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
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
                                                readOnly: () {
                                                  if (widget.type ==
                                                      Flag.Add) {
                                                    return (FFAppState().view ==
                                                        true);
                                                  } else if (widget.type ==
                                                      Flag.Update) {
                                                    return (FFAppState().view !=
                                                        false);
                                                  } else if (widget.type ==
                                                      Flag.Delete) {
                                                    return (FFAppState().view ==
                                                        false);
                                                  } else {
                                                    return (FFAppState().view ==
                                                        false);
                                                  }
                                                }(),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                          .fromSTEB(16.0, 19.0,
                                                              16.0, 19.0),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLines: 3,
                                                keyboardType:
                                                    TextInputType.name,
                                                validator: _model
                                                    .descriptionTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
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
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'iz9nw9cp' /* Calendars */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController3,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController3',
                                                Duration(milliseconds: 1000),
                                                () async {
                                                  FFAppState().loading = false;
                                                  safeSetState(() {});
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 600));
                                                  _model.search =
                                                      await SpecialDayGroup
                                                          .sepcialDayIdCall
                                                          .call(
                                                    id: widget.specialDayId,
                                                    includeSpecialDayDetail:
                                                        true,
                                                    search:
                                                        '%${_model.textController3.text}%',
                                                  );

                                                  if ((_model
                                                          .search?.succeeded ??
                                                      true)) {
                                                    _model.specialDayDetail =
                                                        (getJsonField(
                                                      (_model.search
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.SpecialDay[:].SpecialDayDetails''',
                                                      true,
                                                    )!
                                                                    .toList()
                                                                    .map<SpecialDayDetailsModelStruct?>(
                                                                        SpecialDayDetailsModelStruct
                                                                            .maybeFromMap)
                                                                    .toList()
                                                                as Iterable<
                                                                    SpecialDayDetailsModelStruct?>)
                                                            .withoutNulls
                                                            .toList()
                                                            .cast<
                                                                SpecialDayDetailsModelStruct>();
                                                    _model.updatePage(() {});
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
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'xfz6dmlv' /* Search */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
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
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                suffixIcon: _model
                                                        .textController3!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model.textController3
                                                              ?.clear();
                                                          FFAppState().loading =
                                                              false;
                                                          safeSetState(() {});
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      600));
                                                          _model.search =
                                                              await SpecialDayGroup
                                                                  .sepcialDayIdCall
                                                                  .call(
                                                            id: widget
                                                                .specialDayId,
                                                            includeSpecialDayDetail:
                                                                true,
                                                            search:
                                                                '%${_model.textController3.text}%',
                                                          );

                                                          if ((_model.search
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.specialDayDetail =
                                                                (getJsonField(
                                                              (_model.search
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.SpecialDay[:].SpecialDayDetails''',
                                                              true,
                                                            )!
                                                                        .toList()
                                                                        .map<SpecialDayDetailsModelStruct?>(
                                                                            SpecialDayDetailsModelStruct.maybeFromMap)
                                                                        .toList() as Iterable<SpecialDayDetailsModelStruct?>)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .cast<SpecialDayDetailsModelStruct>();
                                                            _model.updatePage(
                                                                () {});
                                                            FFAppState()
                                                                .loading = true;
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                              textAlign: TextAlign.start,
                                              maxLines: null,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textController3Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((widget.type == Flag.Add) ||
                                                (widget.type == Flag.Update)
                                            ? true
                                            : false)
                                          wrapWithModel(
                                            model: _model
                                                .primaryButtonWithIconModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: PrimaryButtonWithIconWidget(
                                              tbName: 'Add',
                                              btIcon: Icon(
                                                Icons.add_box,
                                              ),
                                              btAction: () async {
                                                context.pushNamed(
                                                  SpecialDayDetailPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'types': serializeParam(
                                                      Flag.Add,
                                                      ParamType.Enum,
                                                    ),
                                                    'id': serializeParam(
                                                      widget.specialDayId,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              buttonSize: 40.0,
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              icon: FaIcon(
                                                FontAwesomeIcons.slidersH,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .dataSpecailDay
                                                      .elementAtOrNull(0),
                                                  'No.',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6xessnot' /* Name */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gk33abp3' /* Start Date */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'om9dxfbm' /* End Date */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      Expanded(
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState().loading) {
                                                    return Builder(
                                                      builder: (context) {
                                                        final specialDayDetials =
                                                            _model
                                                                .specialDayDetail
                                                                .toList();
                                                        if (specialDayDetials
                                                            .isEmpty) {
                                                          return NoDataFoundedWidget();
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              specialDayDetials
                                                                  .length,
                                                          itemBuilder: (context,
                                                              specialDayDetialsIndex) {
                                                            final specialDayDetialsItem =
                                                                specialDayDetials[
                                                                    specialDayDetialsIndex];
                                                            return Container(
                                                              height: 45.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          100.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed:
                                                                          () async {
                                                                        if (!((widget.type == Flag.View) ||
                                                                            (widget.type ==
                                                                                Flag.Delete))) {
                                                                          await showAlignedDialog(
                                                                            barrierColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            isGlobal:
                                                                                false,
                                                                            avoidOverflow:
                                                                                true,
                                                                            targetAnchor:
                                                                                AlignmentDirectional(1.0, 1.0).resolve(Directionality.of(context)),
                                                                            followerAnchor:
                                                                                AlignmentDirectional(-1.0, -1.0).resolve(Directionality.of(context)),
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Material(
                                                                                color: Colors.transparent,
                                                                                child: SpecialDayActionWidget(
                                                                                  actionEdit: () async {
                                                                                    Navigator.pop(context);

                                                                                    context.pushNamed(
                                                                                      SpecialDayDetailPageWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'types': serializeParam(
                                                                                          Flag.Update,
                                                                                          ParamType.Enum,
                                                                                        ),
                                                                                        'id': serializeParam(
                                                                                          specialDayDetialsItem.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'detailsSpecial': serializeParam(
                                                                                          specialDayDetialsItem,
                                                                                          ParamType.DataStruct,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                          duration: Duration(milliseconds: 0),
                                                                                        ),
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  actionDelete: () async {
                                                                                    Navigator.pop(context);

                                                                                    context.pushNamed(
                                                                                      SpecialDayDetailPageWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'types': serializeParam(
                                                                                          Flag.Delete,
                                                                                          ParamType.Enum,
                                                                                        ),
                                                                                        'id': serializeParam(
                                                                                          specialDayDetialsItem.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'detailsSpecial': serializeParam(
                                                                                          specialDayDetialsItem,
                                                                                          ParamType.DataStruct,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                          duration: Duration(milliseconds: 0),
                                                                                        ),
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  actionView: () async {
                                                                                    context.pushNamed(
                                                                                      SpecialDayDetailPageWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'types': serializeParam(
                                                                                          Flag.View,
                                                                                          ParamType.Enum,
                                                                                        ),
                                                                                        'id': serializeParam(
                                                                                          specialDayDetialsItem.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                          duration: Duration(milliseconds: 0),
                                                                                        ),
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      (specialDayDetialsIndex +
                                                                              1)
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
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
                                                                      valueOrDefault<
                                                                          String>(
                                                                        specialDayDetialsItem
                                                                            .specialDayId,
                                                                        '-',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
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
                                                                      valueOrDefault<
                                                                          String>(
                                                                        specialDayDetialsItem
                                                                            .startDate,
                                                                        '-',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
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
                                                                      valueOrDefault<
                                                                          String>(
                                                                        specialDayDetialsItem
                                                                            .endDate,
                                                                        '-',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        16.0)),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 300.0,
                                                        height: 300.0,
                                                        child: custom_widgets
                                                            .LoadingIndicatorWidget(
                                                          width: 300.0,
                                                          height: 300.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 24.0)),
            ),
          ),
          Builder(
            builder: (context) {
              if ((widget.type == Flag.Add) ||
                  (widget.type == Flag.Update) ||
                  (widget.type == Flag.Delete)) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.secoundaryButtonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: SecoundaryButtonWidget(
                        btName: 'Cancel',
                        btAction: () async {
                          context.safePop();
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.primaryButtonModel,
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
                            _model.add =
                                await SpecialDayGroup.createSpecialDayCall.call(
                              name: _model.nameTextController.text,
                              description:
                                  _model.descriptionTextController.text,
                            );

                            _shouldSetState = true;
                            if (!(_model.add?.succeeded ?? true)) {
                              await action_blocks.handleExceptions(context);
                            }
                          } else if (widget.type == Flag.Delete) {
                            _model.delete =
                                await SpecialDayGroup.deleteSpecialDayCall.call(
                              id: widget.specialDayId,
                            );

                            _shouldSetState = true;
                            if ((_model.delete?.succeeded ?? true)) {
                              context.pushNamed(
                                SpecailDayListWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              await action_blocks.handleExceptions(context);
                            }

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            _model.update =
                                await SpecialDayGroup.updateSpecialDayCall.call(
                              id: widget.specialDayId,
                              name: _model.nameTextController.text,
                              description:
                                  _model.descriptionTextController.text,
                            );

                            _shouldSetState = true;
                            if (!(_model.update?.succeeded ?? true)) {
                              await action_blocks.handleExceptions(context);
                            }
                          }

                          FFAppState().specialDayNameStore =
                              _model.nameTextController.text;
                          safeSetState(() {});

                          context.pushNamed(
                            SpecailDayListWidget.routeName,
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
                  ].divide(SizedBox(width: 16.0)),
                );
              } else {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    wrapWithModel(
                      model: _model.secoundaryButtonModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: SecoundaryButtonWidget(
                        btName: 'Cancel',
                        btAction: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                );
              }
            },
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
