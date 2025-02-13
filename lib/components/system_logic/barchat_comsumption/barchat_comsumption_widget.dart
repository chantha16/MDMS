import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'barchat_comsumption_model.dart';
export 'barchat_comsumption_model.dart';

class BarchatComsumptionWidget extends StatefulWidget {
  const BarchatComsumptionWidget({super.key});

  @override
  State<BarchatComsumptionWidget> createState() =>
      _BarchatComsumptionWidgetState();
}

class _BarchatComsumptionWidgetState extends State<BarchatComsumptionWidget> {
  late BarchatComsumptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarchatComsumptionModel());

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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '5mha3aqa' /* Energy Consumption */,
                    ),
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: FlutterFlowBarChart(
                          barData: [
                            FFBarChartData(
                              yData: FFAppState().chart,
                              color: FlutterFlowTheme.of(context).primary,
                            )
                          ],
                          xLabels: FFAppState()
                              .chart
                              .map((e) => e.toString())
                              .toList(),
                          barWidth: 30.0,
                          barBorderRadius: BorderRadius.circular(8.0),
                          groupSpace: 5.0,
                          alignment: BarChartAlignment.spaceBetween,
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            tooltipBackgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            borderWidth: 1.0,
                          ),
                          axisBounds: AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            reservedSize: 28.0,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelTextStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                            labelInterval: 20.0,
                            reservedSize: 50.0,
                          ),
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
    );
  }
}
