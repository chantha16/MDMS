import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/c_integration/c_integration_widget.dart';
import '/modules/deviecs/components/c_action_v2/c_action_v2_widget.dart';
import '/modules/deviecs/components/c_general_info/c_general_info_widget.dart';
import '/modules/deviecs/device_infos/device_infos_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'c_device_details_model.dart';
export 'c_device_details_model.dart';

class CDeviceDetailsWidget extends StatefulWidget {
  const CDeviceDetailsWidget({
    super.key,
    this.type,
    this.deviceId,
    this.groupId,
  });

  final Flag? type;
  final String? deviceId;
  final int? groupId;

  @override
  State<CDeviceDetailsWidget> createState() => _CDeviceDetailsWidgetState();
}

class _CDeviceDetailsWidgetState extends State<CDeviceDetailsWidget> {
  late CDeviceDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CDeviceDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.type != Flag.Add) {
        FFAppState().isLoading = false;
        FFAppState().update(() {});
        FFAppState().storFilterMetrics = [];
        FFAppState().dMetricsModel = [];
        FFAppState().dChannelModel = [];
        FFAppState().dAttributesMdel = [];
        FFAppState().deviceModel = [];
        FFAppState().storeSerialNum = '';
        FFAppState().update(() {});
        await Future.wait([
          Future(() async {
            _model.apiReadDevicebyId =
                await DevicesGroup.readDeviceByIdCall.call(
              id: widget.deviceId,
            );

            if ((_model.apiReadDevicebyId?.succeeded ?? true)) {
              FFAppState().deviceModel = (getJsonField(
                (_model.apiReadDevicebyId?.jsonBody ?? ''),
                r'''$.Device''',
                true,
              )!
                      .toList()
                      .map<DeviceModelStruct?>(DeviceModelStruct.maybeFromMap)
                      .toList() as Iterable<DeviceModelStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DeviceModelStruct>();
              FFAppState().isLoading = true;
              _model.updatePage(() {});
              FFAppState().dChannelModel = (getJsonField(
                (_model.apiReadDevicebyId?.jsonBody ?? ''),
                r'''$.Device.DeviceChannels[:].Channel''',
                true,
              )!
                      .toList()
                      .map<ChannelStruct?>(ChannelStruct.maybeFromMap)
                      .toList() as Iterable<ChannelStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<ChannelStruct>();
              FFAppState().dAttributesMdel = (getJsonField(
                (_model.apiReadDevicebyId?.jsonBody ?? ''),
                r'''$.Device.DeviceAttributes''',
                true,
              )!
                      .toList()
                      .map<DeviceAttributesStruct?>(
                          DeviceAttributesStruct.maybeFromMap)
                      .toList() as Iterable<DeviceAttributesStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DeviceAttributesStruct>();
              safeSetState(() {});
            } else {
              FFAppState().isLoading = true;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    (_model.apiReadDevicebyId?.exceptionMessage ?? ''),
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                ),
              );
              await action_blocks.handleExceptions(
                context,
                message: (_model.apiReadDevicebyId?.exceptionMessage ?? ''),
                title: 'Message Error',
              );
              return;
            }

            return;
          }),
          Future(() async {
            _model.getAllChannels =
                await ChannelGroup.readAllChannelCall.call();

            if ((_model.getAllChannels?.succeeded ?? true)) {
              FFAppState().DeviceChannel = (getJsonField(
                (_model.getAllChannels?.jsonBody ?? ''),
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
            } else {
              FFAppState().isLoading = true;
              safeSetState(() {});
              return;
            }

            return;
          }),
          Future(() async {
            _model.apiresultgroupdevice =
                await DeviceGroupGroup.readAllDeviceGroupCall.call(
              includeDevices: false,
            );

            if ((_model.apiresultgroupdevice?.succeeded ?? true)) {
              FFAppState().deviceGroups = (getJsonField(
                (_model.apiresultgroupdevice?.jsonBody ?? ''),
                r'''$.DeviceGroup''',
                true,
              )!
                      .toList()
                      .map<DeviceGroupModelStruct?>(
                          DeviceGroupModelStruct.maybeFromMap)
                      .toList() as Iterable<DeviceGroupModelStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<DeviceGroupModelStruct>();
              safeSetState(() {});
            } else {
              return;
            }

            return;
          }),
          Future(() async {
            _model.apiGoogleMapCall = await GeocodingAPICall.call();

            if ((_model.apiGoogleMapCall?.succeeded ?? true)) {
              FFAppState().storMapString =
                  FFAppState().generateDataDevice.location;
              safeSetState(() {});
              FFAppState().storMapString = getJsonField(
                (_model.apiGoogleMapCall?.jsonBody ?? ''),
                r'''$.results[:].formatted''',
              ).toString().toString();
              FFAppState().latitude = getJsonField(
                (_model.apiGoogleMapCall?.jsonBody ?? ''),
                r'''$.results[:].geometry.lat''',
              );
              FFAppState().longitude = getJsonField(
                (_model.apiGoogleMapCall?.jsonBody ?? ''),
                r'''$.results[:].geometry.lng''',
              );
              safeSetState(() {});
            }
          }),
        ]);
      } else {
        FFAppState().StoreMap = LatLng(11.5945062, 104.8577052);
        safeSetState(() {});
        FFAppState().generateDataDevice = GenerateDataDeviceStruct();
        safeSetState(() {});
        FFAppState().storFilterMetrics = [];
        FFAppState().dMetricsModel = [];
        FFAppState().dChannelModel = [];
        FFAppState().dAttributesMdel = [];
        FFAppState().deviceModel = [];
        FFAppState().isLoading = false;
        safeSetState(() {});
        FFAppState().isLoading = false;
        FFAppState().update(() {});
        _model.apiresultgroupdeviceAnd =
            await DeviceGroupGroup.readAllDeviceGroupCall.call(
          includeDevices: false,
        );

        if ((_model.apiresultgroupdeviceAnd?.succeeded ?? true)) {
          FFAppState().deviceGroups = (getJsonField(
            (_model.apiresultgroupdeviceAnd?.jsonBody ?? ''),
            r'''$.DeviceGroup''',
            true,
          )!
                  .toList()
                  .map<DeviceGroupModelStruct?>(
                      DeviceGroupModelStruct.maybeFromMap)
                  .toList() as Iterable<DeviceGroupModelStruct?>)
              .withoutNulls
              .toList()
              .cast<DeviceGroupModelStruct>();
          safeSetState(() {});
          FFAppState().isLoading = true;
          safeSetState(() {});
        } else {
          return;
        }

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
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 40.0,
                      hoverColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                        FFAppState().dMetricsModel = [];
                        FFAppState().dStartDate = '';
                        FFAppState().dEndDate = '';
                        FFAppState().tabIndex = 0;
                        FFAppState().isLoading = true;
                        _model.updatePage(() {});
                      },
                    ),
                    Text(
                      () {
                        if (widget.type == Flag.Add) {
                          return 'Add Device';
                        } else if (widget.type == Flag.Update) {
                          return 'Update Device';
                        } else if (widget.type == Flag.Delete) {
                          return 'Delete Device';
                        } else {
                          return 'View Device';
                        }
                      }(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ].divide(SizedBox(width: 15.0)),
                ),
              ),
              if (widget.type != Flag.Add)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!((widget.type == Flag.View) ||
                        (widget.type == Flag.Delete) ||
                        (widget.type == Flag.Add)))
                      Builder(
                        builder: (context) => wrapWithModel(
                          model: _model.primaryButtonWithIconModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryButtonWithIconWidget(
                            tbName: 'Action',
                            btIcon: Icon(
                              Icons.more_vert,
                            ),
                            btAction: () async {
                              await showAlignedDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                isGlobal: false,
                                avoidOverflow: true,
                                targetAnchor: AlignmentDirectional(-1.0, 1.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: AlignmentDirectional(0.0, -1.0)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: CActionV2Widget(
                                      actionCommissioning: () async {},
                                      actionDecommissioning: () async {},
                                      actionPing: () async {},
                                      actionLinkHES: () async {
                                        var _shouldSetState = false;
                                        Navigator.pop(context);
                                        _model.apiLinkHes =
                                            await DevicesGroup.linkHESCall.call(
                                          deviceId: widget.deviceId,
                                        );

                                        _shouldSetState = true;
                                        if ((_model.apiLinkHes?.succeeded ??
                                            true)) {
                                          await action_blocks.handleExceptions(
                                            context,
                                            message: 'Link to HES Successfully',
                                            title: 'Message',
                                          );
                                          _model.apiReadDevicebyIdLinkHes =
                                              await DevicesGroup
                                                  .readDeviceByIdCall
                                                  .call(
                                            id: widget.deviceId,
                                          );

                                          _shouldSetState = true;
                                          if ((_model.apiReadDevicebyIdLinkHes
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState()
                                                .deviceModel = (getJsonField(
                                              (_model.apiReadDevicebyIdLinkHes
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
                                            _model.updatePage(() {});
                                            _model
                                                .dChannelModel = (getJsonField(
                                              (_model.apiReadDevicebyIdLinkHes
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.Device.DeviceChannels[:].Channel''',
                                              true,
                                            )!
                                                        .toList()
                                                        .map<ChannelStruct?>(
                                                            ChannelStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<ChannelStruct?>)
                                                .withoutNulls
                                                .toList()
                                                .cast<ChannelStruct>();
                                            _model.dAttributesMdel =
                                                (getJsonField(
                                              (_model.apiReadDevicebyIdLinkHes
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.Device.DeviceAttributes''',
                                              true,
                                            )!
                                                            .toList()
                                                            .map<DeviceAttributesStruct?>(
                                                                DeviceAttributesStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            DeviceAttributesStruct?>)
                                                    .withoutNulls
                                                    .toList()
                                                    .cast<
                                                        DeviceAttributesStruct>();
                                            _model.updatePage(() {});
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiReadDevicebyIdLinkHes
                                                          ?.exceptionMessage ??
                                                      ''),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            );
                                            return;
                                          }

                                          return;
                                        } else {
                                          await action_blocks.handleExceptions(
                                            context,
                                            message: getJsonField(
                                                      (_model.apiLinkHes
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.errMsg''',
                                                    ) ==
                                                    null
                                                ? 'The system is having problems.'
                                                : valueOrDefault<String>(
                                                    getJsonField(
                                                      (_model.apiLinkHes
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.errMsg''',
                                                    )?.toString(),
                                                    'ប្រព័ន្ធមានបញ្ហា',
                                                  ),
                                            title: 'MessageError',
                                          );
                                          return;
                                        }
                                      },
                                    ),
                                  );
                                },
                              );

                              safeSetState(() {});
                            },
                          ),
                        ),
                      ),
                    if (_model.swtichv2 == true)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.switchv1 = true;
                          _model.swtichv2 = false;
                          safeSetState(() {});
                          FFAppState().isclicktab = false;
                          FFAppState().switch1 = false;
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.horizontal_split_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    if ((_model.switchv1 == true) || FFAppState().switch1)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.swtichv2 = true;
                          _model.switchv1 = false;
                          FFAppState().isclicktab = true;
                          FFAppState().switch1 = false;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.vertical_split_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                  ].divide(SizedBox(width: 10.0)),
                ),
            ].divide(SizedBox(width: 16.0)),
          ),
          Flexible(
            child: Builder(
              builder: (context) {
                if (FFAppState().isLoading) {
                  return Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Builder(
                              builder: (context) {
                                if (_model.swtichv2) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: wrapWithModel(
                                                  model:
                                                      _model.cGeneralInfoModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: CGeneralInfoWidget(
                                                    type: widget.type,
                                                    deviceId: widget.deviceId,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: wrapWithModel(
                                                model:
                                                    _model.cIntegrationModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: CIntegrationWidget(
                                                  type: widget.type,
                                                  deviceId: widget.deviceId,
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: wrapWithModel(
                                          model: _model.deviceInfosModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: DeviceInfosWidget(
                                            deviceId: widget.deviceId,
                                            type: widget.type,
                                            tabIndex: FFAppState().tabIndex,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .cGeneralInfoModel2,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          updateOnChange: true,
                                                          child:
                                                              CGeneralInfoWidget(
                                                            deviceId: widget
                                                                .deviceId,
                                                            type: widget.type,
                                                            groupId: 26,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (widget.type != Flag.Add)
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .cIntegrationModel2,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                CIntegrationWidget(
                                                              deviceId: widget
                                                                  .deviceId,
                                                              type:
                                                                  widget.type,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: wrapWithModel(
                                              model: _model.deviceInfosModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: DeviceInfosWidget(
                                                deviceId: widget.deviceId,
                                                type: widget.type,
                                                tabIndex: FFAppState().tabIndex,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          child: custom_widgets.LoadingIndicatorWidget(
                            width: 20.0,
                            height: 20.0,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
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
                      FFAppState().dMetricsModel = [];
                      FFAppState().dStartDate = '';
                      FFAppState().dEndDate = '';
                      FFAppState().update(() {});
                      context.safePop();
                    },
                  ),
                ),
                if (widget.type != Flag.View)
                  wrapWithModel(
                    model: _model.primaryButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: PrimaryButtonWidget(
                      tbName: 'Save',
                      font: FlutterFlowTheme.of(context).primaryBackground,
                      fillcolor: FlutterFlowTheme.of(context).primary,
                      btAction: () async {
                        var _shouldSetState = false;
                        await Future.delayed(const Duration(milliseconds: 600));
                        if (widget.type == Flag.Add) {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.apiCreateDevice =
                              await DevicesGroup.createDeviceCall.call(
                            serialNumber:
                                FFAppState().generateDataDevice.serialNumber,
                            deviceType:
                                FFAppState().generateDataDevice.deviceType,
                            model: FFAppState().generateDataDevice.model,
                            manufacturer:
                                FFAppState().generateDataDevice.manufacturer,
                            linkStatus: 'None',
                            status: 'None',
                            deviceGroupId:
                                FFAppState().generateDataDevice.deviceGroupId,
                          );

                          _shouldSetState = true;
                          if ((_model.apiCreateDevice?.succeeded ?? true)) {
                            FFAppState().Isnew = true;
                            safeSetState(() {});
                            FFAppState().storeSerialNum =
                                FFAppState().generateDataDevice.serialNumber;
                            safeSetState(() {});
                          } else {
                            await action_blocks.handleExceptions(
                              context,
                              message: functions.handleApiError(
                                  HandleErrorStruct.maybeFromMap(
                                          (_model.apiCreateDevice?.jsonBody ??
                                              ''))!
                                      .error,
                                  FFAppState().generateDataDevice.serialNumber),
                              title: 'Message',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else if (widget.type == Flag.Update) {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.apiResultDeviceList =
                              await DevicesGroup.updateDeviceListCall.call(
                            id: widget.deviceId,
                            deviceJson: FFAppState().generateDataDevice.toMap(),
                          );

                          _shouldSetState = true;
                          if ((_model.apiResultDeviceList?.succeeded ?? true)) {
                            FFAppState().storeSerialNum =
                                FFAppState().generateDataDevice.serialNumber;
                            FFAppState().update(() {});
                          } else {
                            await action_blocks.handleExceptions(
                              context,
                              message: functions.handleApiError(
                                  HandleErrorStruct.maybeFromMap((_model
                                              .apiResultDeviceList?.jsonBody ??
                                          ''))!
                                      .error,
                                  FFAppState().generateDataDevice.serialNumber),
                              title: 'Message',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else if (widget.type == Flag.Delete) {
                          _model.apiDelete =
                              await DevicesGroup.deleteDeviceCall.call(
                            id: widget.deviceId,
                          );

                          _shouldSetState = true;
                          if ((_model.apiDelete?.succeeded ?? true)) {
                            FFAppState().generateDataDevice =
                                GenerateDataDeviceStruct();
                            safeSetState(() {});
                          } else {
                            await action_blocks.handleExceptions(
                              context,
                              message: functions.handleApiError(
                                  HandleErrorStruct.maybeFromMap(
                                          (_model.apiDelete?.jsonBody ?? ''))!
                                      .error,
                                  'name'),
                              title: 'Message',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        FFAppState().dScheduleModel = [];
                        FFAppState().tabIndex = 0;
                        FFAppState().update(() {});

                        context.pushNamed(
                          DeviceListsWidget.routeName,
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
            ),
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
