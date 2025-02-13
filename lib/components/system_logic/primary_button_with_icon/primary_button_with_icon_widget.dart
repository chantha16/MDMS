import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'primary_button_with_icon_model.dart';
export 'primary_button_with_icon_model.dart';

class PrimaryButtonWithIconWidget extends StatefulWidget {
  const PrimaryButtonWithIconWidget({
    super.key,
    required this.tbName,
    this.btAction,
    required this.btIcon,
    this.colorbottom,
    this.textcolor,
  });

  final String? tbName;
  final Future Function()? btAction;
  final Widget? btIcon;
  final Color? colorbottom;
  final Color? textcolor;

  @override
  State<PrimaryButtonWithIconWidget> createState() =>
      _PrimaryButtonWithIconWidgetState();
}

class _PrimaryButtonWithIconWidgetState
    extends State<PrimaryButtonWithIconWidget> {
  late PrimaryButtonWithIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryButtonWithIconModel());

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
      text: widget.tbName!,
      icon: widget.btIcon,
      options: FFButtonOptions(
        width: 120.0,
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget.colorbottom,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter Tight',
              color: widget.textcolor,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
