import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'c_menu_items_indicator_model.dart';
export 'c_menu_items_indicator_model.dart';

class CMenuItemsIndicatorWidget extends StatefulWidget {
  const CMenuItemsIndicatorWidget({
    super.key,
    String? text,
    this.icon,
    Color? textColor,
    this.actionButton,
    this.showLoadingIndicator,
  })  : this.text = text ?? 'Menu item',
        this.textColor = textColor ?? const Color(0x23000000);

  final String text;
  final Widget? icon;
  final Color textColor;
  final Future Function()? actionButton;
  final bool? showLoadingIndicator;

  @override
  State<CMenuItemsIndicatorWidget> createState() =>
      _CMenuItemsIndicatorWidgetState();
}

class _CMenuItemsIndicatorWidgetState extends State<CMenuItemsIndicatorWidget> {
  late CMenuItemsIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CMenuItemsIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (widget.showLoadingIndicator!) {
            _model.loading = true;
            safeSetState(() {});
            await widget.actionButton?.call();
            _model.loading = false;
            safeSetState(() {});
          } else {
            await widget.actionButton?.call();
          }
        },
        child: Container(
          height: 34.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              _model.mouseRegionHovered
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional(-1.0, 0.0),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (valueOrDefault<bool>(
                      (widget.icon != null) && !_model.loading,
                      false,
                    ))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Icon(
                          Icons.link,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 16.0,
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        widget.text,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: widget.textColor,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
