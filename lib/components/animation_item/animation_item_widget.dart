import '/components/more_options/more_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'animation_item_model.dart';
export 'animation_item_model.dart';

class AnimationItemWidget extends StatefulWidget {
  const AnimationItemWidget({
    super.key,
    required this.rowItems,
    required this.rowNumber,
    required this.rowData,
  });

  final Widget Function()? rowItems;
  final int? rowNumber;
  final dynamic rowData;

  @override
  State<AnimationItemWidget> createState() => _AnimationItemWidgetState();
}

class _AnimationItemWidgetState extends State<AnimationItemWidget> {
  late AnimationItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimationItemModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          functions.isOdd(widget.rowNumber!)
              ? FlutterFlowTheme.of(context).primaryBackground
              : FlutterFlowTheme.of(context).secondaryBackground,
          FlutterFlowTheme.of(context).secondaryBackground,
        ),
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
                  Icons.keyboard_control_sharp,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  await showAlignedDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    isGlobal: false,
                    avoidOverflow: true,
                    targetAnchor: AlignmentDirectional(1.0, 1.0)
                        .resolve(Directionality.of(context)),
                    followerAnchor: AlignmentDirectional(-1.0, -1.0)
                        .resolve(Directionality.of(context)),
                    builder: (dialogContext) {
                      return Material(
                        color: Colors.transparent,
                        child: MoreOptionsWidget(
                          id: widget.rowNumber!,
                          isEdit: false,
                          onEditChanged: (id) async {},
                          onDeleteChanged: (id) async {},
                          onViewChanged: (id) async {},
                          onSwitchParentChanged: (id) async {},
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
                valueOrDefault<String>(
                  ((widget.rowNumber!) + 1).toString(),
                  '1',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Expanded(
              child: Builder(builder: (_) {
                return widget.rowItems!();
              }),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
