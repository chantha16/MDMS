import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'c_validation_t_o_u_dynamic_model.dart';
export 'c_validation_t_o_u_dynamic_model.dart';

class CValidationTOUDynamicWidget extends StatefulWidget {
  const CValidationTOUDynamicWidget({
    super.key,
    this.index,
  });

  final int? index;

  @override
  State<CValidationTOUDynamicWidget> createState() =>
      _CValidationTOUDynamicWidgetState();
}

class _CValidationTOUDynamicWidgetState
    extends State<CValidationTOUDynamicWidget> {
  late CValidationTOUDynamicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CValidationTOUDynamicModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.color = Color(0x00000000);
      safeSetState(() {});
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'cibid23o' /* TOU Validation */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Inter Tight',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final listTimeBand = FFAppState()
                      .timeBand
                      .where((e) => e.name != '')
                      .toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listTimeBand.length,
                    itemBuilder: (context, listTimeBandIndex) {
                      final listTimeBandItem = listTimeBand[listTimeBandIndex];
                      return Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listTimeBandItem.name,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 80.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (FFAppState()
                                            .listIndexColor
                                            .elementAtOrNull(
                                                listTimeBandIndex) ==
                                        1) {
                                      return FlutterFlowTheme.of(context)
                                          .secondary;
                                    } else if (FFAppState()
                                            .listIndexColor
                                            .elementAtOrNull(
                                                listTimeBandIndex) ==
                                        2) {
                                      return FlutterFlowTheme.of(context)
                                          .tertiary;
                                    } else if (FFAppState()
                                            .listIndexColor
                                            .elementAtOrNull(
                                                listTimeBandIndex) ==
                                        3) {
                                      return FlutterFlowTheme.of(context)
                                          .warning;
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .accent3;
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(20.0),
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        Container(
                          height: 30.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 1.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                              Container(
                                width: 80.0,
                                height: 30.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'jcxp4169' /* Hour */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '2j0eifqz' /* Sun */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'uhp70d08' /* Mon */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3vb6ji73' /* Tue */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '7aoqgpma' /* Wed */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'sl1p8fgg' /* Thu */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '77be91nw' /* Fri */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'bmggjw86' /* Sat */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final timeToul =
                                  FFAppState().timeTouList.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: timeToul.length,
                                itemBuilder: (context, timeToulIndex) {
                                  final timeToulItem = timeToul[timeToulIndex];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 1.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                            Container(
                                              width: 80.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  timeToulItem,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if ((FFAppState()
                                                                          .DayTou
                                                                          .elementAtOrNull(
                                                                              0) ==
                                                                      functions.checkDayMessage(
                                                                          'Sun',
                                                                          functions
                                                                              .convertDayNumToString(FFAppState()
                                                                                  .timeBand
                                                                                  .map((e) => e
                                                                                      .timeBandAttributes.firstOrNull?.value.length)
                                                                                  .withoutNulls
                                                                                  .toList())
                                                                              .toList())) &&
                                                                  (FFAppState()
                                                                          .timeTouList
                                                                          .contains(
                                                                              timeToulItem) ==
                                                                      valueOrDefault<
                                                                          bool>(
                                                                        functions
                                                                            .convertTimeToHours(FFAppState().timeBand.elementAtOrNull(timeToulIndex)?.startTime,
                                                                                FFAppState().timeBand.elementAtOrNull(timeToulIndex)?.endTime)
                                                                            .contains(timeToulItem),
                                                                        false,
                                                                      ))) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary;
                                                              } else if ((FFAppState()
                                                                          .DayTou
                                                                          .elementAtOrNull(
                                                                              0) ==
                                                                      functions.checkDayMessage(
                                                                          'Sun',
                                                                          functions
                                                                              .convertDayNumToString(FFAppState().timeBand.map((e) => e.timeBandAttributes.firstOrNull?.value.length).withoutNulls.toList())
                                                                              .toList())) &&
                                                                  (FFAppState().timeTouList.contains(timeToulItem) ==
                                                                      valueOrDefault<bool>(
                                                                        functions
                                                                            .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime,
                                                                                FFAppState().timeBand.firstOrNull?.endTime)
                                                                            .contains(timeToulItem),
                                                                        false,
                                                                      )) &&
                                                                  (FFAppState().listIndexColor.elementAtOrNull(timeToulIndex) == 2)) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary;
                                                              } else if ((FFAppState().DayTou.elementAtOrNull(0) == functions.checkDayMessage('Sun', functions.convertDayNumToString(FFAppState().timeBand.map((e) => e.timeBandAttributes.firstOrNull?.value.length).withoutNulls.toList()).toList())) &&
                                                                  (FFAppState().timeTouList.contains(timeToulItem) ==
                                                                      valueOrDefault<bool>(
                                                                        functions
                                                                            .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime,
                                                                                FFAppState().timeBand.firstOrNull?.endTime)
                                                                            .contains(timeToulItem),
                                                                        false,
                                                                      )) &&
                                                                  (FFAppState().listIndexColor.elementAtOrNull(timeToulIndex) == 3)) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning;
                                                              } else {
                                                                return Color(
                                                                    0x00EE8B60);
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (FFAppState().DayTou.elementAtOrNull(
                                                                            1) ==
                                                                        functions.checkDayMessage(
                                                                            'Mon',
                                                                            functions
                                                                                .convertDayNumToString(FFAppState()
                                                                                    .timeBand
                                                                                    .map((e) => e
                                                                                        .timeBandAttributes.firstOrNull?.value.length)
                                                                                    .withoutNulls
                                                                                    .toList())
                                                                                .toList())) &&
                                                                    (FFAppState()
                                                                            .timeTouList
                                                                            .contains(
                                                                                timeToulItem) ==
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          functions
                                                                              .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime, FFAppState().timeBand.firstOrNull?.endTime)
                                                                              .contains(timeToulItem),
                                                                          false,
                                                                        ))
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : Color(
                                                                    0x00EE8B60),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (FFAppState().DayTou.elementAtOrNull(
                                                                            2) ==
                                                                        functions.checkDayMessage(
                                                                            'Tue',
                                                                            functions
                                                                                .convertDayNumToString(FFAppState()
                                                                                    .timeBand
                                                                                    .map((e) => e
                                                                                        .timeBandAttributes.firstOrNull?.value.length)
                                                                                    .withoutNulls
                                                                                    .toList())
                                                                                .toList())) &&
                                                                    (FFAppState()
                                                                            .timeTouList
                                                                            .contains(
                                                                                timeToulItem) ==
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          functions
                                                                              .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime, FFAppState().timeBand.firstOrNull?.endTime)
                                                                              .contains(timeToulItem),
                                                                          false,
                                                                        ))
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : Color(
                                                                    0x00EE8B60),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (FFAppState().DayTou.elementAtOrNull(
                                                                            3) ==
                                                                        functions.checkDayMessage(
                                                                            'Wed',
                                                                            functions
                                                                                .convertDayNumToString(FFAppState()
                                                                                    .timeBand
                                                                                    .map((e) => e
                                                                                        .timeBandAttributes.firstOrNull?.value.length)
                                                                                    .withoutNulls
                                                                                    .toList())
                                                                                .toList())) &&
                                                                    (FFAppState()
                                                                            .timeTouList
                                                                            .contains(
                                                                                timeToulItem) ==
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          functions
                                                                              .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime, FFAppState().timeBand.firstOrNull?.endTime)
                                                                              .contains(timeToulItem),
                                                                          false,
                                                                        ))
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : Color(
                                                                    0x00EE8B60),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (FFAppState().DayTou.elementAtOrNull(
                                                                            4) ==
                                                                        functions.checkDayMessage(
                                                                            'Thu',
                                                                            functions
                                                                                .convertDayNumToString(FFAppState()
                                                                                    .timeBand
                                                                                    .map((e) => e
                                                                                        .timeBandAttributes.firstOrNull?.value.length)
                                                                                    .withoutNulls
                                                                                    .toList())
                                                                                .toList())) &&
                                                                    (FFAppState()
                                                                            .timeTouList
                                                                            .contains(
                                                                                timeToulItem) ==
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          functions
                                                                              .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime, FFAppState().timeBand.firstOrNull?.endTime)
                                                                              .contains(timeToulItem),
                                                                          false,
                                                                        ))
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : Color(
                                                                    0x00EE8B60),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (FFAppState().DayTou.elementAtOrNull(
                                                                            5) ==
                                                                        functions.checkDayMessage(
                                                                            'Fri',
                                                                            functions
                                                                                .convertDayNumToString(FFAppState()
                                                                                    .timeBand
                                                                                    .map((e) => e
                                                                                        .timeBandAttributes.firstOrNull?.value.length)
                                                                                    .withoutNulls
                                                                                    .toList())
                                                                                .toList())) &&
                                                                    (FFAppState()
                                                                            .timeTouList
                                                                            .contains(
                                                                                timeToulItem) ==
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          functions
                                                                              .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime, FFAppState().timeBand.firstOrNull?.endTime)
                                                                              .contains(timeToulItem),
                                                                          false,
                                                                        ))
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : Color(
                                                                    0x00EE8B60),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (FFAppState().DayTou.elementAtOrNull(
                                                                            6) ==
                                                                        functions.checkDayMessage(
                                                                            'Sat',
                                                                            functions
                                                                                .convertDayNumToString(FFAppState()
                                                                                    .timeBand
                                                                                    .map((e) => e
                                                                                        .timeBandAttributes.firstOrNull?.value.length)
                                                                                    .withoutNulls
                                                                                    .toList())
                                                                                .toList())) &&
                                                                    (FFAppState()
                                                                            .timeTouList
                                                                            .contains(
                                                                                timeToulItem) ==
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          functions
                                                                              .convertTimeToHours(FFAppState().timeBand.firstOrNull?.startTime, FFAppState().timeBand.firstOrNull?.endTime)
                                                                              .contains(timeToulItem),
                                                                          false,
                                                                        ))
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : Color(
                                                                    0x00EE8B60),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
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
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
