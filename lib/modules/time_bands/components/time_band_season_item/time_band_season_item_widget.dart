import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'time_band_season_item_model.dart';
export 'time_band_season_item_model.dart';

class TimeBandSeasonItemWidget extends StatefulWidget {
  const TimeBandSeasonItemWidget({
    super.key,
    String? text,
    required this.moreAction,
    required this.removeAction,
    this.type,
  }) : this.text = text ?? 'text';

  final String text;
  final Future Function()? moreAction;
  final Future Function()? removeAction;
  final Flag? type;

  @override
  State<TimeBandSeasonItemWidget> createState() =>
      _TimeBandSeasonItemWidgetState();
}

class _TimeBandSeasonItemWidgetState extends State<TimeBandSeasonItemWidget> {
  late TimeBandSeasonItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandSeasonItemModel());

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 30.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
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
                      onEnter: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered = true);
                      }),
                      onExit: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered = false);
                      }),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.text,
                          'text',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                if ((widget.type == Flag.Add) || (widget.type == Flag.Update))
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.removeAction?.call();
                    },
                    child: Container(
                      width: 30.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.close_sharp,
                        color: FlutterFlowTheme.of(context).error,
                        size: 18.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ].divide(SizedBox(width: 8.0)),
    );
  }
}
