import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'c_schedule_view_model.dart';
export 'c_schedule_view_model.dart';

class CScheduleViewWidget extends StatefulWidget {
  const CScheduleViewWidget({
    super.key,
    this.type,
    this.scheduleId,
    this.typeSchedule,
    this.deviceGroupId,
  });

  final Flag? type;
  final String? scheduleId;
  final FlagSchedule? typeSchedule;
  final int? deviceGroupId;

  @override
  State<CScheduleViewWidget> createState() => _CScheduleViewWidgetState();
}

class _CScheduleViewWidgetState extends State<CScheduleViewWidget> {
  late CScheduleViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CScheduleViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = false;
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      await Future.wait([
        Future(() async {
          _model.timeOfUses = await TimeOfUseGroup.readAllTimeOfUseCall.call();

          if ((_model.timeOfUses?.succeeded ?? true)) {
            _model.timeOfUse = (getJsonField(
              (_model.timeOfUses?.jsonBody ?? ''),
              r'''$.TimeOfUse''',
              true,
            )!
                    .toList()
                    .map<TimeOfUseStruct?>(TimeOfUseStruct.maybeFromMap)
                    .toList() as Iterable<TimeOfUseStruct?>)
                .withoutNulls
                .toList()
                .cast<TimeOfUseStruct>();
            safeSetState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (_model.timeOfUses?.exceptionMessage ?? ''),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).error,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        }),
        Future(() async {
          _model.device = await DevicesGroup.readAllDevicesCall.call();

          if ((_model.device?.succeeded ?? true)) {
            _model.devices = (getJsonField(
              (_model.device?.jsonBody ?? ''),
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
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (_model.device?.exceptionMessage ?? ''),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).error,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        }),
        Future(() async {
          _model.devicegroup =
              await DeviceGroupGroup.readAllDeviceGroupCall.call();

          if ((_model.devicegroup?.succeeded ?? true)) {
            _model.deviceGroup = (getJsonField(
              (_model.devicegroup?.jsonBody ?? ''),
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (_model.devicegroup?.exceptionMessage ?? ''),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).error,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        }),
        Future(() async {
          _model.sites = await SitesGroup.getAllSitesCall.call();

          if ((_model.sites?.succeeded ?? true)) {
            _model.site = (getJsonField(
              (_model.sites?.jsonBody ?? ''),
              r'''$.Site''',
              true,
            )!
                    .toList()
                    .map<SiteModelStruct?>(SiteModelStruct.maybeFromMap)
                    .toList() as Iterable<SiteModelStruct?>)
                .withoutNulls
                .toList()
                .cast<SiteModelStruct>();
            safeSetState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (_model.sites?.exceptionMessage ?? ''),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).error,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        }),
      ]);
      if (widget.type == Flag.Add) {
        _model.updateScheduleDetailStruct(
          (e) => e..status = StatusSchedule.Enabled.name,
        );
        safeSetState(() {});
        if (widget.typeSchedule == FlagSchedule.devicegroupscheduleID) {
          _model.updateScheduleDetailStruct(
            (e) => e
              ..updateBillingDevice(
                (e) => e..deviceGroupId = widget.deviceGroupId,
              ),
          );
          _model.updateBillingDeviceAddStruct(
            (e) => e..deviceGroupId = widget.deviceGroupId,
          );
          safeSetState(() {});
          safeSetState(() {
            _model.deviceGroupValueController?.value =
                _model.scheduleDetail!.billingDevice.deviceGroupId;
          });
        }
      } else {
        _model.isLoading = true;
        safeSetState(() {});
        _model.schedule = await ScheduleGroup.readScheduleByIdCall.call(
          id: widget.scheduleId,
        );

        if ((_model.schedule?.succeeded ?? true)) {
          _model.scheduleDetail = ScheduleStruct.maybeFromMap(getJsonField(
            (_model.schedule?.jsonBody ?? ''),
            r'''$.Schedule''',
          ));
          _model.billingDeviceAdd =
              BillingDeviceAddStruct.maybeFromMap(getJsonField(
            (_model.schedule?.jsonBody ?? ''),
            r'''$.Schedule.BillingDevice''',
          ));
          safeSetState(() {
            _model.scheduleTypeValueController?.value =
                _model.scheduleDetail!.scheduleType;
          });
          safeSetState(() {
            _model.intervalValueController?.value =
                _model.scheduleDetail!.interval;
          });
          safeSetState(() {
            _model.deviceValueController?.value =
                _model.scheduleDetail!.billingDeviceId;
          });
          safeSetState(() {
            _model.deviceGroupValueController?.value =
                _model.scheduleDetail!.billingDevice.deviceGroupId;
          });
          safeSetState(() {
            _model.timeOfUseValueController?.value =
                _model.scheduleDetail!.billingDevice.timeOfUseId;
          });
          safeSetState(() {
            _model.siteValueController?.value =
                _model.scheduleDetail!.billingDevice.siteId;
          });
          safeSetState(() {
            _model.retryCountTextController?.text =
                _model.scheduleDetail!.retryCount.toString();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (_model.schedule?.exceptionMessage ?? ''),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).error,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }

      _model.isLoading = true;
      safeSetState(() {});
    });

    _model.retryCountTextController ??= TextEditingController();
    _model.retryCountFocusNode ??= FocusNode();

    _model.switchValue =
        _model.scheduleDetail?.status == StatusSchedule.Disabled.name
            ? false
            : true;
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

    return Builder(
      builder: (context) {
        if (_model.isLoading) {
          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(valueOrDefault<double>(
                (widget.typeSchedule == FlagSchedule.devicegroupscheduleID) &&
                        (widget.type == Flag.Add)
                    ? 16.0
                    : 0.0,
                0.0,
              )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if ((widget.type == Flag.Add) &&
                              (widget.typeSchedule ==
                                  FlagSchedule.devicegroupscheduleID)
                          ? false
                          : true)
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
                            _model.scheduleDetail = null;
                            _model.devices = [];
                            _model.deviceGroup = [];
                            _model.site = [];
                            _model.timeOfUse = [];
                            _model.isLoading = false;
                            _model.billingDeviceAdd = null;
                            _model.scheduleType = false;
                            _model.interval = false;
                            _model.startDate = false;
                            _model.retryCount = false;
                            _model.devicee = false;
                            _model.devicegroupField = false;
                            _model.sitee = false;
                            _model.timeOfuse = false;
                            safeSetState(() {});
                          },
                        ),
                      Text(
                        () {
                          if (widget.typeSchedule ==
                              FlagSchedule.deviceschedule) {
                            return 'Add Device Schedule';
                          } else if ((widget.typeSchedule ==
                                  FlagSchedule.devicegroupschedule) ||
                              (widget.typeSchedule ==
                                  FlagSchedule.devicegroupscheduleID)) {
                            return 'Add Device Group Schedule';
                          } else if (widget.type == Flag.Update) {
                            return 'Update Schedule';
                          } else if (widget.type == Flag.Delete) {
                            return 'Delete Schedule';
                          } else {
                            return 'View Schedule';
                          }
                        }(),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if ((widget.type == Flag.Add) &&
                                (widget.typeSchedule ==
                                    FlagSchedule.devicegroupscheduleID))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    context.safePop();
                                    _model.scheduleDetail = null;
                                    _model.devices = [];
                                    _model.deviceGroup = [];
                                    _model.site = [];
                                    _model.timeOfUse = [];
                                    _model.isLoading = false;
                                    _model.billingDeviceAdd = null;
                                    _model.scheduleType = false;
                                    _model.interval = false;
                                    _model.startDate = false;
                                    _model.retryCount = false;
                                    _model.devicee = false;
                                    _model.devicegroupField = false;
                                    _model.sitee = false;
                                    _model.timeOfuse = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(55.0, 0.0, 55.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 15.0, 24.0, 15.0),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '0xojnzg9' /* Schedule */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                            'ncy1evsc' /* Schedule Type */,
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
                                                            '68nk92of' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SafeArea(
                                                  child: Container(
                                                    height: 47.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .scheduleTypeValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options:
                                                          List<String>.from(
                                                              ScheduleType
                                                                  .values
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList()),
                                                      optionLabels: ScheduleType
                                                          .values
                                                          .map((e) => e.name)
                                                          .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .scheduleTypeValue =
                                                            val);
                                                        _model
                                                            .updateScheduleDetailStruct(
                                                          (e) => e
                                                            ..scheduleType = _model
                                                                .scheduleTypeValue,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      maxHeight: 400.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '79oxvz0o' /* Select Schedule Type */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      disabled: (widget.type ==
                                                              Flag.View) ||
                                                          (widget.type ==
                                                              Flag.Delete),
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ),
                                                if (_model.scheduleType == true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                0.0, 5.0),
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
                                                              '0yqrej6i' /* Schedule Type is require! */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
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
                                                            'hofvfwyl' /* Interval */,
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
                                                            'cieelek5' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SafeArea(
                                                  child: Container(
                                                    height: 47.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .intervalValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options:
                                                          List<String>.from(
                                                              Intervals.values
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList()),
                                                      optionLabels: Intervals
                                                          .values
                                                          .map((e) => e.name)
                                                          .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .intervalValue =
                                                            val);
                                                        _model
                                                            .updateScheduleDetailStruct(
                                                          (e) => e
                                                            ..interval = _model
                                                                .intervalValue,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      maxHeight: 400.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'si11w2b7' /* Select Interval */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      disabled: (widget.type ==
                                                              Flag.View) ||
                                                          (widget.type ==
                                                              Flag.Delete),
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ),
                                                if (_model.interval == true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                0.0, 5.0),
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
                                                              'umgylchz' /* Interval is require! */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                            'ttapyk0l' /* Start Date */,
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
                                                            'a5pffgon' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
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
                                                    if (!((widget.type ==
                                                            Flag.View) ||
                                                        (widget.type ==
                                                            Flag.Delete))) {
                                                      final _datePickedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            getCurrentTimestamp,
                                                        firstDate:
                                                            DateTime(1900),
                                                        lastDate:
                                                            DateTime(2050),
                                                        builder:
                                                            (context, child) {
                                                          return wrapInMaterialDatePickerTheme(
                                                            context,
                                                            child!,
                                                            headerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            headerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            headerTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter Tight',
                                                                      fontSize:
                                                                          32.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            pickerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            pickerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            selectedDateTimeBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            selectedDateTimeForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            actionButtonForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            iconSize: 24.0,
                                                          );
                                                        },
                                                      );

                                                      if (_datePickedDate !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked =
                                                              DateTime(
                                                            _datePickedDate
                                                                .year,
                                                            _datePickedDate
                                                                .month,
                                                            _datePickedDate.day,
                                                          );
                                                        });
                                                      } else if (_model
                                                              .datePicked !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked =
                                                              getCurrentTimestamp;
                                                        });
                                                      }
                                                      _model
                                                          .updateScheduleDetailStruct(
                                                        (e) => e
                                                          ..startDate =
                                                              dateTimeFormat(
                                                            "yyyy-MM-dd",
                                                            _model.datePicked,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 46.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 3,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model.scheduleDetail?.startDate ==
                                                                              null ||
                                                                          _model.scheduleDetail?.startDate ==
                                                                              ''
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          dateTimeFormat(
                                                                            "yyyy-MM-dd",
                                                                            _model.datePicked,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          '-',
                                                                        )
                                                                      : dateTimeFormat(
                                                                          "yyyy-MM-dd",
                                                                          functions
                                                                              .convertTimestampFrom(valueOrDefault<String>(
                                                                            _model.scheduleDetail?.startDate,
                                                                            '2025-01-01T00:00:00+07:00',
                                                                          )),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                  '-',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .date_range_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.startDate == true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                0.0, 5.0),
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
                                                              '42dauzm7' /* Start Date is require! */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
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
                                                            'g25hgy6y' /* End Date */,
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
                                                            'r2japc50' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {},
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 46.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 3,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  () {
                                                                    if ((_model.scheduleDetail?.interval !=
                                                                                null &&
                                                                            _model.scheduleDetail?.interval !=
                                                                                '') &&
                                                                        (_model.scheduleDetail?.startDate !=
                                                                                null &&
                                                                            _model.scheduleDetail?.startDate !=
                                                                                '')) {
                                                                      return valueOrDefault<
                                                                          String>(
                                                                        functions.increaseDateByInterval(
                                                                            valueOrDefault<String>(
                                                                              _model.scheduleDetail?.startDate,
                                                                              '-',
                                                                            ),
                                                                            valueOrDefault<String>(
                                                                              _model.scheduleDetail?.interval,
                                                                              '-',
                                                                            )),
                                                                        '-',
                                                                      );
                                                                    } else if (_model.scheduleDetail?.endDate ==
                                                                            null ||
                                                                        _model.scheduleDetail?.endDate ==
                                                                            '') {
                                                                      return '-';
                                                                    } else {
                                                                      return valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          "yyyy-MM-dd",
                                                                          functions
                                                                              .convertTimestampFrom(valueOrDefault<String>(
                                                                            _model.scheduleDetail?.endDate,
                                                                            '2025-01-01T00:00:00+07:00',
                                                                          )),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '-',
                                                                      );
                                                                    }
                                                                  }(),
                                                                  '-',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .date_range_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                            'zas8i17v' /* LastExecutedTime */,
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
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 46.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model.scheduleDetail?.lastExecutedTime ==
                                                                            null ||
                                                                        _model.scheduleDetail?.lastExecutedTime ==
                                                                            ''
                                                                    ? 'N/A'
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        dateTimeFormat(
                                                                          "yyyy-MM-dd",
                                                                          functions
                                                                              .convertTimestampFrom(valueOrDefault<String>(
                                                                            _model.scheduleDetail?.lastExecutedTime,
                                                                            '2025-01-01T00:00:00+07:00',
                                                                          )),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '-',
                                                                      ),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                                                            '90wkj4t1' /* NextExecuteTime */,
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
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 46.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                () {
                                                                  if ((_model.scheduleDetail?.interval !=
                                                                              null &&
                                                                          _model.scheduleDetail?.interval !=
                                                                              '') &&
                                                                      (_model.scheduleDetail?.startDate !=
                                                                              null &&
                                                                          _model.scheduleDetail?.startDate !=
                                                                              '')) {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      functions.increaseDateByInterval(
                                                                          valueOrDefault<String>(
                                                                            _model.scheduleDetail?.startDate,
                                                                            '-',
                                                                          ),
                                                                          valueOrDefault<String>(
                                                                            _model.scheduleDetail?.interval,
                                                                            '-',
                                                                          )),
                                                                      '-',
                                                                    );
                                                                  } else if (_model
                                                                              .scheduleDetail
                                                                              ?.nextExecuteTime ==
                                                                          null ||
                                                                      _model.scheduleDetail
                                                                              ?.nextExecuteTime ==
                                                                          '') {
                                                                    return '-';
                                                                  } else {
                                                                    return valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "yyyy-MM-dd",
                                                                        functions
                                                                            .convertTimestampFrom(valueOrDefault<String>(
                                                                          _model
                                                                              .scheduleDetail
                                                                              ?.nextExecuteTime,
                                                                          '2025-01-01T00:00:00+07:00',
                                                                        )),
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '-',
                                                                    );
                                                                  }
                                                                }(),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                            'lgok66dk' /* RetryCount */,
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
                                                            '9oimhjmw' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller: _model
                                                      .retryCountTextController,
                                                  focusNode: _model
                                                      .retryCountFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.retryCountTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      _model
                                                          .updateScheduleDetailStruct(
                                                        (e) => e
                                                          ..retryCount =
                                                              valueOrDefault<
                                                                  int>(
                                                            int.tryParse(_model
                                                                .retryCountTextController
                                                                .text),
                                                            0,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  readOnly: (widget.type ==
                                                          Flag.View) ||
                                                      (widget.type ==
                                                          Flag.Delete),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    alignLabelWithHint: true,
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                  maxLength: 1,
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
                                                      .retryCountTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                                if (_model.retryCount == true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                0.0, 5.0),
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
                                                              'ma9gied4' /* RetryCount is require! */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                            'huhqx4l3' /* Status */,
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
                                                            '7znp8i97' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .scheduleDetail
                                                                ?.status,
                                                            '-',
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
                                                        Switch.adaptive(
                                                          value: _model
                                                              .switchValue!,
                                                          onChanged: ((widget
                                                                          .type ==
                                                                      Flag
                                                                          .View) ||
                                                                  (widget.type ==
                                                                      Flag.Delete))
                                                              ? null
                                                              : (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.switchValue =
                                                                          newValue);
                                                                  if (newValue) {
                                                                    _model
                                                                        .updateScheduleDetailStruct(
                                                                      (e) => e
                                                                        ..status = StatusSchedule
                                                                            .Enabled
                                                                            .name,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model
                                                                        .updateScheduleDetailStruct(
                                                                      (e) => e
                                                                        ..status = StatusSchedule
                                                                            .Disabled
                                                                            .name,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          inactiveThumbColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'uy90jt7q' /* Billing Device */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if ((widget.typeSchedule ==
                                                  FlagSchedule
                                                      .deviceschedule) ||
                                              ((widget.type !=
                                                      Flag.Add) &&
                                                  (_model
                                                          .scheduleDetail
                                                          ?.billingDevice
                                                          .deviceId !=
                                                      '0') &&
                                                  (widget.typeSchedule !=
                                                      FlagSchedule
                                                          .devicegroupscheduleID)))
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                              'gtp9d36m' /* Device */,
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
                                                              '8z6z3kw3' /*  * */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  SafeArea(
                                                    child: Container(
                                                      height: 47.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .deviceValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options:
                                                            List<String>.from(
                                                                _model
                                                                    .devices
                                                                    .map((e) =>
                                                                        e.id)
                                                                    .toList()),
                                                        optionLabels: _model
                                                            .devices
                                                            .map((e) =>
                                                                e.serialNumber)
                                                            .toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.deviceValue =
                                                                  val);
                                                          _model
                                                              .updateScheduleDetailStruct(
                                                            (e) => e
                                                              ..updateBillingDevice(
                                                                (e) => e
                                                                  ..deviceId =
                                                                      _model
                                                                          .deviceValue
                                                                  ..device = _model
                                                                      .devices
                                                                      .where((e) =>
                                                                          e.id ==
                                                                          _model
                                                                              .scheduleDetail
                                                                              ?.billingDevice
                                                                              .deviceId)
                                                                      .toList()
                                                                      .firstOrNull,
                                                              ),
                                                          );
                                                          _model
                                                              .updateBillingDeviceAddStruct(
                                                            (e) => e
                                                              ..deviceId = _model
                                                                  .deviceValue,
                                                          );
                                                          safeSetState(() {});
                                                        },
                                                        maxHeight: 400.0,
                                                        searchHintTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        searchTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        searchHintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'oj8xfbsr' /* Search... */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        disabled:
                                                            widget.type !=
                                                                Flag.Add,
                                                        isOverButton: false,
                                                        isSearchable: true,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.devicee == true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  5.0,
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
                                                                '8w9g48jj' /* Device is require! */,
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          if ((widget.typeSchedule ==
                                                  FlagSchedule
                                                      .devicegroupschedule) ||
                                              ((widget.type != Flag.Add) &&
                                                  (_model
                                                          .scheduleDetail
                                                          ?.billingDevice
                                                          .deviceGroupId !=
                                                      0)) ||
                                              (widget.typeSchedule ==
                                                  FlagSchedule
                                                      .devicegroupscheduleID))
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
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
                                                              '4bfdosc3' /* DeviceGroup */,
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
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  SafeArea(
                                                    child: Container(
                                                      height: 47.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              int>(
                                                        controller: _model
                                                                .deviceGroupValueController ??=
                                                            FormFieldController<
                                                                int>(null),
                                                        options: List<int>.from(
                                                            _model.deviceGroup
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList()),
                                                        optionLabels: _model
                                                            .deviceGroup
                                                            .map((e) => e.name)
                                                            .toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.deviceGroupValue =
                                                                  val);
                                                          _model
                                                              .updateScheduleDetailStruct(
                                                            (e) => e
                                                              ..updateBillingDevice(
                                                                (e) => e
                                                                  ..deviceGroupId =
                                                                      _model
                                                                          .deviceGroupValue
                                                                  ..deviceGroup = _model
                                                                      .deviceGroup
                                                                      .where((e) =>
                                                                          e.id ==
                                                                          _model
                                                                              .scheduleDetail
                                                                              ?.billingDevice
                                                                              .deviceGroupId)
                                                                      .toList()
                                                                      .lastOrNull,
                                                              ),
                                                          );
                                                          _model
                                                              .updateBillingDeviceAddStruct(
                                                            (e) => e
                                                              ..deviceGroupId =
                                                                  _model
                                                                      .deviceGroupValue,
                                                          );
                                                          safeSetState(() {});
                                                        },
                                                        maxHeight: 400.0,
                                                        searchHintTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        searchTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        searchHintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '986hs42m' /* Search... */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        disabled: (widget
                                                                    .type !=
                                                                Flag.Add) ||
                                                            ((widget.typeSchedule ==
                                                                    FlagSchedule
                                                                        .devicegroupscheduleID) &&
                                                                (widget.type ==
                                                                    Flag.Add)),
                                                        isOverButton: false,
                                                        isSearchable: true,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.devicegroupField ==
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  5.0,
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
                                                                'eibczyc4' /* DeviceGroup is require! */,
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                            'kymd4nyc' /* Site */,
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
                                                            'pym64z7p' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SafeArea(
                                                  child: Container(
                                                    height: 47.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                        int>(
                                                      controller: _model
                                                              .siteValueController ??=
                                                          FormFieldController<
                                                              int>(null),
                                                      options: List<int>.from(
                                                          _model.site
                                                              .map((e) => e.id)
                                                              .toList()),
                                                      optionLabels: _model.site
                                                          .map((e) => e.name)
                                                          .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() =>
                                                            _model.siteValue =
                                                                val);
                                                        _model
                                                            .updateScheduleDetailStruct(
                                                          (e) => e
                                                            ..updateBillingDevice(
                                                              (e) => e
                                                                ..siteId = _model
                                                                    .siteValue
                                                                ..site = _model
                                                                    .site
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        _model
                                                                            .scheduleDetail
                                                                            ?.billingDevice
                                                                            .siteId)
                                                                    .toList()
                                                                    .firstOrNull,
                                                            ),
                                                        );
                                                        _model
                                                            .updateBillingDeviceAddStruct(
                                                          (e) => e
                                                            ..siteId = _model
                                                                .siteValue,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      maxHeight: 400.0,
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'jemoqw2h' /* Select Site */,
                                                      ),
                                                      searchHintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '3xewe3p7' /* Search... */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      disabled: widget.type !=
                                                          Flag.Add,
                                                      isOverButton: false,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ),
                                                if (_model.sitee == true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                0.0, 5.0),
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
                                                              'xhkrcili' /* Site is require! */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
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
                                                            '43bq4g4r' /* TimeOfUse */,
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
                                                            '0bc91uwp' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SafeArea(
                                                  child: Container(
                                                    height: 47.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                        int>(
                                                      controller: _model
                                                              .timeOfUseValueController ??=
                                                          FormFieldController<
                                                              int>(null),
                                                      options: List<int>.from(
                                                          _model.timeOfUse
                                                              .map((e) => e.id)
                                                              .toList()),
                                                      optionLabels: _model
                                                          .timeOfUse
                                                          .map((e) => e.name)
                                                          .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .timeOfUseValue =
                                                            val);
                                                        _model
                                                            .updateScheduleDetailStruct(
                                                          (e) => e
                                                            ..updateBillingDevice(
                                                              (e) => e
                                                                ..timeOfUseId =
                                                                    _model
                                                                        .timeOfUseValue
                                                                ..timeOfUse = _model
                                                                    .timeOfUse
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        _model
                                                                            .scheduleDetail
                                                                            ?.billingDevice
                                                                            .timeOfUseId)
                                                                    .toList()
                                                                    .firstOrNull,
                                                            ),
                                                        );
                                                        _model
                                                            .updateBillingDeviceAddStruct(
                                                          (e) => e
                                                            ..timeOfUseId = _model
                                                                .timeOfUseValue,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      maxHeight: 400.0,
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'g6h8wpk3' /* Select TimeOfUse */,
                                                      ),
                                                      searchHintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'l1lrjpi7' /* Search... */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      disabled: (widget.type ==
                                                              Flag.View) ||
                                                          (widget.type ==
                                                              Flag.Delete),
                                                      isOverButton: false,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ),
                                                if (_model.timeOfuse == true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                0.0, 5.0),
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
                                                              'wghnsbgp' /* TimeOfUse is require! */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 15.0, 24.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '0nxwkiy9' /* More Info */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((widget.typeSchedule ==
                                              FlagSchedule.deviceschedule) ||
                                          ((widget.type != Flag.Add) &&
                                              (_model
                                                      .scheduleDetail
                                                      ?.billingDevice
                                                      .deviceId !=
                                                  '0') &&
                                              (widget.typeSchedule !=
                                                  FlagSchedule
                                                      .devicegroupscheduleID)))
                                        Container(
                                          width: 300.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
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
                                                            'o4eb6ryl' /* Device */,
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
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7htjhdp2' /* SerialNumber : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .scheduleDetail
                                                              ?.billingDevice
                                                              .device
                                                              .serialNumber,
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'metuyi2t' /* DeviceType : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .scheduleDetail
                                                            ?.billingDevice
                                                            .device
                                                            .deviceType,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xop0slzp' /* Model : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .scheduleDetail
                                                            ?.billingDevice
                                                            .device
                                                            .model,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3rq4jt1c' /* Manufacturer : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .scheduleDetail
                                                            ?.billingDevice
                                                            .device
                                                            .manufacturer,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gtrznpiw' /* Status : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .scheduleDetail
                                                            ?.billingDevice
                                                            .device
                                                            .status,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'lod9xqbe' /* Link Status : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .scheduleDetail
                                                            ?.billingDevice
                                                            .device
                                                            .linkStatus,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                      if ((widget.typeSchedule ==
                                              FlagSchedule
                                                  .devicegroupschedule) ||
                                          ((widget.type != Flag.Add) &&
                                              (_model
                                                      .scheduleDetail
                                                      ?.billingDevice
                                                      .deviceGroupId !=
                                                  0)) ||
                                          (widget.typeSchedule ==
                                              FlagSchedule
                                                  .devicegroupscheduleID))
                                        Container(
                                          width: 300.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
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
                                                            '1xvp6l5c' /* Device Group */,
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
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'yaem29sc' /* Name : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .scheduleDetail
                                                              ?.billingDevice
                                                              .deviceGroup
                                                              .name,
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'a57ltdr4' /* Desciption : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .scheduleDetail
                                                              ?.billingDevice
                                                              .deviceGroup
                                                              .description,
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'k802pt11' /* Total Device : */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .scheduleDetail
                                                            ?.billingDevice
                                                            .deviceGroup
                                                            .devices
                                                            .length
                                                            .toString(),
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                  Container(
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      't050ugnt' /* Site */,
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
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '09se6yrx' /* Name : */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .scheduleDetail
                                                        ?.billingDevice
                                                        .site
                                                        .name,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'nxfm6lma' /* Desciption : */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .scheduleDetail
                                                        ?.billingDevice
                                                        .site
                                                        .description,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'mpy3krwa' /* Total Sub Site : */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  _model
                                                      .scheduleDetail
                                                      ?.billingDevice
                                                      .site
                                                      .subSites
                                                      .length
                                                      .toString(),
                                                  '-',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'rzko2pig' /* TimeOfUse */,
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
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'j3yd2hkp' /* Code : */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .scheduleDetail
                                                        ?.billingDevice
                                                        .timeOfUse
                                                        .code,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  't0f6wzu7' /* Name : */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .scheduleDetail
                                                        ?.billingDevice
                                                        .timeOfUse
                                                        .name,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4gu4nb7n' /* Desciption : */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .scheduleDetail
                                                        ?.billingDevice
                                                        .timeOfUse
                                                        .description,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(55.0, 0.0, 55.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                            _model.scheduleDetail = null;
                            _model.devices = [];
                            _model.deviceGroup = [];
                            _model.site = [];
                            _model.timeOfUse = [];
                            safeSetState(() {});
                          },
                          child: wrapWithModel(
                            model: _model.secoundaryButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SecoundaryButtonWidget(
                              btName: 'Cancel',
                              btAction: () async {
                                context.safePop();
                                _model.scheduleDetail = null;
                                _model.devices = [];
                                _model.deviceGroup = [];
                                _model.site = [];
                                _model.timeOfUse = [];
                                _model.isLoading = false;
                                _model.billingDeviceAdd = null;
                                _model.scheduleType = false;
                                _model.interval = false;
                                _model.startDate = false;
                                _model.retryCount = false;
                                _model.devicee = false;
                                _model.devicegroupField = false;
                                _model.sitee = false;
                                _model.timeOfuse = false;
                                safeSetState(() {});
                              },
                            ),
                          ),
                        ),
                        if (((widget.type != Flag.View) &&
                                (widget.typeSchedule ==
                                    FlagSchedule.devicegroupscheduleID)) &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          wrapWithModel(
                            model: _model.saveDeviceGroupIdModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PrimaryButtonWidget(
                              tbName: 'Save',
                              font: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fillcolor: FlutterFlowTheme.of(context).primary,
                              btAction: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (widget.type == Flag.Add) {
                                  _model.updateScheduleDetailStruct(
                                    (e) => e
                                      ..endDate =
                                          functions.increaseDateByInterval(
                                              _model.scheduleDetail!.startDate,
                                              _model.scheduleDetail!.interval)
                                      ..nextExecuteTime =
                                          functions.increaseDateByInterval(
                                              _model.scheduleDetail!.startDate,
                                              _model.scheduleDetail!.interval),
                                  );
                                  safeSetState(() {});
                                  FFAppState().addToSchecduleDeviceGroup(
                                      _model.scheduleDetail!);
                                  safeSetState(() {});
                                } else if (widget.type == Flag.Update) {
                                  _model.updateScheduleDetailStruct(
                                    (e) => e
                                      ..endDate =
                                          functions.increaseDateByInterval(
                                              _model.scheduleDetail!.startDate,
                                              _model.scheduleDetail!.interval)
                                      ..nextExecuteTime =
                                          functions.increaseDateByInterval(
                                              _model.scheduleDetail!.startDate,
                                              _model.scheduleDetail!.interval),
                                  );
                                  safeSetState(() {});
                                  FFAppState().addToSchecduleDeviceGroup(
                                      _model.scheduleDetail!);
                                  safeSetState(() {});
                                } else {
                                  _model.updateScheduleDetailStruct(
                                    (e) => e
                                      ..status = StatusSchedule.Disabled.name,
                                  );
                                  safeSetState(() {});
                                  FFAppState().addToSchecduleDeviceGroup(
                                      _model.scheduleDetail!);
                                  safeSetState(() {});
                                }

                                Navigator.pop(context);
                              },
                              exception: () async {},
                            ),
                          ),
                        if (widget.type != Flag.View)
                          wrapWithModel(
                            model: _model.saveScheduleModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PrimaryButtonWidget(
                              tbName: 'Save',
                              font: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fillcolor: FlutterFlowTheme.of(context).primary,
                              btAction: () async {
                                var _shouldSetState = false;
                                await Future.wait([
                                  Future(() async {
                                    if (_model.scheduleDetail?.scheduleType !=
                                            null &&
                                        _model.scheduleDetail?.scheduleType !=
                                            '') {
                                      _model.scheduleType = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.scheduleType = true;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.scheduleDetail?.interval !=
                                            null &&
                                        _model.scheduleDetail?.interval != '') {
                                      _model.interval = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.interval = true;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.scheduleDetail?.startDate !=
                                            null &&
                                        _model.scheduleDetail?.startDate !=
                                            '') {
                                      _model.startDate = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.startDate = true;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }),
                                  Future(() async {
                                    if (!((_model.scheduleDetail?.billingDevice
                                                    .deviceId !=
                                                null &&
                                            _model.scheduleDetail?.billingDevice
                                                    .deviceId !=
                                                '') &&
                                        (widget.typeSchedule ==
                                            FlagSchedule.deviceschedule))) {
                                      _model.devicee = true;
                                      safeSetState(() {});
                                    } else {
                                      _model.devicee = false;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }),
                                  Future(() async {
                                    if ((_model.scheduleDetail?.billingDevice
                                                .deviceGroupId !=
                                            0) &&
                                        (widget.typeSchedule !=
                                            FlagSchedule.deviceschedule)) {
                                      _model.devicegroupField = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.devicegroupField = true;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.scheduleDetail?.billingDevice
                                            .siteId !=
                                        0) {
                                      _model.sitee = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.sitee = true;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.scheduleDetail?.billingDevice
                                            .timeOfUseId !=
                                        0) {
                                      _model.timeOfuse = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.timeOfuse = true;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }),
                                ]);
                                if (widget.type == Flag.Add) {
                                  _model.updateScheduleDetailStruct(
                                    (e) => e
                                      ..endDate =
                                          functions.increaseDateByInterval(
                                              dateTimeFormat(
                                                "yyyy-MM-dd",
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              _model.intervalValue!)
                                      ..nextExecuteTime =
                                          functions.increaseDateByInterval(
                                              dateTimeFormat(
                                                "yyyy-MM-dd",
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              _model.intervalValue!),
                                  );
                                  safeSetState(() {});
                                  if ((_model.scheduleType == true) ||
                                      (_model.interval == true) ||
                                      (_model.startDate == true) ||
                                      (_model.devicee == true) ||
                                      (_model.devicegroupField == true) ||
                                      (_model.sitee == true) ||
                                      (_model.timeOfuse == true)) {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  _model.addSchedule = await ScheduleGroup
                                      .createScheduleCall
                                      .call(
                                    startDate: _model.scheduleDetail?.startDate,
                                    endDate: _model.scheduleDetail?.endDate,
                                    scheduleType:
                                        _model.scheduleDetail?.scheduleType,
                                    interval: _model.scheduleDetail?.interval,
                                    retryCount:
                                        _model.scheduleDetail?.retryCount,
                                    status: _model.scheduleDetail?.status,
                                    dataJson: _model.billingDeviceAdd?.toMap(),
                                    nextExecuteTime:
                                        _model.scheduleDetail?.nextExecuteTime,
                                  );

                                  _shouldSetState = true;
                                  if ((_model.addSchedule?.succeeded ?? true)) {
                                    FFAppState().storeSchedule =
                                        FFAppState().storeSchedule;
                                    safeSetState(() {});
                                  } else {
                                    await action_blocks.handleExceptions(
                                      context,
                                      message: (_model
                                              .addSchedule?.exceptionMessage ??
                                          ''),
                                      title: 'Error',
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else if (widget.type == Flag.Update) {
                                  _model.updateSchedule = await ScheduleGroup
                                      .updateScheduleCall
                                      .call(
                                    startDate: _model.scheduleDetail?.startDate,
                                    endDate: _model.scheduleDetail?.endDate,
                                    scheduleType:
                                        _model.scheduleDetail?.scheduleType,
                                    interval: _model.scheduleDetail?.interval,
                                    retryCount:
                                        _model.scheduleDetail?.retryCount,
                                    status: _model.scheduleDetail?.status,
                                    id: _model.scheduleDetail?.id,
                                    dataJson: _model.billingDeviceAdd?.toMap(),
                                    nextExecuteTime:
                                        _model.scheduleDetail?.nextExecuteTime,
                                  );

                                  _shouldSetState = true;
                                  if (!(_model.updateSchedule?.succeeded ??
                                      true)) {
                                    await action_blocks.handleExceptions(
                                      context,
                                      message: (_model.updateSchedule
                                              ?.exceptionMessage ??
                                          ''),
                                      title: 'Error',
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  _model.deleteSchedue = await ScheduleGroup
                                      .deleteScheduleCall
                                      .call(
                                    id: widget.scheduleId,
                                  );

                                  _shouldSetState = true;
                                  if (!(_model.deleteSchedue?.succeeded ??
                                      true)) {
                                    await action_blocks.handleExceptions(
                                      context,
                                      message: (_model.deleteSchedue
                                              ?.exceptionMessage ??
                                          ''),
                                      title: 'Error',
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                }

                                _model.scheduleDetail = null;
                                _model.devices = [];
                                _model.deviceGroup = [];
                                _model.site = [];
                                _model.timeOfUse = [];
                                _model.isLoading = false;
                                _model.billingDeviceAdd = null;
                                _model.scheduleType = false;
                                _model.interval = false;
                                _model.startDate = false;
                                _model.retryCount = false;
                                _model.devicee = false;
                                _model.devicegroupField = false;
                                _model.sitee = false;
                                _model.timeOfuse = false;
                                safeSetState(() {});
                                if ((widget.type == Flag.Add) &&
                                    (widget.typeSchedule ==
                                        FlagSchedule.devicegroupscheduleID)) {
                                  Navigator.pop(context);
                                } else {
                                  context.safePop();
                                }

                                FFAppState().tabIndex = 0;
                                safeSetState(() {});
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
            ),
          );
        } else {
          return Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(),
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
    );
  }
}
