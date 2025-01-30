import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'row_items_model.dart';
export 'row_items_model.dart';

class RowItemsWidget extends StatefulWidget {
  const RowItemsWidget({
    super.key,
    this.numberItems,
    required this.rowValue,
    bool? isCheck,
    required this.columnHeader,
  }) : this.isCheck = isCheck ?? false;

  final int? numberItems;
  final dynamic rowValue;
  final bool isCheck;
  final List<String>? columnHeader;

  @override
  State<RowItemsWidget> createState() => _RowItemsWidgetState();
}

class _RowItemsWidgetState extends State<RowItemsWidget> {
  late RowItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowItemsModel());

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
        MouseRegion(
          opaque: false,
          cursor: SystemMouseCursors.click ?? MouseCursor.defer,
          child: Container(
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                _model.mouseRegionHovered!
                    ? FlutterFlowTheme.of(context).primaryBackground
                    : FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).alternate,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= widget!.isCheck == true,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue = newValue!);
                      if (newValue!) {
                        safeSetState(() {});
                      } else {
                        safeSetState(() {});
                      }
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                Container(
                  width: 20.0,
                  decoration: BoxDecoration(),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.numberItems?.toString(),
                      '0',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.mouseRegionHovered!
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        child: custom_widgets.DynamicRowValue(
                          width: double.infinity,
                          height: 40.0,
                          row: widget!.rowValue!,
                          isAscending: true,
                          columnHeaders: widget!.columnHeader!,
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.mouseRegionHovered = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.mouseRegionHovered = false);
          }),
        ),
      ],
    );
  }
}
