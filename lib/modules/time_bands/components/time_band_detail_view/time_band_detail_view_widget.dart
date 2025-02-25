import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/time_bands/components/time_band_season_detail/time_band_season_detail_widget.dart';
import '/modules/time_bands/components/time_band_season_drop_down/time_band_season_drop_down_widget.dart';
import '/modules/time_bands/components/time_band_seasonltem_select/time_band_seasonltem_select_widget.dart';
import '/modules/time_bands/components/time_band_special_day_detail/time_band_special_day_detail_widget.dart';
import '/modules/time_bands/components/time_band_special_day_drop_down/time_band_special_day_drop_down_widget.dart';
import '/modules/time_bands/components/time_band_specialltem_select/time_band_specialltem_select_widget.dart';
import '/modules/time_bands/components/time_band_time_picker/time_band_time_picker_widget.dart';
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
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'time_band_detail_view_model.dart';
export 'time_band_detail_view_model.dart';

class TimeBandDetailViewWidget extends StatefulWidget {
  const TimeBandDetailViewWidget({
    super.key,
    required this.type,
    this.timeBandId,
    this.minuteOptions,
  });

  final Flag? type;
  final int? timeBandId;
  final List<int>? minuteOptions;

  @override
  State<TimeBandDetailViewWidget> createState() =>
      _TimeBandDetailViewWidgetState();
}

