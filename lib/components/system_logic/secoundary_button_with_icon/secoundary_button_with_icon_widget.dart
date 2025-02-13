import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'secoundary_button_with_icon_model.dart';
export 'secoundary_button_with_icon_model.dart';

class SecoundaryButtonWithIconWidget extends StatefulWidget {
  const SecoundaryButtonWithIconWidget({
    super.key,
    required this.btName,
    this.btIcon,
    this.btAction,
  });

  final String? btName;
  final Widget? btIcon;
  final Future Function()? btAction;

  @override
  State<SecoundaryButtonWithIconWidget> createState() =>
      _SecoundaryButtonWithIconWidgetState();
}

class _SecoundaryButtonWithIconWidgetState
    extends State<SecoundaryButtonWithIconWidget> {
  late SecoundaryButtonWithIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecoundaryButtonWithIconModel());

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
      icon: widget.btIcon,
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
