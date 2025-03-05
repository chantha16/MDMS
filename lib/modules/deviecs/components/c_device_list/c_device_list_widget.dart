import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/deviecs/components/c_action_v1/c_action_v1_widget.dart';
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
import 'c_device_list_model.dart';
export 'c_device_list_model.dart';

class CDeviceListWidget extends StatefulWidget {
  const CDeviceListWidget({
    super.key,
    this.actionMore,
    this.deviceId,
    this.type,
  });

  final Future Function()? actionMore;
  final String? deviceId;
  final Flag? type;

  @override
  State<CDeviceListWidget> createState() => _CDeviceListWidgetState();
}

class _CDeviceListWidgetState extends State<CDeviceListWidget> {
  late CDeviceListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CDeviceListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = false;
      FFAppState().dMetricsModel = [];
      FFAppState().dStartDate = '';
      FFAppState().dEndDate = '';
      FFAppState().generateDataDevice = GenerateDataDeviceStruct();
      FFAppState().tabIndex = 0;
      FFAppState().StoreMap = LatLng(11.5945062, 104.8577052);
      FFAppState().storMapString = '';
      _model.updatePage(() {});
      _model.getalldevices = await DevicesGroup.readAllDevicesCall.call(
        search: '%${_model.textSearchTextController.text}%',
        limit: _model.limitValue1,
        offset: _model.offset,
      );

      if ((_model.getalldevices?.succeeded ?? true)) {
        _model.devicemodels = (getJsonField(
          (_model.getalldevices?.jsonBody ?? ''),
          r'''$.Device''',
          true,
        )!
                .toList()
                .map<DeviceModelStruct?>(DeviceModelStruct.maybeFromMap)
                .toList() as Iterable<DeviceModelStruct?>)
            .withoutNulls
            .toList()
            .cast<DeviceModelStruct>();
        _model.totalpagecount = getJsonField(
          (_model.getalldevices?.jsonBody ?? ''),
          r'''$.Paging.Item.Total''',
        );
        _model.updatePage(() {});
      } else {
        await action_blocks.handleExceptions(
          context,
          message: (_model.getalldevices?.exceptionMessage ?? ''),
          title: 'Message Error',
        );
      }

