import '/backend/schema/structs/index.dart';
import '/components/data_table/hiden_columns/hiden_columns_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'table_model.dart';
export 'table_model.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({
    super.key,
    this.columns,
    this.rows,
    this.onItemsSelected,
    this.onNextPage,
    this.onPreviousPage,
    int? currentPage,
    int? totalPage,
    bool? isCheckbox,
    bool? isMoreOption,
    bool? isNumeric,
    this.onHiddenColumnChanged,
    this.onRowCheckedItem,
  })  : currentPage = currentPage ?? 0,
        totalPage = totalPage ?? 0,
        isCheckbox = isCheckbox ?? true,
        isMoreOption = isMoreOption ?? true,
        isNumeric = isNumeric ?? true;

  final List<ColumnModelStruct>? columns;
  final List<RowModelStruct>? rows;
  final Future Function()? onItemsSelected;
  final Future Function()? onNextPage;
  final Future Function()? onPreviousPage;
  final int currentPage;
  final int totalPage;
  final bool isCheckbox;
  final bool isMoreOption;
  final bool isNumeric;
  final Future Function(List<ColumnModelStruct> columns)? onHiddenColumnChanged;
  final Future Function(int index, bool status)? onRowCheckedItem;

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  late TableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.printLog(
        'Table param column length: ${widget.columns?.length.toString()}',
      );
      await actions.printLog(
        'Table param row length: ${widget.rows?.length.toString()}',
      );
      _model.columns = widget.columns!.toList().cast<ColumnModelStruct>();
      _model.rows = widget.rows!.toList().cast<RowModelStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      if (widget.isCheckbox) {
                        return Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              if (functions
                                  .checkSelectAllRows(widget.rows!.toList())) {
                                return FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.check_box,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    _model.isSelectedAll = false;
                                    _model.rows = functions
                                        .updateRowsToSelectAll(
                                            widget.rows!.toList(), false)
                                        .toList()
                                        .cast<RowModelStruct>();
                                    safeSetState(() {});
                                  },
                                );
                              } else {
                                return FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.check_box_outline_blank,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    _model.isSelectedAll = true;
                                    _model.rows = functions
                                        .updateRowsToSelectAll(
                                            widget.rows!.toList(), true)
                                        .toList()
                                        .cast<RowModelStruct>();
                                    safeSetState(() {});
                                  },
                                );
                              }
                            },
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                      }
                    },
                  ),
                  Builder(
                    builder: (context) {
                      if (widget.isMoreOption) {
                        return Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Builder(
                            builder: (context) => FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: FaIcon(
                                FontAwesomeIcons.slidersH,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                await showAlignedDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: false,
                                  targetAnchor: const AlignmentDirectional(-1.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      const AlignmentDirectional(-1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: HidenColumnsWidget(
                                        columns: widget.columns,
                                        onColumnVisibleChanged:
                                            (columns) async {
                                          _model.columns = columns
                                              .toList()
                                              .cast<ColumnModelStruct>();
                                          _model.rows = functions
                                              .onCellVisibility(
                                                  widget.rows!.toList(),
                                                  functions
                                                      .getHiddenColumnId(
                                                          columns.toList())
                                                      .toList())
                                              .toList()
                                              .cast<RowModelStruct>();
                                          safeSetState(() {});
                                        },
                                      ),
                                    );
                                  },
                                );

                                await widget.onHiddenColumnChanged?.call(
                                  _model.columns,
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                      }
                    },
                  ),
                  Builder(
                    builder: (context) {
                      if (widget.isNumeric) {
                        return Container(
                          width: 75.0,
                          height: 50.0,
                          decoration: const BoxDecoration(),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'um76ahy2' /* No. */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: const BoxDecoration(),
                        );
                      }
                    },
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final headerItms = widget.columns
                                ?.where((e) => e.isHidden == false)
                                .toList()
                                .toList() ??
                            [];

                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(headerItms.length,
                              (headerItmsIndex) {
                            final headerItmsItem = headerItms[headerItmsIndex];
                            return Expanded(
                              child: Container(
                                width: 500.0,
                                height: 50.0,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      headerItmsItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Builder(
                  builder: (context) {
                    final rowItems = widget.rows?.toList() ?? [];

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(rowItems.length, (rowItemsIndex) {
                        final rowItemsItem = rowItems[rowItemsIndex];
                        return Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: functions.isOdd(rowItemsIndex)
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.isCheckbox) {
                                    return Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          if (rowItemsItem.selected == true) {
                                            return FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.check_box,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                _model.rows = widget.rows!
                                                    .toList()
                                                    .cast<RowModelStruct>();
                                                _model.updateRowsAtIndex(
                                                  rowItemsIndex,
                                                  (e) => e..selected = false,
                                                );
                                                safeSetState(() {});
                                              },
                                            );
                                          } else {
                                            return FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.check_box_outline_blank,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                _model.rows = widget.rows!
                                                    .toList()
                                                    .cast<RowModelStruct>();
                                                _model.updateRowsAtIndex(
                                                  rowItemsIndex,
                                                  (e) => e..selected = true,
                                                );
                                                safeSetState(() {});
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Builder(
                                builder: (context) {
                                  if (widget.isMoreOption) {
                                    return Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: const BoxDecoration(),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Builder(
                                builder: (context) {
                                  if (widget.isNumeric) {
                                    return Container(
                                      width: 75.0,
                                      height: 50.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          functions
                                              .paginationNumIncrement(
                                                  25, 1, rowItemsIndex)
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: const BoxDecoration(),
                                    );
                                  }
                                },
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final cellItems = rowItemsItem.cell
                                        .where((e) => e.isHidden == false)
                                        .toList();

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(cellItems.length,
                                          (cellItemsIndex) {
                                        final cellItemsItem =
                                            cellItems[cellItemsIndex];
                                        return Expanded(
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  cellItemsItem.data,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '8mz6lqh6' /* Row per page:  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: [
                        FFLocalizations.of(context).getText(
                          '363sfl05' /* 25 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'utpdehr2' /* 50 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'vf80df98' /* 75 */,
                        ),
                        FFLocalizations.of(context).getText(
                          '9j94iwxq' /* 100 */,
                        )
                      ],
                      onChanged: (val) =>
                          safeSetState(() => _model.dropDownValue = val),
                      width: 75.0,
                      height: 40.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        '7zsvjbvc' /* 25 */,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 0.0,
                      borderRadius: 12.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                      if (((widget.rows != null &&
                                  (widget.rows)!.isNotEmpty) !=
                              null) &&
                          (widget.rows?.length != 1) &&
                          (widget.rows?.length != 0)) {
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
                    '${widget.currentPage.toString()} of ${widget.totalPage.toString()}',
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
            ),
          ],
        ),
      ),
    );
  }
}
