import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'c_status_model.dart';
export 'c_status_model.dart';

class CStatusWidget extends StatefulWidget {
  const CStatusWidget({
    super.key,
    this.nameStatus,
    this.textColor,
    this.bgStatus,
  });

  final String? nameStatus;
  final Color? textColor;
  final Color? bgStatus;

  @override
  State<CStatusWidget> createState() => _CStatusWidgetState();
}

class _CStatusWidgetState extends State<CStatusWidget> {
  late CStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CStatusModel());

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
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget.nameStatus!,
      options: FFButtonOptions(
        width: 131.0,
        height: 32.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconAlignment: IconAlignment.start,
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget.bgStatus,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter Tight',
              color: widget.textColor,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.normal,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(10.0),
      ),
      showLoadingIndicator: false,
    );
  }
}
