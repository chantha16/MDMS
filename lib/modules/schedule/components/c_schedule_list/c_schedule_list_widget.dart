import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/schedule/components/c_option_add_schedule/c_option_add_schedule_widget.dart';
import '/modules/schedule/components/c_schedule_action/c_schedule_action_widget.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'c_schedule_list_model.dart';
export 'c_schedule_list_model.dart';

class CScheduleListWidget extends StatefulWidget {
  const CScheduleListWidget({super.key});

  @override
  State<CScheduleListWidget> createState() => _CScheduleListWidgetState();
}

class _CScheduleListWidgetState extends State<CScheduleListWidget> {
  late CScheduleListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CScheduleListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.apiTriggerSchedule = await ScheduleGroup.readAllScheduleCall.call(
        search: '%${_model.searchScheduleTextController.text}%',
        limit: _model.limitPageValue,
        offset: _model.offset,
      );

      if ((_model.apiTriggerSchedule?.succeeded ?? true)) {
        _model.scheduleModel = (getJsonField(
          (_model.apiTriggerSchedule?.jsonBody ?? ''),
          r'''$.Schedule''',
          true,
        )!
                .toList()
                .map<ScheduleStruct?>(ScheduleStruct.maybeFromMap)
                .toList() as Iterable<ScheduleStruct?>)
            .withoutNulls
            .toList()
            .cast<ScheduleStruct>();
        _model.totalPageCount = getJsonField(
          (_model.apiTriggerSchedule?.jsonBody ?? ''),
          r'''$.Paging.Item.Total''',
        );
        safeSetState(() {});
        _model.isLoading = false;
        safeSetState(() {});
      }
    });

    _model.searchScheduleTextController ??=
        TextEditingController(text: FFAppState().storeSchedule);
    _model.searchScheduleFocusNode ??= FocusNode();

    _model.currentPageTextController ??=
        TextEditingController(text: _model.currentPage.toString());
    _model.currentPageFocusNode ??= FocusNode();

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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          controller: _model.searchScheduleTextController,
                          focusNode: _model.searchScheduleFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchScheduleTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 600));
                              _model.scheduleSearch =
                                  await ScheduleGroup.readAllScheduleCall.call(
                                search:
                                    '%${_model.searchScheduleTextController.text}%',
                                limit: _model.limitPageValue,
                                offset: _model.offset,
                              );

                              if ((_model.scheduleSearch?.succeeded ?? true)) {
                                _model.scheduleModel = (getJsonField(
                                  (_model.scheduleSearch?.jsonBody ?? ''),
                                  r'''$.Schedule''',
                                  true,
                                )!
                                        .toList()
                                        .map<ScheduleStruct?>(
                                            ScheduleStruct.maybeFromMap)
                                        .toList() as Iterable<ScheduleStruct?>)
                                    .withoutNulls
                                    .toList()
                                    .cast<ScheduleStruct>();
                                safeSetState(() {});
                                FFAppState().storeSchedule =
                                    _model.searchScheduleTextController.text;
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
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'km2xo6ae' /* Search */,
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
                            suffixIcon: _model.searchScheduleTextController!
                                    .text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.searchScheduleTextController
                                          ?.clear();
                                      await Future.delayed(
                                          const Duration(milliseconds: 600));
                                      _model.scheduleSearch =
                                          await ScheduleGroup
                                              .readAllScheduleCall
                                              .call(
                                        search:
                                            '%${_model.searchScheduleTextController.text}%',
                                        limit: _model.limitPageValue,
                                        offset: _model.offset,
                                      );

                                      if ((_model.scheduleSearch?.succeeded ??
                                          true)) {
                                        _model.scheduleModel = (getJsonField(
                                          (_model.scheduleSearch?.jsonBody ??
                                              ''),
                                          r'''$.Schedule''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<ScheduleStruct?>(
                                                        ScheduleStruct.maybeFromMap)
                                                    .toList()
                                                as Iterable<ScheduleStruct?>)
                                            .withoutNulls
                                            .toList()
                                            .cast<ScheduleStruct>();
                                        safeSetState(() {});
                                        FFAppState().storeSchedule = _model
                                            .searchScheduleTextController.text;
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
                          validator: _model
                              .searchScheduleTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Container(
                      width: 250.0,
                      height: 40.0,
                      child:
                          date_range_picker_marketplace_library_h3b4w8_custom_widgets
                              .DateRangePicker(
                        width: 250.0,
                        height: 40.0,
                        buttonTextColor: FlutterFlowTheme.of(context).primary,
                        buttonBackgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        buttonOutlineColor: Colors.transparent,
                        pickerDialogWidth: 500.0,
                        pickerDialogHeight: 600.0,
                        buttonCornerRadius: 12.0,
                        pickerSelectedDateColor:
                            FlutterFlowTheme.of(context).primary,
                        pickerCurrentDateColor:
                            FlutterFlowTheme.of(context).secondary,
                        pickerDialogPadding: 16.0,
                        initialStartDate: _model.startDate,
                        initialEndDate: _model.endDate,
                        onDateRangePicked:
                            (startDateSelected, endDateSelected) async {},
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Builder(
                      builder: (context) => wrapWithModel(
                        model: _model.primaryButtonWithIconModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: PrimaryButtonWithIconWidget(
                          tbName: FFLocalizations.of(context).getText(
                            'qjdyfazd' /* Add */,
                          ),
                          btIcon: Icon(
                            Icons.add_box,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          colorbottom: FlutterFlowTheme.of(context).primary,
                          textcolor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          btAction: () async {
                            await showAlignedDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              isGlobal: false,
                              avoidOverflow: false,
                              targetAnchor: AlignmentDirectional(0.0, 1.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: COptionAddScheduleWidget(
                                    deviceAction: () async {
                                      Navigator.pop(context);

                                      context.pushNamed(
                                        ScheduleViewWidget.routeName,
                                        queryParameters: {
                                          'typeSchedule': serializeParam(
                                            FlagSchedule.deviceschedule,
                                            ParamType.Enum,
                                          ),
                                          'type': serializeParam(
                                            Flag.Add,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    deviceGroupAction: () async {
                                      Navigator.pop(context);

                                      context.pushNamed(
                                        ScheduleViewWidget.routeName,
                                        queryParameters: {
                                          'typeSchedule': serializeParam(
                                            FlagSchedule.devicegroupschedule,
                                            ParamType.Enum,
                                          ),
                                          'type': serializeParam(
                                            Flag.Add,
                                            ParamType.Enum,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
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
                        colorbottom:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        textcolor: FlutterFlowTheme.of(context).primary,
                        btAction: () async {},
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
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
                    Expanded(
                      flex: 1,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'vg29sked' /* No */,
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
                          'gz4rx2rp' /* Start Date	 */,
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
                          '5hpqjjqs' /* End Date	 */,
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
                          'q9yb5abr' /* Schedule Type */,
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
                          'mkygjnvw' /* Interval */,
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
                          '2afnesm4' /* Last Execute Time */,
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
                          'y4bjbgsf' /* Next Execute Time */,
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
                          'usxl8bpx' /* Status */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
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
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          if (!_model.isLoading) {
                            return Builder(
                              builder: (context) {
                                final sechedulesItems =
                                    _model.scheduleModel.toList();
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
                                    final sechedulesItemsItem =
                                        sechedulesItems[sechedulesItemsIndex];
                                    return Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: functions
                                                .isOdd(sechedulesItemsIndex)
                                            ? FlutterFlowTheme.of(context)
                                                .primaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) =>
                                                    FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  buttonSize: 46.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  hoverIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  icon: Icon(
                                                    Icons.more_vert,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    await showAlignedDialog(
                                                      barrierColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      isGlobal: false,
                                                      avoidOverflow: true,
                                                      targetAnchor:
                                                          AlignmentDirectional(
                                                                  1.0, 1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      followerAnchor:
                                                          AlignmentDirectional(
                                                                  0.0, -1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      builder: (dialogContext) {
                                                        return Material(
                                                          color: Colors
                                                              .transparent,
                                                          child:
                                                              CScheduleActionWidget(
                                                            actionEdit:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);

                                                              context.pushNamed(
                                                                ScheduleViewWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'type':
                                                                      serializeParam(
                                                                    Flag.Update,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'scheduleId':
                                                                      serializeParam(
                                                                    sechedulesItemsItem
                                                                        .id,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            actionDelete:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);

                                                              context.pushNamed(
                                                                ScheduleViewWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'type':
                                                                      serializeParam(
                                                                    Flag.Delete,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'scheduleId':
                                                                      serializeParam(
                                                                    sechedulesItemsItem
                                                                        .id,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            actionView:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);

                                                              context.pushNamed(
                                                                ScheduleViewWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'type':
                                                                      serializeParam(
                                                                    Flag.View,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'scheduleId':
                                                                      serializeParam(
                                                                    sechedulesItemsItem
                                                                        .id,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
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
                                                child: SelectionArea(
                                                    child: Text(
                                                  (_model.offset +
                                                          sechedulesItemsIndex +
                                                          1)
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
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
                                                    functions
                                                        .convertTimestampFrom(
                                                            valueOrDefault<
                                                                String>(
                                                      sechedulesItemsItem
                                                          .startDate,
                                                      '-',
                                                    )),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
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
                                                    functions
                                                        .convertTimestampFrom(
                                                            valueOrDefault<
                                                                String>(
                                                      sechedulesItemsItem
                                                          .endDate,
                                                      '-',
                                                    )),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 95.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color: () {
                                                          if (sechedulesItemsItem
                                                                  .scheduleType ==
                                                              ScheduleType
                                                                  .Calculation
                                                                  .name) {
                                                            return Color(
                                                                0x839ECEA1);
                                                          } else if (sechedulesItemsItem
                                                                  .scheduleType ==
                                                              ScheduleType
                                                                  .Analytics
                                                                  .name) {
                                                            return Color(
                                                                0xFFB9CDD8);
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .cultured;
                                                          }
                                                        }(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      7.0,
                                                                      0.0,
                                                                      7.0,
                                                                      0.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            sechedulesItemsItem
                                                                .scheduleType,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 95.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color: () {
                                                          if (sechedulesItemsItem
                                                                  .interval ==
                                                              Intervals
                                                                  .Daily.name) {
                                                            return Color(
                                                                0xFFCCEBEA);
                                                          } else if (sechedulesItemsItem
                                                                  .interval ==
                                                              Intervals.Weekly
                                                                  .name) {
                                                            return Color(
                                                                0x4C4B39EF);
                                                          } else {
                                                            return Color(
                                                                0xFFFADDD4);
                                                          }
                                                        }(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      7.0,
                                                                      0.0,
                                                                      7.0,
                                                                      0.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            sechedulesItemsItem
                                                                .interval,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                  sechedulesItemsItem
                                                                  .lastExecutedTime ==
                                                              ''
                                                      ? 'N/A'
                                                      : dateTimeFormat(
                                                          "y-MM-dd, h:mm a",
                                                          functions
                                                              .convertTimestampFrom(
                                                                  valueOrDefault<
                                                                      String>(
                                                            sechedulesItemsItem
                                                                .lastExecutedTime,
                                                            '-',
                                                          )),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
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
                                                    functions
                                                        .convertTimestampFrom(
                                                            valueOrDefault<
                                                                String>(
                                                      sechedulesItemsItem
                                                          .nextExecuteTime,
                                                      '-',
                                                    )),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 95.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color: () {
                                                          if (sechedulesItemsItem
                                                                  .status ==
                                                              StatusSchedule
                                                                  .Enabled
                                                                  .name) {
                                                            return Color(
                                                                0x839ECEA1);
                                                          } else if (sechedulesItemsItem
                                                                  .status ==
                                                              StatusSchedule
                                                                  .Disabled
                                                                  .name) {
                                                            return Color(
                                                                0x4AEE8B60);
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate;
                                                          }
                                                        }(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      7.0,
                                                                      0.0,
                                                                      7.0,
                                                                      0.0),
                                                          child: Text(
                                                            sechedulesItemsItem
                                                                .status,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: () {
                                                                    if (sechedulesItemsItem
                                                                            .status ==
                                                                        StatusSchedule
                                                                            .Enabled
                                                                            .name) {
                                                                      return Color(
                                                                          0xFF60B863);
                                                                    } else if (sechedulesItemsItem
                                                                            .status ==
                                                                        StatusSchedule
                                                                            .Disabled
                                                                            .name) {
                                                                      return Color(
                                                                          0xFFFF6E40);
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                          if (FFAppState().storeSchedule ==
                                              Flag.Add.name)
                                            Container(
                                              width: 12.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF50EAA2),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
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
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 3.0, 16.0, 3.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '3r4k6ky0' /* Rows per page */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        FlutterFlowDropDown<int>(
                          controller: _model.limitPageValueController ??=
                              FormFieldController<int>(
                            _model.limitPageValue ??= 25,
                          ),
                          options: List<int>.from([25, 50, 100]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'jqvdqu8v' /* 25 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'y7ebz54f' /* 50 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'gd1nfv5w' /* 100 */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.limitPageValue = val);
                            _model.isLoading = true;
                            safeSetState(() {});
                            _model.currentPage = 1;
                            _model.offset = functions.calculateOffset(
                                _model.currentPage, _model.limitPageValue!);
                            safeSetState(() {});
                            await Future.delayed(
                                const Duration(milliseconds: 600));
                            safeSetState(() {
                              _model.currentPageTextController?.text =
                                  _model.currentPage.toString();
                            });
                            _model.apiLimitPage =
                                await ScheduleGroup.readAllScheduleCall.call(
                              search:
                                  '%${_model.searchScheduleTextController.text}%',
                              limit: _model.limitPageValue,
                              offset: _model.offset,
                            );

                            if ((_model.apiLimitPage?.succeeded ?? true)) {
                              _model.scheduleModel = (getJsonField(
                                (_model.apiLimitPage?.jsonBody ?? ''),
                                r'''$.Schedule''',
                                true,
                              )!
                                      .toList()
                                      .map<ScheduleStruct?>(
                                          ScheduleStruct.maybeFromMap)
                                      .toList() as Iterable<ScheduleStruct?>)
                                  .withoutNulls
                                  .toList()
                                  .cast<ScheduleStruct>();
                              _model.totalPageCount = getJsonField(
                                (_model.apiTriggerSchedule?.jsonBody ?? ''),
                                r'''$.Paging.Item.Total''',
                              );
                              safeSetState(() {});
                            }
                            _model.isLoading = false;
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                          width: 90.0,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'yqypo4tl' /* 25 */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 36.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: (_model.currentPage == 1)
                              ? null
                              : () async {
                                  _model.isLoading = true;
                                  safeSetState(() {});
                                  _model.currentPage = _model.currentPage + -1;
                                  _model.offset = functions.calculateOffset(
                                      _model.currentPage,
                                      _model.limitPageValue!);
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.currentPageTextController?.text =
                                        _model.currentPage.toString();
                                  });
                                  _model.apiButtonPrevious = await ScheduleGroup
                                      .readAllScheduleCall
                                      .call(
                                    search:
                                        '%${_model.searchScheduleTextController.text}%',
                                    limit: _model.limitPageValue,
                                    offset: _model.offset,
                                  );

                                  if ((_model.apiButtonPrevious?.succeeded ??
                                      true)) {
                                    _model.scheduleModel = (getJsonField(
                                      (_model.apiButtonPrevious?.jsonBody ??
                                          ''),
                                      r'''$.Schedule''',
                                      true,
                                    )!
                                                .toList()
                                                .map<ScheduleStruct?>(
                                                    ScheduleStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<ScheduleStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<ScheduleStruct>();
                                    _model.totalPageCount = getJsonField(
                                      (_model.apiTriggerSchedule?.jsonBody ??
                                          ''),
                                      r'''$.Paging.Item.Total''',
                                    );
                                    safeSetState(() {});
                                  }
                                  _model.isLoading = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                        ),
                        Container(
                          width: 50.0,
                          child: TextFormField(
                            controller: _model.currentPageTextController,
                            focusNode: _model.currentPageFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.currentPageTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.isLoading = true;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.currentPageTextController?.text =
                                      functions
                                          .validationPageInputNo(
                                              _model.currentPage.toString(),
                                              functions.calulationTotalPages(
                                                  _model.totalPageCount,
                                                  _model.limitPageValue!))
                                          .toString();
                                });
                                _model.currentPage = int.parse(
                                    _model.currentPageTextController.text);
                                _model.offset = functions.calculateOffset(
                                    _model.currentPage, _model.limitPageValue!);
                                safeSetState(() {});
                                _model.apiCurrentPage = await ScheduleGroup
                                    .readAllScheduleCall
                                    .call(
                                  search:
                                      '%${_model.searchScheduleTextController.text}%',
                                  limit: _model.limitPageValue,
                                  offset: _model.offset,
                                );

                                if ((_model.apiCurrentPage?.succeeded ??
                                    true)) {
                                  _model.scheduleModel = (getJsonField(
                                    (_model.apiCurrentPage?.jsonBody ?? ''),
                                    r'''$.Schedule''',
                                    true,
                                  )!
                                              .toList()
                                              .map<ScheduleStruct?>(
                                                  ScheduleStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<ScheduleStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<ScheduleStruct>();
                                  _model.totalPageCount = getJsonField(
                                    (_model.apiTriggerSchedule?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
                                  safeSetState(() {});
                                }
                                _model.isLoading = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: FFLocalizations.of(context).getText(
                                'byl75b16' /* 1 */,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
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
                            textAlign: TextAlign.center,
                            minLines: 1,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.currentPageTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'iq90hj51' /* of */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          functions
                              .calculateTotalPages(
                                  _model.totalPageCount, _model.limitPageValue!)
                              .toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 36.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: (_model.currentPage ==
                                  functions.calculateTotalPages(
                                      _model.totalPageCount,
                                      _model.limitPageValue!))
                              ? null
                              : () async {
                                  _model.isLoading = true;
                                  safeSetState(() {});
                                  _model.currentPage = _model.currentPage + 1;
                                  _model.offset = functions.calculateOffset(
                                      _model.currentPage,
                                      _model.limitPageValue!);
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.currentPageTextController?.text =
                                        _model.currentPage.toString();
                                  });
                                  _model.apiButtonNext = await ScheduleGroup
                                      .readAllScheduleCall
                                      .call(
                                    search:
                                        '%${_model.searchScheduleTextController.text}%',
                                    limit: _model.limitPageValue,
                                    offset: _model.offset,
                                  );

                                  if ((_model.apiButtonNext?.succeeded ??
                                      true)) {
                                    _model.scheduleModel = (getJsonField(
                                      (_model.apiButtonNext?.jsonBody ?? ''),
                                      r'''$.Schedule''',
                                      true,
                                    )!
                                                .toList()
                                                .map<ScheduleStruct?>(
                                                    ScheduleStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<ScheduleStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<ScheduleStruct>();
                                    _model.totalPageCount = getJsonField(
                                      (_model.apiTriggerSchedule?.jsonBody ??
                                          ''),
                                      r'''$.Paging.Item.Total''',
                                    );
                                    safeSetState(() {});
                                  }
                                  _model.isLoading = false;
                                  safeSetState(() {});

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
    );
  }
}
