import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'daterange_model.dart';
export 'daterange_model.dart';

class DaterangeWidget extends StatefulWidget {
  const DaterangeWidget({
    super.key,
    this.action,
  });

  final Future Function()? action;

  @override
  State<DaterangeWidget> createState() => _DaterangeWidgetState();
}

class _DaterangeWidgetState extends State<DaterangeWidget> {
  late DaterangeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DaterangeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.action?.call();
      },
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '84llqgv6' /* dd/MM/YYYY - dd/MM/YYYY */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
