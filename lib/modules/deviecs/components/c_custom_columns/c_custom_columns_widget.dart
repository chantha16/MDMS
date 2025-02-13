import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'c_custom_columns_model.dart';
export 'c_custom_columns_model.dart';

class CCustomColumnsWidget extends StatefulWidget {
  const CCustomColumnsWidget({
    super.key,
    this.columnItems,
  });

  final List<HeaderModelStruct>? columnItems;

  @override
  State<CCustomColumnsWidget> createState() => _CCustomColumnsWidgetState();
}

class _CCustomColumnsWidgetState extends State<CCustomColumnsWidget> {
  late CCustomColumnsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CCustomColumnsModel());

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
      width: 266.0,
      constraints: BoxConstraints(
        maxHeight: 619.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 276.0,
                height: 544.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: DragTarget<String>(
                  builder: (context, _, __) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Builder(
                        builder: (context) {
                          final columnItems =
                              widget.columnItems?.toList() ?? [];

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: columnItems.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, columnItemsIndex) {
                              final columnItemsItem =
                                  columnItems[columnItemsIndex];
                              return Draggable<String>(
                                data: '',
                                feedback: Material(
                                  type: MaterialType.transparency,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.drag_indicator_outlined,
                                        color: Color(0xFF7C8791),
                                        size: 24.0,
                                      ),
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValueMap[
                                              columnItemsItem] ??= true,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                    .checkboxValueMap[
                                                columnItemsItem] = newValue!);
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Text(
                                        columnItemsItem.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.drag_indicator_outlined,
                                      color: Color(0xFF7C8791),
                                      size: 24.0,
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValueMap[
                                            columnItemsItem] ??= true,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxValueMap[
                                                  columnItemsItem] = newValue!);
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    Text(
                                      columnItemsItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: FFLocalizations.of(context).getText(
                    'eoit8wwx' /* Reset */,
                  ),
                  options: FFButtonOptions(
                    width: 120.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
