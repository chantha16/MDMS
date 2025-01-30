import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'linechart_voltage_model.dart';
export 'linechart_voltage_model.dart';

class LinechartVoltageWidget extends StatefulWidget {
  const LinechartVoltageWidget({super.key});

  @override
  State<LinechartVoltageWidget> createState() => _LinechartVoltageWidgetState();
}

class _LinechartVoltageWidgetState extends State<LinechartVoltageWidget> {
  late LinechartVoltageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinechartVoltageModel());

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'fb1g7x7z' /* Voltage */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Stack(
                        children: [
                          FlutterFlowLineChart(
                            data: [
                              FFLineChartData(
                                xData: FFAppState().chart,
                                yData: FFAppState().chart,
                                settings: LineChartBarData(
                                  color: FlutterFlowTheme.of(context).primary,
                                  barWidth: 2.0,
                                  isCurved: true,
                                  preventCurveOverShooting: true,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              FFLineChartData(
                                xData: FFAppState().chart,
                                yData: FFAppState().chart,
                                settings: LineChartBarData(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  barWidth: 2.0,
                                  isCurved: true,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              FFLineChartData(
                                xData: FFAppState().chart,
                                yData: FFAppState().chart,
                                settings: LineChartBarData(
                                  color: Color(0xFF2536A4),
                                  barWidth: 2.0,
                                  isCurved: true,
                                ),
                              )
                            ],
                            chartStylingInfo: ChartStylingInfo(
                              enableTooltip: true,
                              tooltipBackgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              showGrid: true,
                              borderColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              borderWidth: 1.0,
                            ),
                            axisBounds: AxisBounds(),
                            xAxisLabelInfo: AxisLabelInfo(
                              showLabels: true,
                              labelTextStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              labelInterval: 5.0,
                              reservedSize: 50.0,
                            ),
                            yAxisLabelInfo: AxisLabelInfo(
                              title: FFLocalizations.of(context).getText(
                                '2gea6lw6' /* Voltage (Phase A, Phase B, Pha... */,
                              ),
                              titleTextStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              showLabels: true,
                              labelTextStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              labelInterval: 9.0,
                              labelFormatter: LabelFormatter(
                                numberFormat: (val) => formatNumber(
                                  val,
                                  formatType: FormatType.custom,
                                  format: '',
                                  locale: '',
                                ),
                              ),
                              reservedSize: 40.0,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: FlutterFlowChartLegendWidget(
                              entries: [
                                LegendEntry(
                                    FlutterFlowTheme.of(context).primary,
                                    FFLocalizations.of(context).getText(
                                      'jy1hhwfp' /* Phase A */,
                                    )),
                                LegendEntry(
                                    FlutterFlowTheme.of(context).secondary,
                                    FFLocalizations.of(context).getText(
                                      '8m9wmyig' /* Phase B */,
                                    )),
                                LegendEntry(
                                    Color(0xFF2536A4),
                                    FFLocalizations.of(context).getText(
                                      'xnyh3mv4' /* Phase C */,
                                    )),
                              ],
                              height: 5.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              textPadding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              borderWidth: 1.0,
                              indicatorSize: 10.0,
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
    );
  }
}
