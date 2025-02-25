import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/confirm_info_widget.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/deviecs/components/c_action_v1/c_action_v1_widget.dart';
import '/modules/deviecs/components/c_filter_v1/c_filter_v1_widget.dart';
import '/modules/deviecs/components/c_google_map/c_google_map_widget.dart';
import '/modules/deviecs/components/check_filter/check_filter_widget.dart';
import '/modules/deviecs/components/switchcomponent/switchcomponent_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:date_range_picker_marketplace_library_h3b4w8/custom_code/widgets/index.dart'
    as date_range_picker_marketplace_library_h3b4w8_custom_widgets;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'device_infos_model.dart';
export 'device_infos_model.dart';

class DeviceInfosWidget extends StatefulWidget {
  const DeviceInfosWidget({
    super.key,
    String? deviceId,
    this.type,
    this.tabIndex,
  }) : this.deviceId = deviceId ?? '';

  final String deviceId;
  final Flag? type;
  final int? tabIndex;

  @override
  State<DeviceInfosWidget> createState() => _DeviceInfosWidgetState();
}

class _DeviceInfosWidgetState extends State<DeviceInfosWidget>
    with TickerProviderStateMixin {
  late DeviceInfosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceInfosModel());

    _model.channelTabController = TabController(
      vsync: this,
      length: 7,
      initialIndex: min(
          valueOrDefault<int>(
            FFAppState().tabIndex,
            0,
          ),
          6),
    )..addListener(() => safeSetState(() {}));
    _model.getCurrentPageTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.currentPage?.toString(),
      '0',
    ));
    _model.getCurrentPageFocusNode ??= FocusNode();

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
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Builder(
        builder: (context) {
          if (FFAppState().isLoading == true) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 54.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'kudfk4o5' /* Device Info */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (FFAppState().tabIndex == 2)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 250.0,
                                        height: 40.0,
                                        child:
                                            date_range_picker_marketplace_library_h3b4w8_custom_widgets
                                                .DateRangePicker(
                                          width: 250.0,
                                          height: 40.0,
                                          buttonTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          buttonBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          buttonOutlineColor:
                                              Colors.transparent,
                                          pickerDialogWidth: 500.0,
                                          pickerDialogHeight: 600.0,
                                          buttonCornerRadius: 12.0,
                                          pickerSelectedDateColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          pickerCurrentDateColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          pickerDialogPadding: 16.0,
                                          initialStartDate:
                                              _model.startDateTime != null
                                                  ? _model.startDateTime
                                                  : functions.getCurrentDate(),
                                          initialEndDate:
                                              _model.endDateTime != null
                                                  ? _model.endDateTime
                                                  : functions.getTomorrowDate(),
                                          onDateRangePicked: (startDateSelected,
                                              endDateSelected) async {
                                            FFAppState().dStartDate =
                                                (String startDate) {
                                              return startDate +
                                                  "T00:00:00.000+07";
                                            }(dateTimeFormat(
                                              "yyyy-MM-dd",
                                              startDateSelected,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ));
                                            FFAppState().dEndDate =
                                                (String endDate) {
                                              return endDate +
                                                  "T23:59:59.999+07";
                                            }(dateTimeFormat(
                                              "yyyy-MM-dd",
                                              endDateSelected,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ));
                                            safeSetState(() {});
                                            _model.startDateTime =
                                                startDateSelected;
                                            _model.endDateTime =
                                                endDateSelected;
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showAlignedDialog(
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        isGlobal: false,
                                        avoidOverflow: true,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: CFilterV1Widget(
                                              deviceId: widget.deviceId,
                                              limit: _model.limitNumValue!,
                                              offset: _model.offset!,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.tune_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.temporaryHide ?? true)
                                  Container(
                                    width: 80.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                (FFAppState().tablepie ==
                                                            true) ||
                                                        (FFAppState()
                                                                .clickdefault ==
                                                            true)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0x00000000),
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(12.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(12.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.table_rows,
                                                color: valueOrDefault<Color>(
                                                  (FFAppState().tablepie ==
                                                              true) ||
                                                          (FFAppState()
                                                                  .clickdefault ==
                                                              true)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                ),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FFAppState().piechart ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : Color(0x00000000),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(12.0),
                                              ),
                                              border: Border.all(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.bar_chart,
                                                color: FFAppState().piechart ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                wrapWithModel(
                                  model: _model.export2Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: PrimaryButtonWithIconWidget(
                                    tbName: 'Export',
                                    btIcon: Icon(
                                      Icons.ios_share,
                                    ),
                                    colorbottom: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textcolor:
                                        FlutterFlowTheme.of(context).primary,
                                    btAction: () async {},
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                        ].divide(SizedBox(width: 5.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(-1.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor: FlutterFlowTheme.of(context).primary,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              labelPadding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '3izc82m1' /* Channel */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'h48ws1kk' /* Device Attribute */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'ff3kfpbr' /* Load Profile */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '6mpi94hr' /* Reading */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'vjn1tsoi' /* Device Specification */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'eqw9jn49' /* Schedule */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'wzv3bzfz' /* Location */,
                                  ),
                                ),
                              ],
                              controller: _model.channelTabController,
                              onTap: (i) async {
                                [
                                  () async {
                                    FFAppState().isclicktab = false;
                                    FFAppState().tabIndex =
                                        _model.channelTabCurrentIndex;
                                    FFAppState().update(() {});
                                  },
                                  () async {
                                    FFAppState().isclicktab = false;
                                    FFAppState().tabIndex =
                                        _model.channelTabCurrentIndex;
                                    safeSetState(() {});
                                  },
                                  () async {
                                    var _shouldSetState = false;
                                    if (FFAppState().isclicktab == true) {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    _model.isloading = false;
                                    FFAppState().isclicktab = true;
                                    _model.apiReadMetricsIds2 =
                                        await DevicesGroup
                                            .readDeviceMetricsByIdCall
                                            .call(
                                      startDate:
                                          functions.getCurrentDateString(),
                                      endDate: functions.getTmrDateString(),
                                      id: widget.deviceId,
                                      jsonLabelJson:
                                          FFAppState().labelsdMetrics.toMap(),
                                    );

                                    _shouldSetState = true;
                                    FFAppState().dMetricsModel = (getJsonField(
                                      (_model.apiReadMetricsIds2?.jsonBody ??
                                          ''),
                                      r'''$.DeviceMetrics.Metrics''',
                                      true,
                                    )!
                                                .toList()
                                                .map<MetricsStruct?>(
                                                    MetricsStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<MetricsStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<MetricsStruct>();
                                    FFAppState().tabIndex =
                                        _model.channelTabCurrentIndex;
                                    FFAppState().totalPage = getJsonField(
                                      (_model.apiReadMetricsIds2?.jsonBody ??
                                          ''),
                                      r'''$.DeviceMetrics.Paging.Item.Total''',
                                    );
                                    safeSetState(() {});
                                    _model.isloading = true;
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  () async {
                                    FFAppState().isclicktab = false;
                                    FFAppState().tabIndex =
                                        _model.channelTabCurrentIndex;
                                    safeSetState(() {});
                                  },
                                  () async {
                                    FFAppState().isclicktab = false;
                                    FFAppState().tabIndex =
                                        _model.channelTabCurrentIndex;
                                    safeSetState(() {});
                                  },
                                  () async {
                                    _model.isloading = false;
                                    FFAppState().isclicktab = false;
                                    FFAppState().tabIndex =
                                        _model.channelTabCurrentIndex;
                                    _model.isloading = false;
                                    await Future.wait([
                                      Future(() async {
                                        _model.readScheduleByDId =
                                            await ScheduleGroup
                                                .readScheduleByDeviceIdCall
                                                .call(
                                          id: widget.deviceId,
                                        );

                                        if ((_model
                                                .readScheduleByDId?.succeeded ??
                                            true)) {
                                          _model.scheduleByDId = (getJsonField(
                                            (_model.readScheduleByDId
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.Schedule''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<ScheduleStruct?>(
                                                          ScheduleStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<ScheduleStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<ScheduleStruct>();
                                          // set loop index to 0
                                          _model.loopIndex = 0;
                                          while (_model.loopIndex <
                                              _model.scheduleByDId.length) {
                                            _model.updateScheduleByDIdAtIndex(
                                              _model.loopIndex,
                                              (e) => e..type = 'Device',
                                            );
                                            _model.loopIndex =
                                                _model.loopIndex + 1;
                                          }
                                        }
                                      }),
                                      Future(() async {
                                        _model.apiGroupSchedule =
                                            await ScheduleGroup
                                                .readScheduleByDeviceGroupCall
                                                .call(
                                          id: 2,
                                        );

                                        if ((_model
                                                .apiGroupSchedule?.succeeded ??
                                            true)) {
                                          _model
                                              .scheduleByGroup = (getJsonField(
                                            (_model.apiGroupSchedule
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.Schedule''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<ScheduleStruct?>(
                                                          ScheduleStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<ScheduleStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<ScheduleStruct>();
                                          _model.loopIndexG = 0;
                                          while (_model.loopIndexG <
                                              _model.scheduleByGroup.length) {
                                            _model.updateScheduleByGroupAtIndex(
                                              _model.loopIndexG,
                                              (e) => e..type = 'Group',
                                            );
                                            _model.loopIndexG =
                                                _model.loopIndexG + 1;
                                          }
                                        }
                                      }),
                                    ]);
                                    FFAppState().dScheduleModel = functions
                                        .combineListSchedule(
                                            _model.scheduleByDId.toList(),
                                            _model.scheduleByGroup.toList())
                                        .toList()
                                        .cast<ScheduleStruct>();
                                    _model.isloading = true;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  () async {
                                    FFAppState().isclicktab = false;
                                    FFAppState().tabIndex =
                                        _model.channelTabCurrentIndex;
                                    safeSetState(() {});
                                  }
                                ][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.channelTabController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'les8is87' /* Code */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'g2p7cric' /* Name */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wmi371lt' /* Unit */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                      'iivuhp38' /* Flow Direction */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (widget.type != Flag.Add)
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final cmodelChannel =
                                                          FFAppState()
                                                              .dChannelModel
                                                              .toList();
                                                      if (cmodelChannel
                                                          .isEmpty) {
                                                        return NoDataFoundedWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: cmodelChannel
                                                            .length,
                                                        itemBuilder: (context,
                                                            cmodelChannelIndex) {
                                                          final cmodelChannelItem =
                                                              cmodelChannel[
                                                                  cmodelChannelIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: functions
                                                                          .isOdd(
                                                                              cmodelChannelIndex)
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          cmodelChannelItem
                                                                              .code,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 5,
                                                                        child:
                                                                            Text(
                                                                          cmodelChannelItem
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          cmodelChannelItem
                                                                              .units,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          cmodelChannelItem
                                                                              .flowDirection,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
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
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'oabzmjzt' /* Name */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                      'k9lvn4jd' /* Value */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final attributemodel =
                                                        FFAppState()
                                                            .dAttributesMdel
                                                            .toList();
                                                    if (attributemodel
                                                        .isEmpty) {
                                                      return Center(
                                                        child:
                                                            NoDataFoundedWidget(),
                                                      );
                                                    }

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          attributemodel.length,
                                                      itemBuilder: (context,
                                                          attributemodelIndex) {
                                                        final attributemodelItem =
                                                            attributemodel[
                                                                attributemodelIndex];
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: functions
                                                                          .isOdd(
                                                                              attributemodelIndex)
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          attributemodelItem
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          attributemodelItem
                                                                              .value,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
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
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '29etfnv7' /* No */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xjs7el2i' /* Date Time */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1ng2x9xl' /* Value */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'mv1y09bc' /* Units */,
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
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showAlignedDialog(
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              context: context,
                                                              isGlobal: false,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          1.0,
                                                                          1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      CheckFilterWidget(
                                                                    listNames: FFAppState()
                                                                        .storFilterMetrics
                                                                        .map((e) => e
                                                                            .labels
                                                                            .units)
                                                                        .toList(),
                                                                    filter: LabelMetrics
                                                                        .Units
                                                                        .name,
                                                                    offset: 0,
                                                                    limit: _model
                                                                        .limitNumValue!,
                                                                    filterName:
                                                                        'Units',
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '0q622srs' /* Flow Direction */,
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
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showAlignedDialog(
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              context: context,
                                                              isGlobal: false,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          1.0,
                                                                          1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      CheckFilterWidget(
                                                                    listNames: FFAppState()
                                                                        .storFilterMetrics
                                                                        .map((e) => e
                                                                            .labels
                                                                            .flowDirection)
                                                                        .toList(),
                                                                    filter: LabelMetrics
                                                                        .FlowDirection
                                                                        .name,
                                                                    offset: _model
                                                                        .offset!,
                                                                    limit: _model
                                                                        .limitNumValue!,
                                                                    filterName:
                                                                        'FlowDirection',
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          't0clw49s' /* Phase */,
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
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showAlignedDialog(
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              context: context,
                                                              isGlobal: false,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          1.0,
                                                                          1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      CheckFilterWidget(
                                                                    listNames: FFAppState()
                                                                        .storFilterMetrics
                                                                        .map((e) => e
                                                                            .labels
                                                                            .phase)
                                                                        .toList(),
                                                                    filter: LabelMetrics
                                                                        .Phase
                                                                        .name,
                                                                    offset: _model
                                                                        .offset!,
                                                                    limit: _model
                                                                        .limitNumValue!,
                                                                    filterName:
                                                                        'Phase',
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '51r6nr6p' /* Apportion Policy */,
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
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showAlignedDialog(
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              context: context,
                                                              isGlobal: false,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          -1.0,
                                                                          1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      CheckFilterWidget(
                                                                    listNames: FFAppState()
                                                                        .storFilterMetrics
                                                                        .map((e) => e
                                                                            .labels
                                                                            .apportionPolicy)
                                                                        .toList(),
                                                                    filter: LabelMetrics
                                                                        .ApportionPolicy
                                                                        .name,
                                                                    offset: _model
                                                                        .offset!,
                                                                    limit: _model
                                                                        .limitNumValue!,
                                                                    filterName:
                                                                        'ApportionPolicy',
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
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
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    if (_model.isloading ==
                                                        true) {
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final devicemetrics =
                                                                    FFAppState()
                                                                        .dMetricsModel
                                                                        .toList();
                                                                if (devicemetrics
                                                                    .isEmpty) {
                                                                  return NoDataFoundedWidget();
                                                                }

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      devicemetrics
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          devicemetricsIndex) {
                                                                    final devicemetricsItem =
                                                                        devicemetrics[
                                                                            devicemetricsIndex];
                                                                    return SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: functions.isOdd(devicemetricsIndex) ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 2,
                                                                                    child: Text(
                                                                                      ((_model.offset!) + devicemetricsIndex + 1).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 5,
                                                                                    child: Text(
                                                                                      functions.formatTimestamp(devicemetricsItem.timestamp),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Text(
                                                                                      functions.formatScientificNotation(devicemetricsItem.value),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Text(
                                                                                      devicemetricsItem.labels.units,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Text(
                                                                                      devicemetricsItem.labels.flowDirection,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Text(
                                                                                      devicemetricsItem.labels.phase,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Text(
                                                                                      devicemetricsItem.labels.apportionPolicy,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
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
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '0iagpyev' /* Rows per page */,
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
                                                                            _model.limitNumValueController ??=
                                                                                FormFieldController<int>(
                                                                          _model.limitNumValue ??=
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
                                                                            'oa1b23r6' /* 25 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ma7ofk3j' /* 50 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'jtfhlgqa' /* 100 */,
                                                                          )
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.limitNumValue = val);
                                                                          _model.currentPage =
                                                                              1;
                                                                          _model.offset =
                                                                              valueOrDefault<int>(
                                                                            functions.calculateOffset(_model.currentPage!,
                                                                                _model.limitNumValue!),
                                                                            0,
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                          safeSetState(
                                                                              () {
                                                                            _model.getCurrentPageTextController?.text =
                                                                                _model.getCurrentPageTextController.text;
                                                                          });
                                                                          FFAppState()
                                                                              .dMetricsModel = (getJsonField(
                                                                            functions.filterMetrics(
                                                                                FFAppState().storeJsonData,
                                                                                FFAppState().nameList.toList(),
                                                                                '',
                                                                                _model.limitNumValue!,
                                                                                _model.offset!),
                                                                            r'''$.DeviceMetrics.Metrics''',
                                                                            true,
                                                                          )!
                                                                                  .toList()
                                                                                  .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                                                                                  .toList() as Iterable<MetricsStruct?>)
                                                                              .withoutNulls
                                                                              .toList()
                                                                              .cast<MetricsStruct>();
                                                                          FFAppState().jsonbodyStore = functions.filterMetrics(
                                                                              FFAppState().storeJsonData,
                                                                              FFAppState().nameList.toList(),
                                                                              '',
                                                                              _model.limitNumValue!,
                                                                              _model.offset!);
                                                                          FFAppState().totalPage =
                                                                              getJsonField(
                                                                            FFAppState().jsonbodyStore,
                                                                            r'''$.pagination.total''',
                                                                          );
                                                                          FFAppState()
                                                                              .update(() {});
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
                                                                          'abmvi9q5' /* 25 */,
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
                                                                                0)
                                                                            ? null
                                                                            : () async {
                                                                                _model.currentPage = _model.currentPage! + -1;
                                                                                _model.offset = valueOrDefault<int>(
                                                                                  functions.calculateOffset(_model.currentPage!, _model.limitNumValue!),
                                                                                  0,
                                                                                );
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  _model.getCurrentPageTextController?.text = _model.getCurrentPageTextController.text;
                                                                                });
                                                                                FFAppState().dMetricsModel = (getJsonField(
                                                                                  functions.filterMetrics(FFAppState().storeJsonData, FFAppState().nameList.toList(), '', _model.limitNumValue!, _model.offset!),
                                                                                  r'''$.DeviceMetrics.Metrics''',
                                                                                  true,
                                                                                )!
                                                                                        .toList()
                                                                                        .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                                                                                        .toList() as Iterable<MetricsStruct?>)
                                                                                    .withoutNulls
                                                                                    .toList()
                                                                                    .cast<MetricsStruct>();
                                                                                FFAppState().jsonbodyStore = functions.filterMetrics(FFAppState().storeJsonData, FFAppState().nameList.toList(), '', _model.limitNumValue!, _model.offset!);
                                                                                FFAppState().totalPage = getJsonField(
                                                                                  FFAppState().jsonbodyStore,
                                                                                  r'''$.pagination.total''',
                                                                                );
                                                                                FFAppState().update(() {});
                                                                              },
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.getCurrentPageTextController,
                                                                          focusNode:
                                                                              _model.getCurrentPageFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.getCurrentPageTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              safeSetState(() {
                                                                                _model.getCurrentPageTextController?.text = functions.validationPageInputNo(_model.getCurrentPageTextController.text, functions.calulationTotalPages(FFAppState().totalPage, _model.limitNumValue!)).toString();
                                                                              });
                                                                              FFAppState().dMetricsModel = (getJsonField(
                                                                                functions.filterMetrics(FFAppState().storeJsonData, FFAppState().nameList.toList(), '', _model.limitNumValue!, _model.offset!),
                                                                                r'''$.DeviceMetrics.Metrics''',
                                                                                true,
                                                                              )!
                                                                                      .toList()
                                                                                      .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                                                                                      .toList() as Iterable<MetricsStruct?>)
                                                                                  .withoutNulls
                                                                                  .toList()
                                                                                  .cast<MetricsStruct>();
                                                                              FFAppState().jsonbodyStore = functions.filterMetrics(FFAppState().storeJsonData, FFAppState().nameList.toList(), '', _model.limitNumValue!, _model.offset!);
                                                                              FFAppState().totalPage = getJsonField(
                                                                                FFAppState().jsonbodyStore,
                                                                                r'''$.pagination.total''',
                                                                              );
                                                                              FFAppState().update(() {});
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
                                                                              'wg5ivag0' /* 1 */,
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
                                                                              .getCurrentPageTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '1odz4rgh' /* of */,
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
                                                                            .calulationTotalPages(FFAppState().totalPage,
                                                                                _model.limitNumValue!)
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
                                                                                valueOrDefault<int>(
                                                                                  functions.calulationTotalPages(FFAppState().totalPage, _model.limitNumValue!),
                                                                                  0,
                                                                                ))
                                                                            ? null
                                                                            : () async {
                                                                                _model.currentPage = _model.currentPage! + 1;
                                                                                _model.offset = functions.calculateOffset(_model.currentPage!, _model.limitNumValue!);
                                                                                _model.updatePage(() {});
                                                                                safeSetState(() {
                                                                                  _model.getCurrentPageTextController?.text = _model.getCurrentPageTextController.text;
                                                                                });
                                                                                FFAppState().dMetricsModel = (getJsonField(
                                                                                  functions.filterMetrics(FFAppState().storeJsonData, FFAppState().nameList.toList(), '', _model.limitNumValue!, _model.offset!),
                                                                                  r'''$.DeviceMetrics.Metrics''',
                                                                                  true,
                                                                                )!
                                                                                        .toList()
                                                                                        .map<MetricsStruct?>(MetricsStruct.maybeFromMap)
                                                                                        .toList() as Iterable<MetricsStruct?>)
                                                                                    .withoutNulls
                                                                                    .toList()
                                                                                    .cast<MetricsStruct>();
                                                                                FFAppState().jsonbodyStore = functions.filterMetrics(FFAppState().storeJsonData, FFAppState().nameList.toList(), '', _model.limitNumValue!, _model.offset!);
                                                                                FFAppState().totalPage = getJsonField(
                                                                                  functions.filterMetrics(FFAppState().storeJsonData, FFAppState().nameList.toList(), '', _model.limitNumValue!, _model.offset!),
                                                                                  r'''$.pagination.total''',
                                                                                );
                                                                                FFAppState().update(() {});
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
                                                      );
                                                    } else {
                                                      return Container(
                                                        width: double.infinity,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          child: custom_widgets
                                                              .LoadingIndicatorWidget(
                                                            width: 20.0,
                                                            height: 20.0,
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
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3yikwmuj' /* Name */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tnbf2t6p' /* Value */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                child: Builder(
                                                  builder: (context) {
                                                    final dAttr = FFAppState()
                                                        .dAttributesMdel
                                                        .toList();
                                                    if (dAttr.isEmpty) {
                                                      return NoDataFoundedWidget();
                                                    }

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: dAttr.length,
                                                      itemBuilder: (context,
                                                          dAttrIndex) {
                                                        final dAttrItem =
                                                            dAttr[dAttrIndex];
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: functions
                                                                          .isOdd(
                                                                              dAttrIndex)
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'x79a7bs6' /* Meter ID */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'kx4xzgc8' /* Meter ID */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
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
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'evbhb5q5' /* Name */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                      'rp6hgude' /* Value */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                child: Builder(
                                                  builder: (context) {
                                                    final dSpec = FFAppState()
                                                        .tou
                                                        .toList();
                                                    if (dSpec.isEmpty) {
                                                      return NoDataFoundedWidget();
                                                    }

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: dSpec.length,
                                                      itemBuilder: (context,
                                                          dSpecIndex) {
                                                        final dSpecItem =
                                                            dSpec[dSpecIndex];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: functions
                                                                        .isOdd(
                                                                            dSpecIndex)
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'f7aqwyc1' /* Voltage Rating */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '6mh01k7c' /* 	230V */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
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
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Icon(
                                                    Icons.tune_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'krd55jp8' /* From */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'd3ryqnzd' /* Start Date */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'phc4i99d' /* End Date */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                    'fbamm210' /* Type */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                    'wrmggmoh' /* Interval */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '2jlqeh0l' /* Retry Count */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '77nkjo0b' /* Retry Count */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(),
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
                                              child: Builder(
                                                builder: (context) {
                                                  if (_model.isloading ==
                                                      true) {
                                                    return Builder(
                                                      builder: (context) {
                                                        final dScheduleModel =
                                                            FFAppState()
                                                                .dScheduleModel
                                                                .toList();
                                                        if (dScheduleModel
                                                            .isEmpty) {
                                                          return NoDataFoundedWidget();
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              dScheduleModel
                                                                  .length,
                                                          itemBuilder: (context,
                                                              dScheduleModelIndex) {
                                                            final dScheduleModelItem =
                                                                dScheduleModel[
                                                                    dScheduleModelIndex];
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: functions.isOdd(
                                                                              dScheduleModelIndex)
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primaryBackground
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Builder(
                                                                          builder: (context) =>
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                12.0,
                                                                            buttonSize:
                                                                                46.0,
                                                                            hoverColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            hoverIconColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
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
                                                                                    child: CActionV1Widget(
                                                                                      actionDelete: () async {
                                                                                        Navigator.pop(context);

                                                                                        context.pushNamed(
                                                                                          ScheduleViewWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'type': serializeParam(
                                                                                              Flag.Delete,
                                                                                              ParamType.Enum,
                                                                                            ),
                                                                                            'scheduleId': serializeParam(
                                                                                              dScheduleModelItem.id,
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
                                                                                        FFAppState().tabIndex = 0;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      actionEdit: () async {
                                                                                        Navigator.pop(context);

                                                                                        context.pushNamed(
                                                                                          ScheduleViewWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'type': serializeParam(
                                                                                              Flag.Update,
                                                                                              ParamType.Enum,
                                                                                            ),
                                                                                            'scheduleId': serializeParam(
                                                                                              dScheduleModelItem.id,
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
                                                                                        FFAppState().tabIndex = 0;
                                                                                        _model.updatePage(() {});
                                                                                      },
                                                                                      actionView: () async {
                                                                                        Navigator.pop(context);

                                                                                        context.pushNamed(
                                                                                          ScheduleViewWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'type': serializeParam(
                                                                                              Flag.View,
                                                                                              ParamType.Enum,
                                                                                            ),
                                                                                            'scheduleId': serializeParam(
                                                                                              dScheduleModelItem.id,
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
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Visibility(
                                                                                  visible: dScheduleModelItem.type != 'Device',
                                                                                  child: Icon(
                                                                                    Icons.folder,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (dScheduleModelItem.type == 'Device')
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Icon(
                                                                                    Icons.folder_off,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              "yyyy-MM-dd",
                                                                              functions.convertTimestampFrom(dScheduleModelItem.startDate),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              "yyyy-MM-dd",
                                                                              functions.convertTimestampFrom(dScheduleModelItem.endDate),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                70.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 25.0,
                                                                              decoration: BoxDecoration(
                                                                                color: () {
                                                                                  if (dScheduleModelItem.scheduleType == ScheduleType.Calculation.name) {
                                                                                    return Color(0xFFD7EBD8);
                                                                                  } else if (dScheduleModelItem.scheduleType == ScheduleType.Analytics.name) {
                                                                                    return Color(0xFFB9CDD8);
                                                                                  } else {
                                                                                    return FlutterFlowTheme.of(context).cultured;
                                                                                  }
                                                                                }(),
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                  child: Text(
                                                                                    dScheduleModelItem.scheduleType,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                70.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 25.0,
                                                                              decoration: BoxDecoration(
                                                                                color: valueOrDefault<Color>(
                                                                                  () {
                                                                                    if (dScheduleModelItem.interval == 'Daily') {
                                                                                      return Color(0xFFD7EBD8);
                                                                                    } else if (dScheduleModelItem.interval == 'Weekly') {
                                                                                      return FlutterFlowTheme.of(context).accent1;
                                                                                    } else {
                                                                                      return Color(0xFFFADDD4);
                                                                                    }
                                                                                  }(),
                                                                                  FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                  child: Text(
                                                                                    dScheduleModelItem.interval,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              dScheduleModelItem.retryCount.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Builder(
                                                                            builder: (context) =>
                                                                                SwitchcomponentWidget(
                                                                              key: Key('Keya6o_${dScheduleModelIndex}_of_${dScheduleModel.length}'),
                                                                              statusSwitch: FFAppState().statusSwitch,
                                                                              status: dScheduleModelItem.status,
                                                                              from: dScheduleModelItem.type,
                                                                              switchActionOn: () async {
                                                                                if (FFAppState().statusSwitch) {
                                                                                  FFAppState().insertAtIndexInDScheduleModel(dScheduleModelIndex, dScheduleModelItem);
                                                                                  safeSetState(() {});
                                                                                }
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: ConfirmInfoWidget(
                                                                                        value: 'Enabled',
                                                                                        actionYes: () async {
                                                                                          _model.updateScheduleById = await DevicesGroup.updateDeviceScheduleCall.call(
                                                                                            id: dScheduleModelItem.id,
                                                                                            status: 'Enabled',
                                                                                          );

                                                                                          if ((_model.updateScheduleById?.succeeded ?? true)) {
                                                                                            FFAppState().isTrigger = true;
                                                                                            _model.updatePage(() {});
                                                                                          } else {
                                                                                            FFAppState().isTrigger = false;
                                                                                            _model.updatePage(() {});
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: Text('error'),
                                                                                                  content: Text((_model.updateScheduleById?.exceptionMessage ?? '')),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        actionNo: () async {
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );

                                                                                safeSetState(() {});
                                                                              },
                                                                              switchActionOff: () async {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: ConfirmInfoWidget(
                                                                                        value: 'Disabled',
                                                                                        actionYes: () async {
                                                                                          _model.updateScheduleByIdFalse = await DevicesGroup.updateDeviceScheduleCall.call(
                                                                                            id: dScheduleModelItem.id,
                                                                                            status: 'Disabled',
                                                                                          );

                                                                                          if ((_model.updateScheduleByIdFalse?.succeeded ?? true)) {
                                                                                            FFAppState().isTrigger = true;
                                                                                            _model.updatePage(() {});
                                                                                          } else {
                                                                                            FFAppState().isTrigger = false;
                                                                                            _model.updatePage(() {});
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: Text('error'),
                                                                                                  content: Text((_model.updateScheduleByIdFalse?.exceptionMessage ?? '')),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        actionNo: () async {
                                                                                          Navigator.pop(context);
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
                                                                      ],
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
                                                      width: 20.0,
                                                      height: 20.0,
                                                      child: custom_widgets
                                                          .LoadingIndicatorWidget(
                                                        width: 20.0,
                                                        height: 20.0,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Builder(
                                    builder: (context) {
                                      if (widget.type != Flag.Add) {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '3h0rmks8' /* Location */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 47.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFAppState().storMapString,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
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
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'o4fyc7t5' /* Latitude */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 47.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFAppState().latitude.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
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
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'fj4ixuty' /* Longitude */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 47.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFAppState().longitude.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
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
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .cGoogleMapModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  CGoogleMapWidget(
                                                                mapAction:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: wrapWithModel(
                                            model: _model.noDataFoundedModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: NoDataFoundedWidget(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
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
    );
  }
}
