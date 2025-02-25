import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'special_day_menu_items_indicator_model.dart';
export 'special_day_menu_items_indicator_model.dart';

class SpecialDayMenuItemsIndicatorWidget extends StatefulWidget {
  const SpecialDayMenuItemsIndicatorWidget({
    super.key,
    required this.text,
    required this.moreAction,
    this.addAction,
  });

  final String? text;
  final Future Function()? moreAction;
  final Future Function()? addAction;

  @override
  State<SpecialDayMenuItemsIndicatorWidget> createState() =>
      _SpecialDayMenuItemsIndicatorWidgetState();
}

class _SpecialDayMenuItemsIndicatorWidgetState
    extends State<SpecialDayMenuItemsIndicatorWidget> {
  late SpecialDayMenuItemsIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialDayMenuItemsIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.addAction?.call();
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
            child: MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.moreAction?.call();
                        },
                        child: Icon(
                          Icons.info,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.text,
                        '-',
                      ).maybeHandleOverflow(
                        maxChars: 24,
                        replacement: '…',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered = false);
              }),
            ),
          ),
        ),
      ],
    );
  }
}
