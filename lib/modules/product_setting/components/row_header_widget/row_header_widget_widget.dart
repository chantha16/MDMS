import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'row_header_widget_model.dart';
export 'row_header_widget_model.dart';

class RowHeaderWidgetWidget extends StatefulWidget {
  const RowHeaderWidgetWidget({super.key});

  @override
  State<RowHeaderWidgetWidget> createState() => _RowHeaderWidgetWidgetState();
}

class _RowHeaderWidgetWidgetState extends State<RowHeaderWidgetWidget> {
  late RowHeaderWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowHeaderWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            FFLocalizations.of(context).getText(
              '4f87vdih' /* Name */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            FFLocalizations.of(context).getText(
              'dd975duo' /* Descriptions */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            FFLocalizations.of(context).getText(
              'ft1yi546' /* Active */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            FFLocalizations.of(context).getText(
              'y63izy48' /* Id */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ].divide(SizedBox(width: 12.0)),
    );
  }
}