class _TimeBandDetailViewWidgetState extends State<TimeBandDetailViewWidget> {
  late TimeBandDetailViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandDetailViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.type != Flag.Add) {
        // Action Loading False
        FFAppState().loading = false;
        safeSetState(() {});
        _model.seasonRes = await TimeBandGroup.readTimeBandByIdCall.call(
          id: widget.timeBandId,
        );

        if ((_model.seasonRes?.succeeded ?? true)) {
          FFAppState().timeBandAttributes = (getJsonField(
            (_model.seasonRes?.jsonBody ?? ''),
            r'''$.TimeBand.TimeBandAttributes''',
            true,
          )!
                  .toList()
                  .map<TimeBandAttributesModelStruct?>(
                      TimeBandAttributesModelStruct.maybeFromMap)
                  .toList() as Iterable<TimeBandAttributesModelStruct?>)
              .withoutNulls
              .toList()
              .cast<TimeBandAttributesModelStruct>();
          // Add all attributes list to attribute list on app state
          FFAppState().timebandDataState = (getJsonField(
            (_model.seasonRes?.jsonBody ?? ''),
            r'''$.TimeBand.TimeBandAttributes''',
            true,
          )!
                  .toList()
                  .map<AttributeModelStruct?>(AttributeModelStruct.maybeFromMap)
                  .toList() as Iterable<AttributeModelStruct?>)
              .withoutNulls
              .toList()
              .cast<AttributeModelStruct>();
          await _model.initExistedAttribute(context);
          await Future.wait([
            Future(() async {
              if ((FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key == TimeBandAttributeKey.Season.name)
                              .toList()
                              .firstOrNull
                              ?.seasons !=
                          null &&
                      (FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key == TimeBandAttributeKey.Season.name)
                              .toList()
                              .firstOrNull
                              ?.seasons)!
                          .isNotEmpty) ==
                  true) {
                _model.seasonModel = FFAppState()
                    .timeBandAttributes
                    .where((e) => e.key == TimeBandAttributeKey.Season.name)
                    .toList()
                    .firstOrNull!
                    .seasons
                    .toList()
                    .cast<SeasonModelStruct>();
                FFAppState().seasonState = FFAppState()
                    .timeBandAttributes
                    .where((e) => e.key == TimeBandAttributeKey.Season.name)
                    .toList()
                    .firstOrNull!
                    .seasons
                    .toList()
                    .cast<SeasonModelStruct>();
              }
            }),
            Future(() async {
              if ((FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key == TimeBandAttributeKey.SpecialDay.name)
                              .toList()
                              .firstOrNull
                              ?.specialDays !=
                          null &&
                      (FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key == TimeBandAttributeKey.SpecialDay.name)
                              .toList()
                              .firstOrNull
                              ?.specialDays)!
                          .isNotEmpty) ==
                  true) {
                _model.specialDayModel = FFAppState()
                    .timeBandAttributes
                    .where((e) => e.key == TimeBandAttributeKey.SpecialDay.name)
                    .toList()
                    .firstOrNull!
                    .specialDays
                    .toList()
                    .cast<SpecialDayModelStruct>();
                FFAppState().specialDayState = FFAppState()
                    .timeBandAttributes
                    .where((e) => e.key == TimeBandAttributeKey.SpecialDay.name)
                    .toList()
                    .firstOrNull!
                    .specialDays
                    .toList()
                    .cast<SpecialDayModelStruct>();
              }
            }),
            Future(() async {
              if ((FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key == TimeBandAttributeKey.DayOfWeek.name)
                              .toList()
                              .firstOrNull
                              ?.value !=
                          null &&
                      (FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key == TimeBandAttributeKey.DayOfWeek.name)
                              .toList()
                              .firstOrNull
                              ?.value)!
                          .isNotEmpty) ==
                  true) {
                _model.dayOfWeekState = FFAppState()
                    .timeBandAttributes
                    .where((e) => e.key == TimeBandAttributeKey.DayOfWeek.name)
                    .toList()
                    .firstOrNull!
                    .value
                    .toList()
                    .cast<int>();
                safeSetState(() {
                  _model.dayOfWeekChoichchipValueController?.value =
                      functions.splitStringByCommaDayofWeek(
                          _model.dayOfWeekState.toList());
                });
              }
            }),
            Future(() async {
              if ((FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key ==
                                  TimeBandAttributeKey.MonthOfYear.name)
                              .toList()
                              .firstOrNull
                              ?.value !=
                          null &&
                      (FFAppState()
                              .timeBandAttributes
                              .where((e) =>
                                  e.key ==
                                  TimeBandAttributeKey.MonthOfYear.name)
                              .toList()
                              .firstOrNull
                              ?.value)!
                          .isNotEmpty) ==
                  true) {
                _model.monthOfYearState = FFAppState()
                    .timeBandAttributes
                    .where(
                        (e) => e.key == TimeBandAttributeKey.MonthOfYear.name)
                    .toList()
                    .firstOrNull!
                    .value
                    .toList()
                    .cast<int>();
                safeSetState(() {
                  _model.monthOfYearChoichchipValueController?.value =
                      functions.splitStringByCommaMonthofYear(
                          _model.monthOfYearState.toList());
                });
              }
            }),
          ]);
          // Action Loading True
          FFAppState().loading = true;
          safeSetState(() {});
          _model.timeBandModel = TimeBandModelStruct.maybeFromMap(getJsonField(
            (_model.seasonRes?.jsonBody ?? ''),
            r'''$.TimeBand''',
          ));
          _model.timeBandAttributesModel = (getJsonField(
            (_model.seasonRes?.jsonBody ?? ''),
            r'''$.TimeBand.TimeBandAttributes''',
            true,
          )!
                  .toList()
                  .map<TimeBandAttributesModelStruct?>(
                      TimeBandAttributesModelStruct.maybeFromMap)
                  .toList() as Iterable<TimeBandAttributesModelStruct?>)
              .withoutNulls
              .toList()
              .cast<TimeBandAttributesModelStruct>();
          safeSetState(() {});
          safeSetState(() {
            _model.nameTextController?.text = _model.timeBandModel!.name;
          });
          safeSetState(() {
            _model.descriptionTextController?.text =
                _model.timeBandModel!.description;
          });
          FFAppState().selectedStartTime =
              functions.formatTime(_model.timeBandModel!.startTime);
          FFAppState().selectedEndTime =
              functions.formatTime(_model.timeBandModel!.endTime);
          safeSetState(() {});
        } else {
          return;
        }
      } else {
        FFAppState().seasonState = [];
        safeSetState(() {});
        FFAppState().specialDayState = [];
        safeSetState(() {});
        FFAppState().selectedStartTime = '';
        FFAppState().selectedEndTime = '';
        safeSetState(() {});
      }
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.startTimeTextController ??= TextEditingController();
    _model.startTimeFocusNode ??= FocusNode();

    _model.endTimeTextController ??= TextEditingController();
    _model.endTimeFocusNode ??= FocusNode();

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

    return Builder(
      builder: (context) {
        if (FFAppState().loading) {
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
                        context.pushNamed(
                          TimeBandPageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        FFAppState().timebandDataState = [];
                        safeSetState(() {});
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          () {
                            if (widget.type == Flag.Add) {
                              return 'Add Time Band';
                            } else if (widget.type == Flag.Update) {
                              return 'Update Time Band';
                            } else if (widget.type == Flag.Delete) {
                              return 'Delete Time Band';
                            } else {
                              return 'View Time Band';
                            }
                          }(),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Expanded(
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          150.0, 0.0, 150.0, 0.0),
                      child: SingleChildScrollView(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '11awrpe8' /* Name */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'idn4cniy' /*  * */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _model.nameTextController,
                                        focusNode: _model.nameFocusNode,
                                        autofocus: false,
                                        readOnly: (widget.type == Flag.View) ||
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              )
                                            ],
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 19.0, 16.0, 19.0),
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
                                        maxLength: 200,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: TextInputType.name,
                                        validator: _model
                                            .nameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'f5xn4wgy' /* Hello World */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 15.0)),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'lsfefaj6' /* Start Time */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '5ydx4m3k' /*  * */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: true,
                                              targetAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child:
                                                      TimeBandTimePickerWidget(
                                                    time: FFAppState()
                                                        .selectedStartTime,
                                                    timeType: Time.StartTime,
                                                  ),
                                                );
                                              },
                                            );

                                            await _model
                                                .generateDescription(context);
                                            safeSetState(() {
                                              _model.descriptionTextController
                                                      ?.text =
                                                  _model.genDescription!;
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 46.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: _model.isPickStartTime ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .error
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Expanded(
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .startTimeTextController,
                                                          focusNode: _model
                                                              .startTimeFocusNode,
                                                          autofocus: false,
                                                          readOnly: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          46.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        19.0,
                                                                        16.0,
                                                                        19.0),
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
                                                          maxLines: null,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .startTimeTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
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
                                                        FFAppState()
                                                            .selectedStartTime,
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                    Icons.timer_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.isPickStartTime == true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '5vv5nvqi' /* Please pick start time. */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFFE85059),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  's613delp' /* End Time */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'pc9ovwcd' /*  * */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: true,
                                              targetAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child:
                                                      TimeBandTimePickerWidget(
                                                    time: FFAppState()
                                                        .selectedEndTime,
                                                    timeType: Time.EndTime,
                                                  ),
                                                );
                                              },
                                            );

                                            await _model
                                                .generateDescription(context);
                                            safeSetState(() {
                                              _model.descriptionTextController
                                                      ?.text =
                                                  _model.genDescription!;
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 46.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    _model.isPickEndTime == true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .error
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Expanded(
                                                    child: Container(
                                                      width: 200.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .endTimeTextController,
                                                        focusNode: _model
                                                            .endTimeFocusNode,
                                                        autofocus: false,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        46.0,
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
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
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                                                        8.0),
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
                                                                        8.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      19.0,
                                                                      16.0,
                                                                      19.0),
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
                                                        maxLines: null,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .endTimeTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFAppState()
                                                          .selectedEndTime,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Icon(
                                                    Icons.timer_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.isPickEndTime == true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'sd4tzc83' /* Please pick end time. */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFFE85059),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'noqcqesd' /* Day of Week */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 5.0, 16.0, 5.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(Day.Sun.name),
                                                ChipData(Day.Mon.name),
                                                ChipData(Day.Tue.name),
                                                ChipData(Day.Wed.name),
                                                ChipData(Day.Thu.name),
                                                ChipData(Day.Fri.name),
                                                ChipData(Day.Sat.name)
                                              ],
                                              onChanged:
                                                  ((widget.type ==
                                                              Flag.View) ||
                                                          (widget.type ==
                                                              Flag.Delete))
                                                      ? null
                                                      : (val) async {
                                                          safeSetState(() =>
                                                              _model.dayOfWeekChoichchipValues =
                                                                  val);
                                                          _model.dayOfWeekState = functions
                                                              .convertDaysToInt(
                                                                  _model
                                                                      .dayOfWeekChoichchipValues!
                                                                      .toList())
                                                              .toList()
                                                              .cast<int>();
                                                          safeSetState(() {});
                                                          if ((_model
                                                                  .dayOfWeekState
                                                                  .isNotEmpty) ==
                                                              true) {
                                                            if (_model
                                                                    .dayOfWeekAttribute !=
                                                                null) {
                                                              _model
                                                                  .updateDayOfWeekAttributeStruct(
                                                                (e) => e
                                                                  ..value = _model
                                                                      .dayOfWeekState
                                                                      .toList()
                                                                  ..active =
                                                                      null,
                                                              );
                                                            } else {
                                                              _model.dayOfWeekAttribute =
                                                                  AttributeModelStruct(
                                                                key: TimeBandAttributeKey
                                                                    .DayOfWeek
                                                                    .name,
                                                                value: _model
                                                                    .dayOfWeekState,
                                                              );
                                                            }
                                                          } else {
                                                            if (_model
                                                                    .dayOfWeekAttribute !=
                                                                null) {
                                                              _model.dayOfWeekExisted =
                                                                  await _model
                                                                      .checkAttributeExisted(
                                                                context,
                                                                key: TimeBandAttributeKey
                                                                    .DayOfWeek,
                                                              );
                                                              if (_model
                                                                  .dayOfWeekExisted!) {
                                                                _model
                                                                    .updateDayOfWeekAttributeStruct(
                                                                  (e) => e
                                                                    ..value = _model
                                                                        .dayOfWeekState
                                                                        .toList()
                                                                    ..active =
                                                                        false,
                                                                );
                                                              } else {
                                                                _model.dayOfWeekAttribute =
                                                                    null;
                                                              }
                                                            }
                                                          }

                                                          await _model
                                                              .generateDescription(
                                                                  context);
                                                          safeSetState(() {
                                                            _model.descriptionTextController
                                                                    ?.text =
                                                                _model
                                                                    .genDescription!;
                                                          });

                                                          safeSetState(() {});
                                                        },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 2.0,
                                                            10.0, 2.0),
                                                elevation: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 2.0,
                                                            10.0, 2.0),
                                                elevation: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: true,
                                              initialized: _model
                                                      .dayOfWeekChoichchipValues !=
                                                  null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .dayOfWeekChoichchipValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              wrapped: true,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '9yrdtzbl' /* Month of Year */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 5.0, 16.0, 5.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(Month.Jan.name),
                                                ChipData(Month.Feb.name),
                                                ChipData(Month.Mar.name),
                                                ChipData(Month.Apr.name),
                                                ChipData(Month.May.name),
                                                ChipData(Month.Jun.name),
                                                ChipData(Month.Jul.name),
                                                ChipData(Month.Aug.name),
                                                ChipData(Month.Sep.name),
                                                ChipData(Month.Oct.name),
                                                ChipData(Month.Nov.name),
                                                ChipData(Month.Dec.name)
                                              ],
                                              onChanged:
                                                  ((widget.type ==
                                                              Flag.View) ||
                                                          (widget.type ==
                                                              Flag.Delete))
                                                      ? null
                                                      : (val) async {
                                                          safeSetState(() =>
                                                              _model.monthOfYearChoichchipValues =
                                                                  val);
                                                          _model.monthOfYearState = functions
                                                              .convertMonthsToInt(
                                                                  _model
                                                                      .monthOfYearChoichchipValues!
                                                                      .toList())
                                                              .toList()
                                                              .cast<int>();
                                                          _model
                                                              .updateMonthOfYearAttributeStruct(
                                                            (e) => e
                                                              ..key =
                                                                  TimeBandAttributeKey
                                                                      .MonthOfYear
                                                                      .name
                                                              ..value = _model
                                                                  .monthOfYearState
                                                                  .toList(),
                                                          );
                                                          safeSetState(() {});
                                                          if (_model
                                                              .monthOfYearState
                                                              .isNotEmpty) {
                                                            if (_model
                                                                    .monthOfYearAttribute !=
                                                                null) {
                                                              _model
                                                                  .updateMonthOfYearAttributeStruct(
                                                                (e) => e
                                                                  ..value = _model
                                                                      .monthOfYearState
                                                                      .toList()
                                                                  ..active =
                                                                      null,
                                                              );
                                                            } else {
                                                              _model.dayOfWeekAttribute =
                                                                  AttributeModelStruct(
                                                                key: TimeBandAttributeKey
                                                                    .DayOfWeek
                                                                    .name,
                                                                value: _model
                                                                    .dayOfWeekState,
                                                              );
                                                              _model.monthOfYearAttribute =
                                                                  AttributeModelStruct(
                                                                key: TimeBandAttributeKey
                                                                    .MonthOfYear
                                                                    .name,
                                                                value: _model
                                                                    .monthOfYearState,
                                                              );
                                                            }
                                                          } else {
                                                            if (_model
                                                                    .monthOfYearAttribute !=
                                                                null) {
                                                              _model.monthOfYearExisted =
                                                                  await _model
                                                                      .checkAttributeExisted(
                                                                context,
                                                                key: TimeBandAttributeKey
                                                                    .MonthOfYear,
                                                              );
                                                              if (_model
                                                                  .monthOfYearExisted!) {
                                                                _model
                                                                    .updateMonthOfYearAttributeStruct(
                                                                  (e) => e
                                                                    ..value = _model
                                                                        .monthOfYearState
                                                                        .toList()
                                                                    ..active =
                                                                        false,
                                                                );
                                                              } else {
                                                                _model.monthOfYearAttribute =
                                                                    null;
                                                              }
                                                            }
                                                          }

                                                          await _model
                                                              .generateDescription(
                                                                  context);
                                                          safeSetState(() {
                                                            _model.descriptionTextController
                                                                    ?.text =
                                                                _model
                                                                    .genDescription!;
                                                          });

                                                          safeSetState(() {});
                                                        },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 2.0,
                                                            10.0, 2.0),
                                                elevation: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 2.0,
                                                            10.0, 2.0),
                                                elevation: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: true,
                                              initialized: _model
                                                      .monthOfYearChoichchipValues !=
                                                  null,
                                              alignment: WrapAlignment.center,
                                              controller: _model
                                                      .monthOfYearChoichchipValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              wrapped: true,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '1oiuddpu' /* Season */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 46.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Builder(
                                          builder: (context) => wrapWithModel(
                                            model: _model
                                                .timeBandSeasonltemSelectModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                TimeBandSeasonltemSelectWidget(
                                              type: widget.type,
                                              actionAdd: () async {
                                                await showAlignedDialog(
                                                  barrierColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  isGlobal: false,
                                                  avoidOverflow: true,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              -1.0, 1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              -1.0, -1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child:
                                                          TimeBandSeasonDropDownWidget(),
                                                    );
                                                  },
                                                );

                                                if ((FFAppState()
                                                        .seasonState
                                                        .isNotEmpty) ==
                                                    true) {
                                                  if (_model.seasonAttribute !=
                                                      null) {
                                                    // season ever existed
                                                    _model
                                                        .updateSeasonAttributeStruct(
                                                      (e) => e
                                                        ..value = FFAppState()
                                                            .seasonState
                                                            .map((e) => e.id)
                                                            .toList()
                                                        ..active = null,
                                                    );
                                                  } else {
                                                    // season never select before, add new object
                                                    _model.seasonAttribute =
                                                        AttributeModelStruct(
                                                      key: TimeBandAttributeKey
                                                          .Season.name,
                                                      value: FFAppState()
                                                          .seasonState
                                                          .map((e) => e.id)
                                                          .toList(),
                                                    );
                                                  }
                                                } else {
                                                  _model.seasonAttribute = null;
                                                }

                                                await _model
                                                    .generateDescription(
                                                        context);
                                                safeSetState(() {
                                                  _model.descriptionTextController
                                                          ?.text =
                                                      _model.genDescription!;
                                                });
                                              },
                                              actionDetail: (id) async {
                                                await showAlignedDialog(
                                                  context: context,
                                                  isGlobal: false,
                                                  avoidOverflow: true,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child:
                                                          TimeBandSeasonDetailWidget(
                                                        type: Flag.View,
                                                        seasonId: id,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              onRemove: () async {
                                                if ((FFAppState()
                                                        .seasonState
                                                        .isNotEmpty) ==
                                                    true) {
                                                  if (_model.seasonAttribute !=
                                                      null) {
                                                    // season ever existed
                                                    _model
                                                        .updateSeasonAttributeStruct(
                                                      (e) => e
                                                        ..value = FFAppState()
                                                            .seasonState
                                                            .map((e) => e.id)
                                                            .toList()
                                                        ..active = null,
                                                    );
                                                  } else {
                                                    // season never select before, add new object
                                                    _model.seasonAttribute =
                                                        AttributeModelStruct(
                                                      key: TimeBandAttributeKey
                                                          .Season.name,
                                                      value: FFAppState()
                                                          .seasonState
                                                          .map((e) => e.id)
                                                          .toList(),
                                                    );
                                                  }
                                                } else {
                                                  if (_model.seasonAttribute !=
                                                      null) {
                                                    _model.attributeExisted =
                                                        await _model
                                                            .checkAttributeExisted(
                                                      context,
                                                      key: TimeBandAttributeKey
                                                          .Season,
                                                    );
                                                    if (_model
                                                        .attributeExisted!) {
                                                      // When user does not select any of the season, we're going to check if the season attribute ever existed before meaning season attribute ever existed in timeBandDataState in App state. If ever existed, we're going to update it value and active to false, otherwise we're going to reset the season attribute object back so that when we're about to click save, the logic will not include season attribute after we reset it coz it never existed when init anyway.
                                                      // Update attribute when existed
                                                      _model
                                                          .updateSeasonAttributeStruct(
                                                        (e) => e
                                                          ..value = FFAppState()
                                                              .seasonState
                                                              .map((e) => e.id)
                                                              .toList()
                                                          ..active = false,
                                                      );
                                                    } else {
                                                      // Reset attr coz when init never existed
                                                      _model.seasonAttribute =
                                                          null;
                                                    }
                                                  }
                                                }

                                                await _model
                                                    .generateDescription(
                                                        context);
                                                safeSetState(() {
                                                  _model.descriptionTextController
                                                          ?.text =
                                                      _model.genDescription!;
                                                });

                                                safeSetState(() {});
                                              },
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'cj77ou7f' /* Special Day */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 46.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Builder(
                                          builder: (context) => wrapWithModel(
                                            model: _model
                                                .timeBandSpecialltemSelectModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                TimeBandSpecialltemSelectWidget(
                                              type: widget.type,
                                              actionAdd: () async {
                                                await showAlignedDialog(
                                                  barrierColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  isGlobal: false,
                                                  avoidOverflow: true,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              -1.0, 1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              -1.0, -1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child:
                                                          TimeBandSpecialDayDropDownWidget(),
                                                    );
                                                  },
                                                );

                                                if ((FFAppState()
                                                        .specialDayState
                                                        .isNotEmpty) ==
                                                    true) {
                                                  if (_model
                                                          .specialDayAttribute !=
                                                      null) {
                                                    _model
                                                        .updateSpecialDayAttributeStruct(
                                                      (e) => e
                                                        ..value = FFAppState()
                                                            .specialDayState
                                                            .map((e) => e.id)
                                                            .toList()
                                                        ..active = null,
                                                    );
                                                  } else {
                                                    _model.specialDayAttribute =
                                                        AttributeModelStruct(
                                                      key: TimeBandAttributeKey
                                                          .SpecialDay.name,
                                                      value: FFAppState()
                                                          .specialDayState
                                                          .map((e) => e.id)
                                                          .toList(),
                                                    );
                                                  }
                                                } else {
                                                  _model.specialDayAttribute =
                                                      null;
                                                }

                                                await _model
                                                    .generateDescription(
                                                        context);
                                                safeSetState(() {
                                                  _model.descriptionTextController
                                                          ?.text =
                                                      _model.genDescription!;
                                                });
                                              },
                                              actionDetail: (id) async {
                                                await showAlignedDialog(
                                                  context: context,
                                                  isGlobal: false,
                                                  avoidOverflow: true,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child:
                                                          TimeBandSpecialDayDetailWidget(
                                                        type: Flag.View,
                                                        specialDayId: id,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              onRemove: () async {
                                                if ((FFAppState()
                                                        .specialDayState
                                                        .isNotEmpty) ==
                                                    true) {
                                                  if (_model
                                                          .specialDayAttribute !=
                                                      null) {
                                                    _model
                                                        .updateSpecialDayAttributeStruct(
                                                      (e) => e
                                                        ..value = FFAppState()
                                                            .specialDayState
                                                            .map((e) => e.id)
                                                            .toList()
                                                        ..active = null,
                                                    );
                                                  } else {
                                                    _model.specialDayAttribute =
                                                        AttributeModelStruct(
                                                      key: TimeBandAttributeKey
                                                          .SpecialDay.name,
                                                      value: FFAppState()
                                                          .specialDayState
                                                          .map((e) => e.id)
                                                          .toList(),
                                                    );
                                                  }
                                                } else {
                                                  if (_model
                                                          .specialDayAttribute !=
                                                      null) {
                                                    _model.specialDayAttributeExisted =
                                                        await _model
                                                            .checkAttributeExisted(
                                                      context,
                                                      key: TimeBandAttributeKey
                                                          .SpecialDay,
                                                    );
                                                    if (_model
                                                        .specialDayAttributeExisted!) {
                                                      _model
                                                          .updateSpecialDayAttributeStruct(
                                                        (e) => e
                                                          ..value = FFAppState()
                                                              .specialDayState
                                                              .map((e) => e.id)
                                                              .toList()
                                                          ..active = false,
                                                      );
                                                    } else {
                                                      _model.specialDayAttribute =
                                                          null;
                                                    }
                                                  }
                                                }

                                                await _model
                                                    .generateDescription(
                                                        context);
                                                safeSetState(() {
                                                  _model.descriptionTextController
                                                          ?.text =
                                                      _model.genDescription!;
                                                });

                                                safeSetState(() {});
                                              },
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
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
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
                                                      'l9vpbnnz' /* Description */,
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
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.descriptionTextController,
                                        focusNode: _model.descriptionFocusNode,
                                        autofocus: false,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              )
                                            ],
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 18.0, 20.0, 18.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: 5,
                                        maxLength: 2000,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        validator: _model
                                            .descriptionTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(150.0, 0.0, 150.0, 0.0),
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
                      if (widget.type != Flag.View)
                        wrapWithModel(
                          model: _model.primaryButtonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryButtonWidget(
                            tbName: 'Save',
                            font:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fillcolor: FlutterFlowTheme.of(context).primary,
                            btAction: () async {
                              var _shouldSetState = false;
                              if (widget.type == Flag.Add) {
                                await _model.invalid(context);
                                safeSetState(() {});
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if ((_model.isPickStartTime == false) &&
                                    (_model.isPickEndTime == false)) {
                                  FFAppState().timebandDataState = [];
                                  if (_model.dayOfWeekAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.dayOfWeekAttribute!);
                                  }
                                  if (_model.seasonAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.seasonAttribute!);
                                  }
                                  if (_model.specialDayAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.specialDayAttribute!);
                                  }
                                  if (_model.monthOfYearAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.monthOfYearAttribute!);
                                  }
                                  _model.apiResultfbl = await TimeBandGroup
                                      .createTimeBandCall
                                      .call(
                                    name: _model.nameTextController.text,
                                    description:
                                        _model.descriptionTextController.text,
                                    startTime:
                                        '${FFAppState().selectedStartTime}:00',
                                    endTime: functions.adjustEndTime(
                                        '${FFAppState().selectedEndTime}:00',
                                        false),
                                    dataJson: FFAppState()
                                        .timebandDataState
                                        .map((e) => e.toMap())
                                        .toList(),
                                  );

                                  _shouldSetState = true;
                                  if (!(_model.apiResultfbl?.succeeded ??
                                      true)) {
                                    await action_blocks.handleExceptions(
                                      context,
                                      message: HandleErrorStruct.maybeFromMap(
                                                      (_model.apiResultfbl
                                                              ?.jsonBody ??
                                                          ''))
                                                  ?.code ==
                                              'constraint-violation'
                                          ? '${_model.nameTextController.text} already exists.'
                                          : HandleErrorStruct.maybeFromMap(
                                                  (_model.apiResultfbl
                                                          ?.jsonBody ??
                                                      ''))
                                              ?.code,
                                      title: 'Something went wrong!',
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else if (widget.type == Flag.Update) {
                                await _model.invalid(context);
                                safeSetState(() {});
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if ((_model.isPickStartTime == false) &&
                                    (_model.isPickEndTime == false)) {
                                  FFAppState().timebandDataState = [];
                                  if (_model.dayOfWeekAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.dayOfWeekAttribute!);
                                  }
                                  if (_model.seasonAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.seasonAttribute!);
                                  }
                                  if (_model.specialDayAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.specialDayAttribute!);
                                  }
                                  if (_model.monthOfYearAttribute != null) {
                                    FFAppState().addToTimebandDataState(
                                        _model.monthOfYearAttribute!);
                                  }
                                  _model.apiResultpe5 = await TimeBandGroup
                                      .updateTimeBandCall
                                      .call(
                                    name: _model.nameTextController.text,
                                    description:
                                        _model.descriptionTextController.text,
                                    startTime:
                                        '${FFAppState().selectedStartTime}:00',
                                    endTime: functions.adjustEndTime(
                                        '${FFAppState().selectedEndTime}:00',
                                        false),
                                    id: widget.timeBandId,
                                    dataJson: FFAppState()
                                        .timebandDataState
                                        .map((e) => e.toMap())
                                        .toList(),
                                  );

                                  _shouldSetState = true;
                                  if (!(_model.apiResultpe5?.succeeded ??
                                      true)) {
                                    await action_blocks.handleExceptions(
                                      context,
                                      message: HandleErrorStruct.maybeFromMap(
                                                      (_model.apiResultpe5
                                                              ?.jsonBody ??
                                                          ''))
                                                  ?.code ==
                                              'constraint-violation'
                                          ? '${_model.nameTextController.text} already exists.'
                                          : HandleErrorStruct.maybeFromMap(
                                                  (_model.apiResultpe5
                                                          ?.jsonBody ??
                                                      ''))
                                              ?.code,
                                      title: 'Something went wrong!',
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else if (widget.type == Flag.Delete) {
                                _model.apiResultlcw =
                                    await TimeBandGroup.deleteTimeBandCall.call(
                                  id: widget.timeBandId,
                                );

                                _shouldSetState = true;
                                if (!(_model.apiResultlcw?.succeeded ?? true)) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              FFAppState().storeName =
                                  _model.nameTextController.text;
                              safeSetState(() {});

                              context.pushNamed(
                                TimeBandPageWidget.routeName,
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
        } else {
          return Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 50.0,
              height: 50.0,
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