      FFAppState().isLoading = true;
      FFAppState().update(() {});
    });

    _model.textSearchTextController ??=
        TextEditingController(text: FFAppState().storeSerialNum);
    _model.textSearchFocusNode ??= FocusNode();

    _model.currentPageTextController1 ??=
        TextEditingController(text: _model.currentpage.toString());
    _model.currentPageFocusNode1 ??= FocusNode();

    _model.textFieldwebTextController ??=
        TextEditingController(text: FFAppState().storeSerialNum);
    _model.textFieldwebFocusNode ??= FocusNode();

    _model.currentPageTextController2 ??=
        TextEditingController(text: _model.currentpage.toString());
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
      width: double.infinity,
      height: double.infinity,
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
          if (responsiveVisibility(
            context: context,
            phone: false,
          ))
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller:
                                          _model.textSearchTextController,
                                      focusNode: _model.textSearchFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textSearchTextController',
                                        Duration(milliseconds: 300),
                                        () async {
                                          await Future.delayed(const Duration(
                                              milliseconds: 600));
                                          _model.apigetalldevice =
                                              await DevicesGroup
                                                  .readAllDevicesCall
                                                  .call(
                                            search:
                                                '%${_model.textSearchTextController.text}%',
                                          );

                                          if ((_model
                                                  .apigetalldevice?.succeeded ??
                                              true)) {
                                            _model.devicemodels = (getJsonField(
                                              (_model.apigetalldevice
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.Device''',
                                              true,
                                            )!
                                                        .toList()
                                                        .map<DeviceModelStruct?>(
                                                            DeviceModelStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        DeviceModelStruct?>)
                                                .withoutNulls
                                                .toList()
                                                .cast<DeviceModelStruct>();
                                            _model.search = _model
                                                .textSearchTextController.text;
                                            safeSetState(() {});
                                            FFAppState().storeSerialNum = '';
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
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '3npifaol' /* Search */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        suffixIcon: _model
                                                .textSearchTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .textSearchTextController
                                                      ?.clear();
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 600));
                                                  _model.apigetalldevice =
                                                      await DevicesGroup
                                                          .readAllDevicesCall
                                                          .call(
                                                    search:
                                                        '%${_model.textSearchTextController.text}%',
                                                  );

                                                  if ((_model.apigetalldevice
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.devicemodels =
                                                        (getJsonField(
                                                      (_model.apigetalldevice
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.Device''',
                                                      true,
                                                    )!
                                                                    .toList()
                                                                    .map<DeviceModelStruct?>(
                                                                        DeviceModelStruct
                                                                            .maybeFromMap)
                                                                    .toList()
                                                                as Iterable<
                                                                    DeviceModelStruct?>)
                                                            .withoutNulls
                                                            .toList()
                                                            .cast<
                                                                DeviceModelStruct>();
                                                    _model.search = _model
                                                        .textSearchTextController
                                                        .text;
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .storeSerialNum = '';
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .textSearchTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.primaryButtonWithIconModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: PrimaryButtonWithIconWidget(
                                tbName: 'Add',
                                btIcon: Icon(
                                  Icons.add_box,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                colorbottom:
                                    FlutterFlowTheme.of(context).primary,
                                textcolor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                btAction: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 600));

                                  context.pushNamed(
                                    PDeviceDetailsWidget.routeName,
                                    queryParameters: {
                                      'type': serializeParam(
                                        Flag.Add,
                                        ParamType.Enum,
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
                            ),
                            wrapWithModel(
                              model: _model.primaryButtonWithIconModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: PrimaryButtonWithIconWidget(
                                tbName: 'Export',
                                btIcon: Icon(
                                  Icons.ios_share,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                colorbottom: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textcolor: FlutterFlowTheme.of(context).primary,
                                btAction: () async {},
                              ),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 46.0,
                            height: 46.0,
                            decoration: BoxDecoration(),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: 46.0,
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
                          Expanded(
                            flex: 1,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vznth2h8' /* No */,
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
                            flex: 2,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '0l5qtnz2' /* Serial Number */,
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
                            flex: 2,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '9x7jflck' /* DeviceType */,
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
                            flex: 2,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '77jkcon4' /* Model */,
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
                            flex: 2,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '4wfherxw' /* Manufacturer */,
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
                            flex: 2,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'q9k5o5n9' /* Status */,
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
                            flex: 2,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '67ph7ufe' /* Link Status */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Builder(
                              builder: (context) {
                                if (FFAppState().isLoading) {
                                  return Builder(
                                    builder: (context) {
                                      final devicemodel =
                                          _model.devicemodels.toList();
                                      if (devicemodel.isEmpty) {
                                        return NoDataFoundedWidget();
                                      }

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: devicemodel.length,
                                        itemBuilder:
                                            (context, devicemodelIndex) {
                                          final devicemodelItem =
                                              devicemodel[devicemodelIndex];
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      PDeviceDetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'type': serializeParam(
                                                          Flag.View,
                                                          ParamType.Enum,
                                                        ),
                                                        'deviceId':
                                                            serializeParam(
                                                          devicemodelItem.id,
                                                          ParamType.String,
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

                                                    FFAppState().isclicktab =
                                                        false;
                                                    FFAppState().switch1 = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: functions.isOdd(
                                                              devicemodelIndex)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      7.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      12.0,
                                                                  buttonSize:
                                                                      46.0,
                                                                  hoverColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  hoverIconColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await showAlignedDialog(
                                                                      barrierColor:
                                                                          Colors
                                                                              .transparent,
                                                                      context:
                                                                          context,
                                                                      isGlobal:
                                                                          false,
                                                                      avoidOverflow:
                                                                          true,
                                                                      targetAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      followerAnchor: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              CActionV1Widget(
                                                                            actionDelete:
                                                                                () async {
                                                                              Navigator.pop(context);

                                                                              context.pushNamed(
                                                                                PDeviceDetailsWidget.routeName,
                                                                                queryParameters: {
                                                                                  'type': serializeParam(
                                                                                    Flag.Delete,
                                                                                    ParamType.Enum,
                                                                                  ),
                                                                                  'deviceId': serializeParam(
                                                                                    devicemodelItem.id,
                                                                                    ParamType.String,
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

                                                                              FFAppState().isclicktab = false;
                                                                              FFAppState().switch1 = true;
                                                                              safeSetState(() {});
                                                                            },
                                                                            actionEdit:
                                                                                () async {
                                                                              Navigator.pop(context);

                                                                              context.pushNamed(
                                                                                PDeviceDetailsWidget.routeName,
                                                                                queryParameters: {
                                                                                  'type': serializeParam(
                                                                                    Flag.Update,
                                                                                    ParamType.Enum,
                                                                                  ),
                                                                                  'deviceId': serializeParam(
                                                                                    devicemodelItem.id,
                                                                                    ParamType.String,
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

                                                                              FFAppState().isclicktab = false;
                                                                              FFAppState().switch1 = true;
                                                                              safeSetState(() {});
                                                                            },
                                                                            actionView:
                                                                                () async {
                                                                              Navigator.pop(context);

                                                                              context.pushNamed(
                                                                                PDeviceDetailsWidget.routeName,
                                                                                queryParameters: {
                                                                                  'type': serializeParam(
                                                                                    Flag.View,
                                                                                    ParamType.Enum,
                                                                                  ),
                                                                                  'deviceId': serializeParam(
                                                                                    devicemodelItem.id,
                                                                                    ParamType.String,
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

                                                                              FFAppState().isclicktab = false;
                                                                              FFAppState().switch1 = true;
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                  (_model.offset +
                                                                          devicemodelIndex +
                                                                          1)
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
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
                                                                  devicemodelItem
                                                                      .serialNumber,
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
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (devicemodelItem
                                                                            .deviceType ==
                                                                        'IoT')
                                                                      Container(
                                                                        width:
                                                                            28.0,
                                                                        height:
                                                                            28.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            child:
                                                                                Image.asset(
                                                                              Theme.of(context).brightness == Brightness.dark ? 'assets/images/device_(1).png' : 'assets/images/device.png',
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (devicemodelItem
                                                                            .deviceType ==
                                                                        'Smart Meter')
                                                                      Container(
                                                                        width:
                                                                            28.0,
                                                                        height:
                                                                            28.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                Image.asset(
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
                                                                  devicemodelItem
                                                                      .model,
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
                                                                  devicemodelItem
                                                                      .manufacturer,
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
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          25.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            () {
                                                                          if (devicemodelItem.status ==
                                                                              StatusDevice
                                                                                  .None.name) {
                                                                            return FlutterFlowTheme.of(context).alternate;
                                                                          } else if (devicemodelItem.status ==
                                                                              StatusDevice.Commissioned.name) {
                                                                            return Color(0xFFD7EBD8);
                                                                          } else {
                                                                            return Color(0xFFFADDD4);
                                                                          }
                                                                        }(),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              0.0,
                                                                              7.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
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
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          25.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: devicemodelItem.linkStatus ==
                                                                                StatusDevice.None.name
                                                                            ? FlutterFlowTheme.of(context).alternate
                                                                            : Color(0xFFD7EBD8),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              0.0,
                                                                              7.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
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
                                                            ],
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .storeSerialNum ==
                                                            devicemodelItem
                                                                .serialNumber)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.99,
                                                                    -0.03),
                                                            child: Container(
                                                              width: 12.0,
                                                              height: 12.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF50EAA2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
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
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      child:
                                          custom_widgets.LoadingIndicatorWidget(
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
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 3.0, 16.0, 3.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'dcx8fbv4' /* Rows per page */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    FlutterFlowDropDown<int>(
                                      controller:
                                          _model.limitValueController1 ??=
                                              FormFieldController<int>(
                                        _model.limitValue1 ??= 25,
                                      ),
                                      options: List<int>.from([25, 50, 100]),
                                      optionLabels: [
                                        FFLocalizations.of(context).getText(
                                          'zyt9svov' /* 25 */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '0jfliwpf' /* 50 */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'dmd4fqa4' /* 100 */,
                                        )
                                      ],
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.limitValue1 = val);
                                        _model.currentpage = 1;
                                        _model.offset =
                                            functions.calculateOffset(
                                                _model.currentpage,
                                                _model.limitValue1!);
                                        safeSetState(() {});
                                        await Future.delayed(
                                            const Duration(milliseconds: 600));
                                        safeSetState(() {
                                          _model.currentPageTextController1
                                                  ?.text =
                                              _model.currentpage.toString();
                                        });
                                        _model.apicallalldevice =
                                            await DevicesGroup
                                                .readAllDevicesCall
                                                .call(
                                          search:
                                              '%${_model.textSearchTextController.text}%',
                                          offset: _model.offset,
                                          limit: _model.limitValue1,
                                        );

                                        if ((_model
                                                .apicallalldevice?.succeeded ??
                                            true)) {
                                          _model.devicemodels = (getJsonField(
                                            (_model.apicallalldevice
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.Device''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<DeviceModelStruct?>(
                                                          DeviceModelStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      DeviceModelStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<DeviceModelStruct>();
                                          _model.totalpagecount = getJsonField(
                                            (_model.apicallalldevice
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.Paging.Item.Total''',
                                          );
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      width: 90.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'n7mpgjuj' /* 25 */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 36.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: (_model.currentpage == 1)
                                          ? null
                                          : () async {
                                              var _shouldSetState = false;
                                              _model.currentpage =
                                                  _model.currentpage + -1;
                                              _model.offset =
                                                  functions.calculateOffset(
                                                      _model.currentpage,
                                                      _model.limitValue1!);
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.currentPageTextController1
                                                        ?.text =
                                                    _model.currentpage
                                                        .toString();
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 600));
                                              _model.apiresultgetalldevice =
                                                  await DevicesGroup
                                                      .readAllDevicesCall
                                                      .call(
                                                offset: _model.offset,
                                                limit: _model.limitValue1,
                                                search:
                                                    '%${_model.textSearchTextController.text}%',
                                              );

                                              _shouldSetState = true;
                                              if ((_model.apiresultgetalldevice
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.totalpagecount =
                                                    getJsonField(
                                                  (_model.apiresultgetalldevice
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.Paging.Item.Total''',
                                                );
                                                _model.devicemodels =
                                                    (getJsonField(
                                                  (_model.apiresultgetalldevice
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.Device''',
                                                  true,
                                                )!
                                                                .toList()
                                                                .map<DeviceModelStruct?>(
                                                                    DeviceModelStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                DeviceModelStruct?>)
                                                        .withoutNulls
                                                        .toList()
                                                        .cast<
                                                            DeviceModelStruct>();
                                                safeSetState(() {});
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                    ),
                                    Container(
                                      width: 50.0,
                                      child: TextFormField(
                                        controller:
                                            _model.currentPageTextController1,
                                        focusNode: _model.currentPageFocusNode1,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.currentPageTextController1',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            var _shouldSetState = false;
                                            safeSetState(() {
                                              _model.currentPageTextController1
                                                      ?.text =
                                                  functions
                                                      .validationPageInputNo(
                                                          _model
                                                              .currentPageTextController1
                                                              .text,
                                                          functions.calulationTotalPages(
                                                              _model
                                                                  .totalpagecount,
                                                              _model
                                                                  .limitValue1!))
                                                      .toString();
                                            });
                                            _model.currentpage = int.parse(
                                                _model
                                                    .currentPageTextController1
                                                    .text);
                                            _model.offset =
                                                functions.calculateOffset(
                                                    _model.currentpage,
                                                    _model.limitValue1!);
                                            safeSetState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 600));
                                            _model.apicallforpagination =
                                                await DevicesGroup
                                                    .readAllDevicesCall
                                                    .call(
                                              search: _model
                                                  .textSearchTextController
                                                  .text,
                                              offset: _model.offset,
                                              limit: _model.limitValue1,
                                            );

                                            _shouldSetState = true;
                                            if ((_model.apicallforpagination
                                                    ?.succeeded ??
                                                true)) {
                                              _model.totalpagecount =
                                                  getJsonField(
                                                (_model.apicallforpagination
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.Paging.Item.Total''',
                                              );
                                              _model
                                                  .devicemodels = (getJsonField(
                                                (_model.apicallforpagination
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.Device''',
                                                true,
                                              )!
                                                          .toList()
                                                          .map<DeviceModelStruct?>(
                                                              DeviceModelStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          DeviceModelStruct?>)
                                                  .withoutNulls
                                                  .toList()
                                                  .cast<DeviceModelStruct>();
                                              safeSetState(() {});
                                            } else {
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'md0z6dsb' /* 1 */,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        textAlign: TextAlign.center,
                                        minLines: 1,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .currentPageTextController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '6geojjgw' /* of */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      functions
                                          .calculateTotalPages(
                                              _model.totalpagecount,
                                              _model.limitValue1!)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 36.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: (_model.currentpage ==
                                              functions.calulationTotalPages(
                                                  _model.totalpagecount,
                                                  _model.limitValue1!))
                                          ? null
                                          : () async {
                                              var _shouldSetState = false;
                                              _model.currentpage =
                                                  _model.currentpage + 1;
                                              _model.offset =
                                                  functions.caluclationOffset(
                                                      _model.currentpage,
                                                      _model.limitValue1!);
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.currentPageTextController1
                                                        ?.text =
                                                    _model.currentpage
                                                        .toString();
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 600));
                                              _model.getapiresultalldevice =
                                                  await DevicesGroup
                                                      .readAllDevicesCall
                                                      .call(
                                                offset: _model.offset,
                                                limit: _model.limitValue1,
                                                search:
                                                    '%${_model.textSearchTextController.text}%',
                                              );

                                              _shouldSetState = true;
                                              if ((_model.getapiresultalldevice
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.totalpagecount =
                                                    getJsonField(
                                                  (_model.getapiresultalldevice
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.Paging.Item.Total''',
                                                );
                                                _model.devicemodels =
                                                    (getJsonField(
                                                  (_model.getapiresultalldevice
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.Device''',
                                                  true,
                                                )!
                                                                .toList()
                                                                .map<DeviceModelStruct?>(
                                                                    DeviceModelStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                DeviceModelStruct?>)
                                                        .withoutNulls
                                                        .toList()
                                                        .cast<
                                                            DeviceModelStruct>();
                                                safeSetState(() {});
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                    ),
                                  ].divide(SizedBox(width: 7.0)),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 195.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textFieldwebTextController,
                                focusNode: _model.textFieldwebFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textFieldwebTextController',
                                  Duration(milliseconds: 300),
                                  () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 600));
                                    _model.apigetalldevices = await DevicesGroup
                                        .readAllDevicesCall
                                        .call(
                                      search:
                                          '%${_model.textFieldwebTextController.text}%',
                                    );

                                    if ((_model.apigetalldevices?.succeeded ??
                                        true)) {
                                      _model.devicemodels = (getJsonField(
                                        (_model.apigetalldevices?.jsonBody ??
                                            ''),
                                        r'''$.Device''',
                                        true,
                                      )!
                                                  .toList()
                                                  .map<DeviceModelStruct?>(
                                                      DeviceModelStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<DeviceModelStruct?>)
                                          .withoutNulls
                                          .toList()
                                          .cast<DeviceModelStruct>();
                                      _model.search = _model
                                          .textFieldwebTextController.text;
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
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '67y9wd9s' /* Search */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  suffixIcon: _model.textFieldwebTextController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textFieldwebTextController
                                                ?.clear();
                                            await Future.delayed(const Duration(
                                                milliseconds: 600));
                                            _model.apigetalldevices =
                                                await DevicesGroup
                                                    .readAllDevicesCall
                                                    .call(
                                              search:
                                                  '%${_model.textFieldwebTextController.text}%',
                                            );

                                            if ((_model.apigetalldevices
                                                    ?.succeeded ??
                                                true)) {
                                              _model
                                                  .devicemodels = (getJsonField(
                                                (_model.apigetalldevices
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.Device''',
                                                true,
                                              )!
                                                          .toList()
                                                          .map<DeviceModelStruct?>(
                                                              DeviceModelStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          DeviceModelStruct?>)
                                                  .withoutNulls
                                                  .toList()
                                                  .cast<DeviceModelStruct>();
                                              _model.search = _model
                                                  .textFieldwebTextController
                                                  .text;
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
                                maxLines: null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .textFieldwebTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 12.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).info,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(
                                  PDeviceDetailsWidget.routeName,
                                  queryParameters: {
                                    'type': serializeParam(
                                      Flag.Add,
                                      ParamType.Enum,
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
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderRadius: 12.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.ios_share,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'rsqabpyn' /* Device List */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final devicemobilemodel =
                                      _model.devicemodels.toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: devicemobilemodel.length,
                                    itemBuilder:
                                        (context, devicemobilemodelIndex) {
                                      final devicemobilemodelItem =
                                          devicemobilemodel[
                                              devicemobilemodelIndex];
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 170.0,
                                                  decoration: BoxDecoration(
                                                    color: functions.isOdd(
                                                            devicemobilemodelIndex)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            (_model.offset +
                                                                    devicemobilemodelIndex +
                                                                    1)
                                                                .toString(),
                                                            'No',
                                                          ),
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
                                                        Expanded(
                                                          flex: 2,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (devicemobilemodelItem
                                                                      .deviceType ==
                                                                  'IoT')
                                                                Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .asset(
                                                                        Theme.of(context).brightness ==
                                                                                Brightness.dark
                                                                            ? 'assets/images/device.png'
                                                                            : 'assets/images/device.png',
                                                                        width:
                                                                            25.0,
                                                                        height:
                                                                            25.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (devicemobilemodelItem
                                                                      .deviceType ==
                                                                  'Smart Meter')
                                                                Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/meter.png',
                                                                        width:
                                                                            25.0,
                                                                        height:
                                                                            25.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      devicemobilemodelItem
                                                                          .serialNumber,
                                                                      'SerialNumber',
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
                                                                    valueOrDefault<
                                                                        String>(
                                                                      devicemobilemodelItem
                                                                          .deviceType,
                                                                      'DeviceType',
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
                                                                    valueOrDefault<
                                                                        String>(
                                                                      devicemobilemodelItem
                                                                          .model,
                                                                      'Model',
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
                                                                    valueOrDefault<
                                                                        String>(
                                                                      devicemobilemodelItem
                                                                          .manufacturer,
                                                                      'Manufacturer',
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            25.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              () {
                                                                            if (devicemobilemodelItem.status ==
                                                                                StatusDevice.None.name) {
                                                                              return FlutterFlowTheme.of(context).alternate;
                                                                            } else if (devicemobilemodelItem.status == StatusDevice.Commissioned.name) {
                                                                              return Color(0xFFD7EBD8);
                                                                            } else {
                                                                              return Color(0xFFFADDD4);
                                                                            }
                                                                          }(),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                7.0,
                                                                                0.0,
                                                                                7.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                devicemobilemodelItem.status,
                                                                                'Status',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: () {
                                                                                      if (devicemobilemodelItem.status == StatusDevice.None.name) {
                                                                                        return FlutterFlowTheme.of(context).primaryText;
                                                                                      } else if (devicemobilemodelItem.status == StatusDevice.Commissioned.name) {
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            25.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: devicemobilemodelItem.linkStatus == StatusDevice.None.name
                                                                              ? FlutterFlowTheme.of(context).alternate
                                                                              : Color(0xFFD7EBD8),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                7.0,
                                                                                0.0,
                                                                                7.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                devicemobilemodelItem.linkStatus,
                                                                                'LinkStatus',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: devicemobilemodelItem.linkStatus == StatusDevice.None.name ? FlutterFlowTheme.of(context).primaryText : Color(0xFF60B863),
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.99, -0.03),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          FFAppState().Isnew ==
                                                                  true
                                                              ? Color(
                                                                  0xFF50EAA2)
                                                              : Color(
                                                                  0x00000000),
                                                          Color(0xFF50EAA2),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 16.0, 3.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowDropDown<int>(
                                    controller: _model.limitValueController2 ??=
                                        FormFieldController<int>(
                                      _model.limitValue2 ??= 25,
                                    ),
                                    options: List<int>.from([25, 50, 100]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'huze6x2w' /* 25 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'z165l34f' /* 50 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'nwzttfeq' /* 100 */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.limitValue2 = val);
                                      FFAppState().isLoading = false;
                                      safeSetState(() {});
                                      _model.currentpage = 1;
                                      _model.offset = functions.calculateOffset(
                                          _model.currentpage,
                                          _model.limitValue2!);
                                      safeSetState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 600));
                                      safeSetState(() {
                                        _model.currentPageTextController2
                                                ?.text =
                                            _model.currentpage.toString();
                                      });
                                      _model.apicallalldevicem =
                                          await DevicesGroup.readAllDevicesCall
                                              .call(
                                        search:
                                            '%${_model.textSearchTextController.text}%',
                                        offset: _model.offset,
                                        limit: _model.limitValue2,
                                      );

                                      if ((_model
                                              .apicallalldevicem?.succeeded ??
                                          true)) {
                                        _model.devicemodels = (getJsonField(
                                          (_model.apicallalldevicem?.jsonBody ??
                                              ''),
                                          r'''$.Device''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<DeviceModelStruct?>(
                                                        DeviceModelStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<DeviceModelStruct?>)
                                            .withoutNulls
                                            .toList()
                                            .cast<DeviceModelStruct>();
                                        _model.totalpagecount = getJsonField(
                                          (_model.apicallalldevicem?.jsonBody ??
                                              ''),
                                          r'''$.Paging.Item.Total''',
                                        );
                                        safeSetState(() {});
                                      }
                                      FFAppState().isLoading = true;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    width: 90.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'i34zpf88' /* 25 */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 36.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    disabledIconColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: (_model.currentpage == 1)
                                        ? null
                                        : () async {
                                            var _shouldSetState = false;
                                            FFAppState().isLoading = false;
                                            safeSetState(() {});
                                            _model.currentpage =
                                                _model.currentpage + -1;
                                            _model.offset =
                                                functions.calculateOffset(
                                                    _model.currentpage,
                                                    _model.limitValue2!);
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.currentPageTextController2
                                                      ?.text =
                                                  _model.currentpage.toString();
                                            });
                                            await Future.delayed(const Duration(
                                                milliseconds: 600));
                                            _model.apiresultgetalldevicem =
                                                await DevicesGroup
                                                    .readAllDevicesCall
                                                    .call(
                                              offset: _model.offset,
                                              limit: _model.limitValue2,
                                              search:
                                                  '%${_model.textSearchTextController.text}%',
                                            );

                                            _shouldSetState = true;
                                            if ((_model.apiresultgetalldevicem
                                                    ?.succeeded ??
                                                true)) {
                                              _model.totalpagecount =
                                                  getJsonField(
                                                (_model.apiresultgetalldevicem
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.Paging.Item.Total''',
                                              );
                                              _model
                                                  .devicemodels = (getJsonField(
                                                (_model.apiresultgetalldevicem
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.Device''',
                                                true,
                                              )!
                                                          .toList()
                                                          .map<DeviceModelStruct?>(
                                                              DeviceModelStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          DeviceModelStruct?>)
                                                  .withoutNulls
                                                  .toList()
                                                  .cast<DeviceModelStruct>();
                                              safeSetState(() {});
                                              FFAppState().isLoading = true;
                                              safeSetState(() {});
                                            } else {
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                  ),
                                  Container(
                                    width: 50.0,
                                    child: TextFormField(
                                      controller:
                                          _model.currentPageTextController2,
                                      focusNode: _model.currentPageFocusNode2,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.currentPageTextController2',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          var _shouldSetState = false;
                                          FFAppState().isLoading = false;
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.currentPageTextController2
                                                    ?.text =
                                                functions
                                                    .validationPageInputNo(
                                                        _model
                                                            .currentPageTextController2
                                                            .text,
                                                        functions.calulationTotalPages(
                                                            _model
                                                                .totalpagecount,
                                                            _model
                                                                .limitValue2!))
                                                    .toString();
                                          });
                                          _model.currentpage = int.parse(_model
                                              .currentPageTextController2.text);
                                          _model.offset =
                                              functions.calculateOffset(
                                                  _model.currentpage,
                                                  _model.limitValue2!);
                                          safeSetState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 600));
                                          _model.apicallforpaginationm =
                                              await DevicesGroup
                                                  .readAllDevicesCall
                                                  .call(
                                            search: _model
                                                .textSearchTextController.text,
                                            offset: _model.offset,
                                            limit: _model.limitValue2,
                                          );

                                          _shouldSetState = true;
                                          if ((_model.apicallforpaginationm
                                                  ?.succeeded ??
                                              true)) {
                                            _model.totalpagecount =
                                                getJsonField(
                                              (_model.apicallforpaginationm
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.Paging.Item.Total''',
                                            );
                                            _model.devicemodels = (getJsonField(
                                              (_model.apicallforpaginationm
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.Device''',
                                              true,
                                            )!
                                                        .toList()
                                                        .map<DeviceModelStruct?>(
                                                            DeviceModelStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        DeviceModelStruct?>)
                                                .withoutNulls
                                                .toList()
                                                .cast<DeviceModelStruct>();
                                            safeSetState(() {});
                                            FFAppState().isLoading = true;
                                            safeSetState(() {});
                                          } else {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'vfynp80l' /* 1 */,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      textAlign: TextAlign.center,
                                      minLines: 1,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .currentPageTextController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'h4uaapnd' /* of */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    functions
                                        .calculateTotalPages(
                                            _model.totalpagecount,
                                            _model.limitValue2!)
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 36.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    disabledIconColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: (_model.currentpage ==
                                            functions.calulationTotalPages(
                                                _model.totalpagecount,
                                                _model.limitValue2!))
                                        ? null
                                        : () async {
                                            var _shouldSetState = false;
                                            FFAppState().isLoading = false;
                                            safeSetState(() {});
                                            _model.currentpage =
                                                _model.currentpage + 1;
                                            _model.offset =
                                                functions.caluclationOffset(
                                                    _model.currentpage,
                                                    _model.limitValue2!);
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.currentPageTextController2
                                                      ?.text =
                                                  _model.currentpage.toString();
                                            });
                                            await Future.delayed(const Duration(
                                                milliseconds: 600));
                                            _model.getapiresultalldevicem =
                                                await DevicesGroup
                                                    .readAllDevicesCall
                                                    .call(
                                              offset: _model.offset,
                                              limit: _model.limitValue2,
                                              search:
                                                  '%${_model.textSearchTextController.text}%',
                                            );

                                            _shouldSetState = true;
                                            if ((_model.getapiresultalldevicem
                                                    ?.succeeded ??
                                                true)) {
                                              _model.totalpagecount =
                                                  getJsonField(
                                                (_model.getapiresultalldevicem
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.Paging.Item.Total''',
                                              );
                                              _model
                                                  .devicemodels = (getJsonField(
                                                (_model.getapiresultalldevicem
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.Device''',
                                                true,
                                              )!
                                                          .toList()
                                                          .map<DeviceModelStruct?>(
                                                              DeviceModelStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          DeviceModelStruct?>)
                                                  .withoutNulls
                                                  .toList()
                                                  .cast<DeviceModelStruct>();
                                              safeSetState(() {});
                                              FFAppState().isLoading = true;
                                              safeSetState(() {});
                                            } else {
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                  ),
                                ].divide(SizedBox(width: 7.0)),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
