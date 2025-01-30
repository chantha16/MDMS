import '/components/data_table/row_items/row_items_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'data_table_model.dart';
export 'data_table_model.dart';

/// created by ff.lyhoung.
class DataTableWidget extends StatefulWidget {
  const DataTableWidget({
    super.key,
    bool? hidenCheckBox,
    required this.columnNames,
    required this.rowItems,
    required this.numberItems,
    this.totalPage,
    this.currentPage,
    this.onNextPage,
    this.onPreviousPage,
    this.onSelectedItems,
    this.onRowTap,
    this.onSort,
  }) : hidenCheckBox = hidenCheckBox ?? false;

  final bool hidenCheckBox;
  final List<String>? columnNames;
  final List<dynamic>? rowItems;
  final List<dynamic>? numberItems;
  final int? totalPage;
  final int? currentPage;
  final Future Function()? onNextPage;
  final Future Function()? onPreviousPage;
  final Future Function()? onSelectedItems;
  final Future Function()? onRowTap;
  final Future Function()? onSort;

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  late DataTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataTableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: Checkbox(
                        value: _model.checkboxValue ??= false,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.checkboxValue = newValue!);
                        },
                        side: BorderSide(
                          width: 2,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: FaIcon(
                        FontAwesomeIcons.slidersH,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    Container(
                      width: 20.0,
                      decoration: const BoxDecoration(),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'cu05nf6n' /* No */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 15.0, 0.0, 15.0),
                        child: Builder(
                          builder: (context) {
                            final columnNames = functions
                                .filterVisibleColumns(
                                    FFAppState().hidenColumn.toList(),
                                    widget.columnNames!.toList(),
                                    widget.columnNames!.toList())
                                .toList();

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(columnNames.length,
                                  (columnNamesIndex) {
                                final columnNamesItem =
                                    columnNames[columnNamesIndex];
                                return Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        columnNamesItem,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: Icon(
                                          Icons.import_export_sharp,
                                          color:
                                              FlutterFlowTheme.of(context).blue,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          if (FFAppState().isAscending) {
                                            FFAppState().isAscending = true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().isAscending = false;
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Builder(
                builder: (context) {
                  final rowItems = widget.rowItems!
                      .map((e) => e)
                      .toList()
                      .sortedList(
                          keyOf: (e) => () {
                                if (FFAppState().isAscending == true) {
                                  return 1;
                                } else if (FFAppState().isAscending == false) {
                                  return 2;
                                } else {
                                  return 1;
                                }
                              }()
                                  .toString(),
                          desc: false)
                      .toList();

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      5.0,
                      0,
                      0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: rowItems.length,
                    itemBuilder: (context, rowItemsIndex) {
                      final rowItemsItem = rowItems[rowItemsIndex];
                      return RowItemsWidget(
                        key: Key(
                            'Key8e8_${rowItemsIndex}_of_${rowItems.length}'),
                        numberItems: rowItemsIndex,
                        rowValue: rowItemsItem,
                        isCheck: _model.checkboxValue,
                        columnHeader: widget.columnNames!,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'wb9g2yho' /* Row per page:  */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      'nclvu6vc' /* 25 */,
                    ),
                    FFLocalizations.of(context).getText(
                      '52i37ctl' /* 50 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'bwc7kylj' /* 75 */,
                    ),
                    FFLocalizations.of(context).getText(
                      'cs2vrncu' /* 100 */,
                    )
                  ],
                  onChanged: (val) =>
                      safeSetState(() => _model.dropDownValue = val),
                  width: 75.0,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '7x32y8xt' /* 25 */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 0.0,
                  borderRadius: 12.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
              Container(
                width: 16.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  if ((widget.currentPage != null) &&
                      (widget.currentPage != 1) &&
                      (widget.currentPage != 0)) {
                    await widget.onPreviousPage?.call();
                  }
                },
              ),
              Container(
                width: 16.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              Text(
                '${widget.currentPage?.toString()} of ${widget.totalPage?.toString()}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Container(
                width: 16.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  if (widget.currentPage != widget.totalPage) {
                    await widget.onNextPage?.call();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
