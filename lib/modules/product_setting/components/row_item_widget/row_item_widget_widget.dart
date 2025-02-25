import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'row_item_widget_model.dart';
export 'row_item_widget_model.dart';

class RowItemWidgetWidget extends StatefulWidget {
  const RowItemWidgetWidget({
    super.key,
    required this.items,
  });

  final SpecialDayModelStruct? items;

  @override
  State<RowItemWidgetWidget> createState() => _RowItemWidgetWidgetState();
}

class _RowItemWidgetWidgetState extends State<RowItemWidgetWidget> {
  late RowItemWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowItemWidgetModel());

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
            valueOrDefault<String>(
              widget.items?.name,
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            valueOrDefault<String>(
              widget.items?.description,
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            valueOrDefault<String>(
              widget.items?.active.toString(),
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            valueOrDefault<String>(
              widget.items?.id.toString(),
              '-',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ].divide(SizedBox(width: 12.0)),
    );
  }
}
