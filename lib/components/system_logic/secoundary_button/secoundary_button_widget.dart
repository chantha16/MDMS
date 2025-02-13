import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'secoundary_button_model.dart';
export 'secoundary_button_model.dart';

class SecoundaryButtonWidget extends StatefulWidget {
  const SecoundaryButtonWidget({
    super.key,
    required this.btName,
    this.btAction,
  });

  final String? btName;
  final Future Function()? btAction;

  @override
  State<SecoundaryButtonWidget> createState() => _SecoundaryButtonWidgetState();
}

class _SecoundaryButtonWidgetState extends State<SecoundaryButtonWidget> {
  late SecoundaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecoundaryButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.btAction?.call();
      },
      text: widget.btName!,
      options: FFButtonOptions(
        width: 120.0,
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconAlignment: IconAlignment.start,
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter Tight',
              color: FlutterFlowTheme.of(context).primary,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
