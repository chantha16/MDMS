import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/device_group/components/device_list_for_group/device_list_for_group_widget.dart';
import '/modules/schedule/components/c_schedule_action/c_schedule_action_widget.dart';
import '/modules/schedule/components/c_schedule_view/c_schedule_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'main_device_group_detial_view_model.dart';
export 'main_device_group_detial_view_model.dart';

class MainDeviceGroupDetialViewWidget extends StatefulWidget {
  const MainDeviceGroupDetialViewWidget({
    super.key,
    required this.type,
    this.deviceGroupId,
  });

  final Flag? type;
  final int? deviceGroupId;

  @override
  State<MainDeviceGroupDetialViewWidget> createState() =>
      _MainDeviceGroupDetialViewWidgetState();
}

class _MainDeviceGroupDetialViewWidgetState
    extends State<MainDeviceGroupDetialViewWidget>
    with TickerProviderStateMixin {
  late MainDeviceGroupDetialViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainDeviceGroupDetialViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.type != Flag.Add) {
        _model.loadingDevices = false;
        safeSetState(() {});
        _model.deviceGroupResult =
            await DeviceGroupGroup.readDeviceGroupByIdCall.call(
          id: widget.deviceGroupId,
          includeDevices: true,
        );

        if ((_model.deviceGroupResult?.succeeded ?? true)) {
          _model.deviceGroupModel =
              DeviceGroupModelStruct.maybeFromMap(getJsonField(
            (_model.deviceGroupResult?.jsonBody ?? ''),
            r'''$.DeviceGroup''',
          ));
          _model.devicesForRender = _model.deviceGroupModel!.devices
              .toList()
              .cast<DeviceModelStruct>();
          await _model.searchDevice(context);
          safeSetState(() {});
          FFAppState().deviceModel = _model.deviceGroupModel!.devices
              .toList()
              .cast<DeviceModelStruct>();
          safeSetState(() {});
          safeSetState(() {
            _model.nameTextController?.text = _model.deviceGroupModel!.name;
          });
          safeSetState(() {
            _model.descriptionTextController?.text =
                _model.deviceGroupModel!.description;
          });
        } else {
          return;
        }
      } else {
        FFAppState().deviceModel = [];
        safeSetState(() {});
      }

      _model.loadingDevices = true;
      safeSetState(() {});
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.deviceGroupViewDataController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textSearchTextController1 ??= TextEditingController();
    _model.textSearchFocusNode1 ??= FocusNode();
    _model.textSearchFocusNode1!.addListener(() => safeSetState(() {}));
    _model.currentPageTextController1 ??=
        TextEditingController(text: _model.currentPage.toString());
    _model.currentPageFocusNode1 ??= FocusNode();

    _model.textSearchTextController2 ??= TextEditingController();
    _model.textSearchFocusNode2 ??= FocusNode();
    _model.textSearchFocusNode2!.addListener(() => safeSetState(() {}));
    _model.currentPageTextController2 ??=
        TextEditingController(text: _model.currentPage.toString());
    _model.currentPageFocusNode2 ??= FocusNode();

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
                borderRadius: 30.0,
                buttonSize: 40.0,
                hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              Text(
                () {
                  if (widget.type == Flag.Add) {
                    return 'Add Device Group';
                  } else if (widget.type == Flag.Update) {
                    return 'Update Device Group';
                  } else if (widget.type == Flag.Delete) {
                    return 'Delete Device Group';
                  } else {
                    return 'View Device Group';
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
            child: Builder(
              builder: (context) {
                if (_model.loadingDevices) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 350.0,
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '64it1zfk' /* Device Group */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '6i2ltzu2' /* Name */,
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
                                                                'tyz5yfn4' /*  * */,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .nameTextController,
                                                      focusNode:
                                                          _model.nameFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.nameTextController',
                                                        Duration(
                                                            milliseconds: 100),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      readOnly: () {
                                                        if (widget.type ==
                                                            Flag.Add) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              true);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Update) {
                                                          return (FFAppState()
                                                                  .view !=
                                                              false);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Delete) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        } else {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        }
                                                      }(),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'iq2ma51h' /* Description */,
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
                                                                '6ha8phvz' /*   */,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .descriptionTextController,
                                                      focusNode: _model
                                                          .descriptionFocusNode,
                                                      autofocus: false,
                                                      readOnly: () {
                                                        if (widget.type ==
                                                            Flag.Add) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              true);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Update) {
                                                          return (FFAppState()
                                                                  .view !=
                                                              false);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Delete) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        } else {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        }
                                                      }(),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            true,
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
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 2.0,
                                                            )
                                                          ],
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: 3,
                                                      maxLength: 250,
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(-1.0, 0),
                                          child: TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            unselectedLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'byo7wvar' /* Devices */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0g9qsa2d' /* Schedules */,
                                                ),
                                              ),
                                            ],
                                            controller: _model
                                                .deviceGroupViewDataController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {
                                                  if (widget.type !=
                                                      Flag.Add) {
                                                    await _model.searchScheclue(
                                                        context);
                                                    safeSetState(() {});
                                                  }
                                                }
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model
                                                .deviceGroupViewDataController,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible: responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                14.0,
                                                                24.0,
                                                                24.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          300.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textSearchTextController1,
                                                                            focusNode:
                                                                                _model.textSearchFocusNode1,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textSearchTextController1',
                                                                              Duration(milliseconds: 300),
                                                                              () async {
                                                                                _model.currentPage = 1;
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  _model.currentPageTextController1?.text = _model.currentPage.toString();
                                                                                });
                                                                                await _model.calculateOffset(context);
                                                                                await _model.searchDevice(context);
                                                                                safeSetState(() {});
                                                                              },
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'mictl49j' /* Search */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
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
                                                                              prefixIcon: Icon(
                                                                                Icons.search,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              suffixIcon: _model.textSearchTextController1!.text.isNotEmpty
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        _model.textSearchTextController1?.clear();
                                                                                        _model.currentPage = 1;
                                                                                        safeSetState(() {});
                                                                                        safeSetState(() {
                                                                                          _model.currentPageTextController1?.text = _model.currentPage.toString();
                                                                                        });
                                                                                        await _model.calculateOffset(context);
                                                                                        await _model.searchDevice(context);
                                                                                        safeSetState(() {});
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    )
                                                                                  : null,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            validator:
                                                                                _model.textSearchTextController1Validator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  if ((widget.type !=
                                                                          Flag
                                                                              .View) &&
                                                                      (widget.type !=
                                                                          Flag.Delete))
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              wrapWithModel(
                                                                        model: _model
                                                                            .primaryButtonWithIconModel1,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            PrimaryButtonWithIconWidget(
                                                                          tbName:
                                                                              'Add',
                                                                          btIcon:
                                                                              Icon(
                                                                            Icons.add_box,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          colorbottom:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textcolor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          btAction:
                                                                              () async {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: DeviceListForGroupWidget(
                                                                                    selectedDevices: _model.deviceSelected,
                                                                                    onConfirm: (devices) async {
                                                                                      _model.deviceSelected = devices.toList().cast<DeviceModelStruct>();
                                                                                      _model.devicesForRender = functions.addOrRemoveDevices(devices.sortedList(keyOf: (e) => e.serialNumber, desc: false).toList(), FFAppState().deviceModel.sortedList(keyOf: (e) => e.serialNumber, desc: false).toList()).toList().cast<DeviceModelStruct>();
                                                                                      await _model.searchDevice(context);
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        16.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        22.0,
                                                                        0.0,
                                                                        35.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Container(
                                                                    width: 46.0,
                                                                    height:
                                                                        46.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          100.0,
                                                                      buttonSize:
                                                                          46.0,
                                                                      fillColor:
                                                                          Colors
                                                                              .transparent,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .slidersH,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                Container(
                                                                  width: 45.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'i0wrxd72' /* No */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                      'an2szirn' /* Serial Number */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                      'ftpaiqjv' /* DeviceType */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                      '1qbk6wx2' /* Model */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                      'newihz9b' /* Manufacturer */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                      'jqsa3wlu' /* Status */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                      'urk3p8qw' /* Link Status */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final devicemodel = _model
                                                                          .devicesForRenderFilter
                                                                          .toList();
                                                                      if (devicemodel
                                                                          .isEmpty) {
                                                                        return NoDataFoundedWidget();
                                                                      }

                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            devicemodel.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                devicemodelIndex) {
                                                                          final devicemodelItem =
                                                                              devicemodel[devicemodelIndex];
                                                                          return SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    FFAppState().isclicktab = false;
                                                                                    FFAppState().switch1 = true;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 45.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: functions.isOdd(devicemodelIndex) ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                            tabletLandscape: false,
                                                                                            desktop: false,
                                                                                          ))
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Stack(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  children: [
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 46.0,
                                                                                                      hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      hoverIconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      icon: Icon(
                                                                                                        Icons.more_vert,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                      onPressed: () {
                                                                                                        print('IconButton pressed ...');
                                                                                                      },
                                                                                                    ),
                                                                                                    if (FFAppState().storeName == devicemodelItem.name)
                                                                                                      Container(
                                                                                                        width: 12.0,
                                                                                                        height: 12.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFF50EAA2),
                                                                                                          borderRadius: BorderRadius.circular(24.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Stack(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 12.0,
                                                                                                      height: 12.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (devicemodelItem.id == _model.deviceSelected.where((e) => e.id == devicemodelItem.id).toList().firstOrNull?.id)
                                                                                                      Container(
                                                                                                        width: 12.0,
                                                                                                        height: 12.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFF50EAA2),
                                                                                                          borderRadius: BorderRadius.circular(24.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 45.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 10.0, 0.0),
                                                                                              child: Text(
                                                                                                (_model.offset + devicemodelIndex + 1).toString(),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Text(
                                                                                              devicemodelItem.serialNumber,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (devicemodelItem.deviceType == 'IoT')
                                                                                                  Container(
                                                                                                    width: 28.0,
                                                                                                    height: 28.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                        child: Image.asset(
                                                                                                          Theme.of(context).brightness == Brightness.dark ? 'assets/images/device_(1).png' : 'assets/images/device.png',
                                                                                                          width: 25.0,
                                                                                                          height: 25.0,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if (devicemodelItem.deviceType == 'Smart Meter')
                                                                                                  Container(
                                                                                                    width: 28.0,
                                                                                                    height: 28.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                        child: Image.asset(
                                                                                                          Theme.of(context).brightness == Brightness.dark ? 'assets/images/meter_(1).png' : 'assets/images/meter.png',
                                                                                                          width: 25.0,
                                                                                                          height: 25.0,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Text(
                                                                                              devicemodelItem.model,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Text(
                                                                                              devicemodelItem.manufacturer,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  height: 25.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: () {
                                                                                                      if (devicemodelItem.status == StatusDevice.None.name) {
                                                                                                        return FlutterFlowTheme.of(context).alternate;
                                                                                                      } else if (devicemodelItem.status == StatusDevice.Commissioned.name) {
                                                                                                        return Color(0xFFD7EBD8);
                                                                                                      } else {
                                                                                                        return Color(0xFFFADDD4);
                                                                                                      }
                                                                                                    }(),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          devicemodelItem.status,
                                                                                                          '-',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: () {
                                                                                                                if (devicemodelItem.status == StatusDevice.None.name) {
                                                                                                                  return FlutterFlowTheme.of(context).primaryText;
                                                                                                                } else if (devicemodelItem.status == StatusDevice.Commissioned.name) {
                                                                                                                  return Color(0xFF60B863);
                                                                                                                } else {
                                                                                                                  return Color(0xFFFF6E40);
                                                                                                                }
                                                                                                              }(),
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  height: 25.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: devicemodelItem.linkStatus == StatusDevice.None.name ? FlutterFlowTheme.of(context).alternate : Color(0xFFD7EBD8),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          devicemodelItem.linkStatus,
                                                                                                          '-',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: devicemodelItem.linkStatus == StatusDevice.None.name ? FlutterFlowTheme.of(context).primaryText : Color(0xFF60B863),
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if ((widget.type != Flag.View) && (widget.type != Flag.Delete))
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    if (functions.findExistedDevice(FFAppState().deviceModel.toList(), devicemodelItem) != null) {
                                                                                                      _model.addToDeleteExistedDeviceIds(functions.findExistedDevice(FFAppState().deviceModel.toList(), devicemodelItem)!);
                                                                                                    }
                                                                                                    FFAppState().removeFromDeviceModel(devicemodelItem);
                                                                                                    safeSetState(() {});
                                                                                                    _model.removeFromDeviceSelected(devicemodelItem);
                                                                                                    _model.devicesForRenderFilter = functions.addOrRemoveDevices(_model.deviceSelected.toList(), FFAppState().deviceModel.toList()).toList().cast<DeviceModelStruct>();
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.delete_forever,
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        3.0,
                                                                        16.0,
                                                                        3.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'y4f03lqk' /* Rows per page */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        int>(
                                                                      controller: _model
                                                                              .limitValueController1 ??=
                                                                          FormFieldController<
                                                                              int>(
                                                                        _model.limitValue1 ??=
                                                                            25,
                                                                      ),
                                                                      options: List<
                                                                          int>.from([
                                                                        25,
                                                                        50,
                                                                        100
                                                                      ]),
                                                                      optionLabels: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'tvklyada' /* 25 */,
                                                                        ),
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'khq1pp6c' /* 50 */,
                                                                        ),
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '7zn12to7' /* 100 */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) async {
                                                                        safeSetState(() =>
                                                                            _model.limitValue1 =
                                                                                val);
                                                                        _model.currentPage =
                                                                            1;
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .currentPageTextController1
                                                                              ?.text = _model.currentPage.toString();
                                                                        });
                                                                        await _model
                                                                            .calculateOffset(context);
                                                                        await _model
                                                                            .searchDevice(context);
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      width:
                                                                          90.0,
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'yzb5ui90' /* 25 */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderRadius:
                                                                          8.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          36.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      disabledIconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .chevron_left,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed: (_model.currentPage ==
                                                                              1)
                                                                          ? null
                                                                          : () async {
                                                                              _model.currentPage = _model.currentPage + -1;
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                _model.currentPageTextController1?.text = _model.currentPage.toString();
                                                                              });
                                                                              await _model.calculateOffset(context);
                                                                              await _model.searchDevice(context);
                                                                              safeSetState(() {});
                                                                            },
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.currentPageTextController1,
                                                                        focusNode:
                                                                            _model.currentPageFocusNode1,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.currentPageTextController1',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            safeSetState(() {
                                                                              _model.currentPageTextController1?.text = functions.validatePageNumber(_model.currentPageTextController1.text, _model.totalPage).toString();
                                                                            });
                                                                            _model.currentPage =
                                                                                int.parse(_model.currentPageTextController1.text);
                                                                            safeSetState(() {});
                                                                            await _model.calculateOffset(context);
                                                                            await _model.searchDevice(context);
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'lbuiytco' /* 1 */,
                                                                          ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        minLines:
                                                                            1,
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .currentPageTextController1Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'jrcd3ane' /* of */,
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
                                                                    Text(
                                                                      _model
                                                                          .totalPage
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderRadius:
                                                                          8.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          36.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      disabledIconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .chevron_right,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed: (_model.currentPage ==
                                                                              _model.totalPage)
                                                                          ? null
                                                                          : () async {
                                                                              _model.currentPage = _model.currentPage + 1;
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                _model.currentPageTextController1?.text = _model.currentPage.toString();
                                                                              });
                                                                              await _model.calculateOffset(context);
                                                                              await _model.searchDevice(context);
                                                                              safeSetState(() {});
                                                                            },
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          7.0)),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible: responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                14.0,
                                                                24.0,
                                                                24.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                      tablet:
                                                                          false,
                                                                      tabletLandscape:
                                                                          false,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                      Container(
                                                                        width:
                                                                            300.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textSearchTextController2,
                                                                              focusNode: _model.textSearchFocusNode2,
                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                '_model.textSearchTextController2',
                                                                                Duration(milliseconds: 300),
                                                                                () async {
                                                                                  _model.currentPage = 1;
                                                                                  safeSetState(() {});
                                                                                  safeSetState(() {
                                                                                    _model.currentPageTextController2?.text = _model.currentPage.toString();
                                                                                  });
                                                                                  await _model.calculateOffset(context);
                                                                                  await _model.searchDevice(context);
                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'zt0u30ik' /* Search */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
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
                                                                                prefixIcon: Icon(
                                                                                  Icons.search,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                suffixIcon: _model.textSearchTextController2!.text.isNotEmpty
                                                                                    ? InkWell(
                                                                                        onTap: () async {
                                                                                          _model.textSearchTextController2?.clear();
                                                                                          _model.currentPage = 1;
                                                                                          safeSetState(() {});
                                                                                          safeSetState(() {
                                                                                            _model.currentPageTextController2?.text = _model.currentPage.toString();
                                                                                          });
                                                                                          await _model.calculateOffset(context);
                                                                                          await _model.searchDevice(context);
                                                                                          safeSetState(() {});
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.clear,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      )
                                                                                    : null,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                              validator: _model.textSearchTextController2Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  if ((widget.type !=
                                                                          Flag
                                                                              .View) &&
                                                                      (widget.type !=
                                                                          Flag.Delete))
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              wrapWithModel(
                                                                        model: _model
                                                                            .primaryButtonWithIconModel2,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            PrimaryButtonWithIconWidget(
                                                                          tbName:
                                                                              'Add',
                                                                          btIcon:
                                                                              Icon(
                                                                            Icons.add_box,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          colorbottom:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textcolor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          btAction:
                                                                              () async {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: Container(
                                                                                    height: 800.0,
                                                                                    width: 1200.0,
                                                                                    child: CScheduleViewWidget(
                                                                                      deviceGroupId: widget.deviceGroupId,
                                                                                      typeSchedule: FlagSchedule.devicegroupscheduleID,
                                                                                      type: Flag.Add,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            _model.loadingSchedule =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            await _model.searchScheclue(context);
                                                                            safeSetState(() {});
                                                                            _model.loadingSchedule =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        16.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              45.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(10.0),
                                                                              topRight: Radius.circular(10.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 46.0,
                                                                                height: 46.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: Colors.transparent,
                                                                                  icon: FaIcon(
                                                                                    FontAwesomeIcons.slidersH,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    print('IconButton pressed ...');
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 45.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '5evpn245' /* No */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '7l0g9eu2' /* Start Date	 */,
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'jbr34pka' /* End Date	 */,
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '9okxttrl' /* Schedule Type */,
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '1105cmem' /* Interval */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'yczxygj3' /* Last Execute Time */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '76jwexj1' /* Next Execute Time */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'xuqexdzb' /* Status */,
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                  ),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      if (_model.loadingSchedule) {
                                                                                        return Builder(
                                                                                          builder: (context) {
                                                                                            final sechedulesItems = _model.schedulesModel.toList();
                                                                                            if (sechedulesItems.isEmpty) {
                                                                                              return Center(
                                                                                                child: NoDataFoundedWidget(),
                                                                                              );
                                                                                            }

                                                                                            return ListView.builder(
                                                                                              padding: EdgeInsets.zero,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.vertical,
                                                                                              itemCount: sechedulesItems.length,
                                                                                              itemBuilder: (context, sechedulesItemsIndex) {
                                                                                                final sechedulesItemsItem = sechedulesItems[sechedulesItemsIndex];
                                                                                                return Container(
                                                                                                  height: 45.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: functions.isOdd(sechedulesItemsIndex) ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Stack(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Builder(
                                                                                                            builder: (context) => FlutterFlowIconButton(
                                                                                                              borderColor: Colors.transparent,
                                                                                                              borderRadius: 20.0,
                                                                                                              buttonSize: 46.0,
                                                                                                              hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              hoverIconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              icon: Icon(
                                                                                                                Icons.more_vert,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 20.0,
                                                                                                              ),
                                                                                                              onPressed: () async {
                                                                                                                await showAlignedDialog(
                                                                                                                  barrierColor: Colors.transparent,
                                                                                                                  context: context,
                                                                                                                  isGlobal: false,
                                                                                                                  avoidOverflow: true,
                                                                                                                  targetAnchor: AlignmentDirectional(1.0, 1.0).resolve(Directionality.of(context)),
                                                                                                                  followerAnchor: AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                                                                                                                  builder: (dialogContext) {
                                                                                                                    return Material(
                                                                                                                      color: Colors.transparent,
                                                                                                                      child: CScheduleActionWidget(
                                                                                                                        actionEdit: () async {
                                                                                                                          Navigator.pop(context);
                                                                                                                          await showDialog(
                                                                                                                            context: context,
                                                                                                                            builder: (dialogContext) {
                                                                                                                              return Dialog(
                                                                                                                                elevation: 0,
                                                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                child: Container(
                                                                                                                                  height: 800.0,
                                                                                                                                  width: 1200.0,
                                                                                                                                  child: CScheduleViewWidget(
                                                                                                                                    typeSchedule: FlagSchedule.devicegroupscheduleID,
                                                                                                                                    type: Flag.Update,
                                                                                                                                    scheduleId: sechedulesItemsItem.id,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          );

                                                                                                                          _model.loadingSchedule = false;
                                                                                                                          safeSetState(() {});
                                                                                                                          await _model.searchScheclue(context);
                                                                                                                          _model.loadingSchedule = true;
                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                        actionDelete: () async {
                                                                                                                          Navigator.pop(context);
                                                                                                                          await showDialog(
                                                                                                                            context: context,
                                                                                                                            builder: (dialogContext) {
                                                                                                                              return Dialog(
                                                                                                                                elevation: 0,
                                                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                child: Container(
                                                                                                                                  height: 800.0,
                                                                                                                                  width: 1200.0,
                                                                                                                                  child: CScheduleViewWidget(
                                                                                                                                    typeSchedule: FlagSchedule.devicegroupscheduleID,
                                                                                                                                    type: Flag.Delete,
                                                                                                                                    scheduleId: sechedulesItemsItem.id,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          );

                                                                                                                          _model.loadingSchedule = false;
                                                                                                                          safeSetState(() {});
                                                                                                                          await _model.searchScheclue(context);
                                                                                                                          _model.loadingSchedule = true;
                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                        actionView: () async {
                                                                                                                          Navigator.pop(context);
                                                                                                                          await showDialog(
                                                                                                                            context: context,
                                                                                                                            builder: (dialogContext) {
                                                                                                                              return Dialog(
                                                                                                                                elevation: 0,
                                                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                child: Container(
                                                                                                                                  height: 800.0,
                                                                                                                                  width: 1200.0,
                                                                                                                                  child: CScheduleViewWidget(
                                                                                                                                    typeSchedule: FlagSchedule.devicegroupscheduleID,
                                                                                                                                    type: Flag.View,
                                                                                                                                    scheduleId: sechedulesItemsItem.id,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          );

                                                                                                                          _model.loadingSchedule = false;
                                                                                                                          safeSetState(() {});
                                                                                                                          await _model.searchScheclue(context);
                                                                                                                          _model.loadingSchedule = true;
                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: 45.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              (FFAppState().offset + sechedulesItemsIndex + 1).toString(),
                                                                                                              textAlign: TextAlign.start,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              dateTimeFormat(
                                                                                                                "y-MM-dd",
                                                                                                                functions.convertTimestampFrom(valueOrDefault<String>(
                                                                                                                  sechedulesItemsItem.startDate,
                                                                                                                  '-',
                                                                                                                )),
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              dateTimeFormat(
                                                                                                                "y-MM-dd",
                                                                                                                functions.convertTimestampFrom(valueOrDefault<String>(
                                                                                                                  sechedulesItemsItem.endDate,
                                                                                                                  '-',
                                                                                                                )),
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            flex: 1,
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 95.0,
                                                                                                                  height: 25.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: () {
                                                                                                                      if (sechedulesItemsItem.scheduleType == ScheduleType.Calculation.name) {
                                                                                                                        return Color(0x839ECEA1);
                                                                                                                      } else if (sechedulesItemsItem.scheduleType == ScheduleType.Analytics.name) {
                                                                                                                        return Color(0xFFB9CDD8);
                                                                                                                      } else {
                                                                                                                        return FlutterFlowTheme.of(context).cultured;
                                                                                                                      }
                                                                                                                    }(),
                                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                                  ),
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                                      child: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        sechedulesItemsItem.scheduleType,
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Inter',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            flex: 1,
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 95.0,
                                                                                                                  height: 25.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: () {
                                                                                                                      if (sechedulesItemsItem.interval == Intervals.Daily.name) {
                                                                                                                        return Color(0xFFCCEBEA);
                                                                                                                      } else if (sechedulesItemsItem.interval == Intervals.Weekly.name) {
                                                                                                                        return Color(0x4C4B39EF);
                                                                                                                      } else {
                                                                                                                        return Color(0xFFFADDD4);
                                                                                                                      }
                                                                                                                    }(),
                                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                                  ),
                                                                                                                  child: Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                                      child: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        sechedulesItemsItem.interval,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Inter',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              sechedulesItemsItem.lastExecutedTime == ''
                                                                                                                  ? 'N/A'
                                                                                                                  : dateTimeFormat(
                                                                                                                      "y-MM-dd, h:mm a",
                                                                                                                      functions.convertTimestampFrom(valueOrDefault<String>(
                                                                                                                        sechedulesItemsItem.lastExecutedTime,
                                                                                                                        '-',
                                                                                                                      )),
                                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                                    ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              dateTimeFormat(
                                                                                                                "y-MM-dd, h:mm a",
                                                                                                                functions.convertTimestampFrom(valueOrDefault<String>(
                                                                                                                  sechedulesItemsItem.nextExecuteTime,
                                                                                                                  '-',
                                                                                                                )),
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 95.0,
                                                                                                                  height: 25.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: () {
                                                                                                                      if (sechedulesItemsItem.status == StatusSchedule.Enabled.name) {
                                                                                                                        return Color(0x839ECEA1);
                                                                                                                      } else if (sechedulesItemsItem.status == StatusSchedule.Disabled.name) {
                                                                                                                        return Color(0x4AEE8B60);
                                                                                                                      } else {
                                                                                                                        return FlutterFlowTheme.of(context).alternate;
                                                                                                                      }
                                                                                                                    }(),
                                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                                  ),
                                                                                                                  child: Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        sechedulesItemsItem.status,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Inter',
                                                                                                                              color: () {
                                                                                                                                if (sechedulesItemsItem.status == StatusSchedule.Enabled.name) {
                                                                                                                                  return Color(0xFF60B863);
                                                                                                                                } else if (sechedulesItemsItem.status == StatusSchedule.Disabled.name) {
                                                                                                                                  return Color(0xFFFF6E40);
                                                                                                                                } else {
                                                                                                                                  return FlutterFlowTheme.of(context).warning;
                                                                                                                                }
                                                                                                                              }(),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      if (FFAppState().storeSchedule == Flag.Add.name)
                                                                                                        Container(
                                                                                                          width: 12.0,
                                                                                                          height: 12.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFF50EAA2),
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
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
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 20.0,
                                                                                              height: 20.0,
                                                                                              child: custom_widgets.LoadingIndicatorWidget(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                              ),
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
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          3.0,
                                                                          16.0,
                                                                          3.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '677ezizc' /* Rows per page */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          int>(
                                                                        controller:
                                                                            _model.limitValueController2 ??=
                                                                                FormFieldController<int>(
                                                                          _model.limitValue2 ??=
                                                                              25,
                                                                        ),
                                                                        options:
                                                                            List<int>.from([
                                                                          25,
                                                                          50,
                                                                          100
                                                                        ]),
                                                                        optionLabels: [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '61jwt8fq' /* 25 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ncfsrw5i' /* 50 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'acyvt5ef' /* 100 */,
                                                                          )
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.limitValue2 = val);
                                                                          _model.currentPage =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          safeSetState(
                                                                              () {
                                                                            _model.currentPageTextController2?.text =
                                                                                _model.currentPage.toString();
                                                                          });
                                                                          await _model
                                                                              .calculateOffset(context);
                                                                          await _model
                                                                              .searchDevice(context);
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        width:
                                                                            90.0,
                                                                        height:
                                                                            40.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'udkuuwe6' /* 25 */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderWidth:
                                                                            0.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            false,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderRadius:
                                                                            8.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            36.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        disabledIconColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .chevron_left,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        onPressed: (_model.currentPage ==
                                                                                1)
                                                                            ? null
                                                                            : () async {
                                                                                _model.currentPage = _model.currentPage + -1;
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  _model.currentPageTextController2?.text = _model.currentPage.toString();
                                                                                });
                                                                                await _model.calculateOffset(context);
                                                                                await _model.searchDevice(context);
                                                                                safeSetState(() {});
                                                                              },
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.currentPageTextController2,
                                                                          focusNode:
                                                                              _model.currentPageFocusNode2,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.currentPageTextController2',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              safeSetState(() {
                                                                                _model.currentPageTextController2?.text = functions.validatePageNumber(_model.currentPageTextController2.text, _model.totalPage).toString();
                                                                              });
                                                                              _model.currentPage = int.parse(_model.currentPageTextController2.text);
                                                                              safeSetState(() {});
                                                                              await _model.calculateOffset(context);
                                                                              await _model.searchDevice(context);
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'doi8h1kx' /* 1 */,
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          minLines:
                                                                              1,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .currentPageTextController2Validator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '8c5fm7v8' /* of */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        _model
                                                                            .totalPage
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderRadius:
                                                                            8.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            36.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        disabledIconColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .chevron_right,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        onPressed: (_model.currentPage ==
                                                                                _model.totalPage)
                                                                            ? null
                                                                            : () async {
                                                                                _model.currentPage = _model.currentPage + 1;
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  _model.currentPageTextController2?.text = _model.currentPage.toString();
                                                                                });
                                                                                await _model.calculateOffset(context);
                                                                                await _model.searchDevice(context);
                                                                                safeSetState(() {});
                                                                              },
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            7.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(width: 24.0)),
                  );
                } else {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                    },
                  ),
                ),
                if ((widget.type != Flag.View) &&
                    (_model.deviceGroupViewDataCurrentIndex == 0))
                  wrapWithModel(
                    model: _model.primaryButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PrimaryButtonWidget(
                      tbName: 'Save',
                      font: FlutterFlowTheme.of(context).primaryBackground,
                      fillcolor: FlutterFlowTheme.of(context).primary,
                      btAction: () async {
                        var _shouldSetState = false;
                        if (widget.type == Flag.Add) {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.apiResultAdd =
                              await DeviceGroupGroup.createDeviceGroupCall.call(
                            name: _model.nameTextController.text,
                            description: _model.descriptionTextController.text,
                            dataJson: _model.deviceSelected
                                .map((e) =>
                                    IdStruct.maybeFromMap(e.toMap())?.toMap())
                                .withoutNulls
                                .toList(),
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResultAdd?.succeeded ?? true)) {
                            await action_blocks.handleExceptions(
                              context,
                              message: HandleErrorStruct.maybeFromMap(
                                              (_model.apiResultAdd?.jsonBody ??
                                                  ''))
                                          ?.code ==
                                      'constraint-violation'
                                  ? '${_model.nameTextController.text} already exists.'
                                  : HandleErrorStruct.maybeFromMap(
                                          (_model.apiResultAdd?.jsonBody ?? ''))
                                      ?.code,
                              title: 'Something went wrong!',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else if (widget.type == Flag.Update) {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.apiResultUpdate =
                              await DeviceGroupGroup.updateDeviceGroupCall.call(
                            name: _model.nameTextController.text,
                            description: _model.descriptionTextController.text,
                            id: widget.deviceGroupId,
                            dataJson: _model.deviceSelected
                                .map((e) =>
                                    IdStruct.maybeFromMap(e.toMap())?.toMap())
                                .withoutNulls
                                .toList(),
                            removedDevicesJson: _model.deleteExistedDeviceIds
                                .map((e) => getJsonField(
                                      e.toMap(),
                                      r'''$.Id''',
                                    ))
                                .toList(),
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResultUpdate?.succeeded ?? true)) {
                            await action_blocks.handleExceptions(
                              context,
                              message: HandleErrorStruct.maybeFromMap(
                                              (_model.apiResultAdd?.jsonBody ??
                                                  ''))
                                          ?.code ==
                                      'constraint-violation'
                                  ? '${_model.nameTextController.text} already exists.'
                                  : HandleErrorStruct.maybeFromMap(
                                          (_model.apiResultAdd?.jsonBody ?? ''))
                                      ?.code,
                              title: 'Something went wrong!',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else if (widget.type == Flag.Delete) {
                          _model.apiResultDelete =
                              await DeviceGroupGroup.deleteDeviceGroupCall.call(
                            id: widget.deviceGroupId,
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResultDelete?.succeeded ?? true)) {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        FFAppState().storeName = _model.nameTextController.text;
                        safeSetState(() {});

                        context.pushNamed(
                          DeviceGroupPageWidget.routeName,
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
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
