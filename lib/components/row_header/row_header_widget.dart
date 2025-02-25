import '/components/hiden_columns/hiden_columns_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'row_header_model.dart';
export 'row_header_model.dart';

class RowHeaderWidget extends StatefulWidget {
  const RowHeaderWidget({
    super.key,
    required this.rowHeader,
  });

  final Widget Function()? rowHeader;

  @override
  State<RowHeaderWidget> createState() => _RowHeaderWidgetState();
}

class _RowHeaderWidgetState extends State<RowHeaderWidget> {
  late RowHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryText,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) => FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.tune,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: HidenColumnsWidget(
                          onColumnVisibleChanged: (columns) async {},
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              width: 100.0,
              decoration: BoxDecoration(),
              child: Text(
                FFLocalizations.of(context).getText(
                  'zs84t4zm' /* No */,
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
              child: Builder(builder: (_) {
                return widget.rowHeader!();
              }),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
