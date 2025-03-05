import '';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagination_panel_model.dart';
export 'pagination_panel_model.dart';

class PaginationPanelWidget extends StatefulWidget {
  const PaginationPanelWidget({
    super.key,
    required this.onSelected,
    this.onSearchPaging,
    this.onPreviousPage,
    this.onNextPage,
    required this.totalItem,
    String? rowPerPage,
    this.rowPerPageSize,
    this.rowPerPageColor,
    this.ddOptionLabel,
    this.ddOptionValue,
    int? ddInitialValue,
    this.ddHintText,
    this.ddFontSize,
    this.ddTextColor,
    this.ddFillColor,
    this.ddBorderRadius,
    this.ddIconProperties,
    double? previousButtonSize,
    this.previousFillColor,
    this.previousBorderColor,
    this.previousBorderWidth,
    this.previousIconSize,
    this.previousBorderRadius,
    this.nextButtonSize,
    this.nextFillColor,
    this.nextBorderColor,
    this.nextBorderWidth,
    this.nextBorderRadius,
    this.nextIconSize,
    this.currentPageFontSize,
    this.currentPageTextColor,
    this.ofText,
    this.ofFontSize,
    this.ofTextColor,
    this.totalPageFontSize,
    this.totalPageTextColor,
  })  : this.rowPerPage = rowPerPage ?? 'Row per page',
        this.ddInitialValue = ddInitialValue ?? 25,
        this.previousButtonSize = previousButtonSize ?? 40.0;

  final Future Function()? onSelected;
  final Future Function()? onSearchPaging;
  final Future Function()? onPreviousPage;
  final Future Function()? onNextPage;
  final int? totalItem;
  final String rowPerPage;
  final double? rowPerPageSize;
  final Color? rowPerPageColor;
  final List<String>? ddOptionLabel;
  final List<int>? ddOptionValue;
  final int ddInitialValue;
  final String? ddHintText;
  final double? ddFontSize;
  final Color? ddTextColor;
  final Color? ddFillColor;
  final double? ddBorderRadius;
  final Widget? ddIconProperties;
  final double previousButtonSize;
  final Color? previousFillColor;
  final Color? previousBorderColor;
  final double? previousBorderWidth;
  final double? previousIconSize;
  final double? previousBorderRadius;
  final double? nextButtonSize;
  final Color? nextFillColor;
  final Color? nextBorderColor;
  final double? nextBorderWidth;
  final double? nextBorderRadius;
  final double? nextIconSize;
  final double? currentPageFontSize;
  final Color? currentPageTextColor;
  final String? ofText;
  final double? ofFontSize;
  final Color? ofTextColor;
  final double? totalPageFontSize;
  final Color? totalPageTextColor;

  @override
  State<PaginationPanelWidget> createState() => _PaginationPanelWidgetState();
}

class _PaginationPanelWidgetState extends State<PaginationPanelWidget> {
  late PaginationPanelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginationPanelModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.totalPage =
          functions.roundUp((widget!.totalItem!) / (_model.dropDownValue!));
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController(text: '1');
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.rowPerPage,
                'Row per page',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: valueOrDefault<Color>(
                      widget!.rowPerPageColor,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    fontSize: valueOrDefault<double>(
                      widget!.rowPerPageSize,
                      14.0,
                    ),
                    letterSpacing: 0.0,
                  ),
            ),
            FlutterFlowDropDown<int>(
              controller: _model.dropDownValueController ??=
                  FormFieldController<int>(
                _model.dropDownValue ??= valueOrDefault<int>(
                  widget!.ddInitialValue,
                  25,
                ),
              ),
              options: List<int>.from(widget!.ddOptionValue!),
              optionLabels: widget!.ddOptionLabel!,
              onChanged: (val) async {
                safeSetState(() => _model.dropDownValue = val);
                await widget.onSelected?.call();
              },
              width: 100.0,
              height: 40.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: valueOrDefault<Color>(
                      widget!.ddTextColor,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    fontSize: valueOrDefault<double>(
                      widget!.ddFontSize,
                      14.0,
                    ),
                    letterSpacing: 0.0,
                  ),
              hintText: valueOrDefault<String>(
                widget!.ddHintText,
                '25',
              ),
              icon: widget!.ddIconProperties,
              fillColor: valueOrDefault<Color>(
                widget!.ddFillColor,
                FlutterFlowTheme.of(context).primaryBackground,
              ),
              elevation: 0.0,
              borderColor: Colors.transparent,
              borderWidth: 0.0,
              borderRadius: valueOrDefault<double>(
                widget!.ddBorderRadius,
                8.0,
              ),
              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              hidesUnderline: true,
              isOverButton: false,
              isSearchable: false,
              isMultiSelect: false,
            ),
          ].divide(SizedBox(width: 10.0)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowIconButton(
              borderColor: valueOrDefault<Color>(
                widget!.previousBorderColor,
                FlutterFlowTheme.of(context).alternate,
              ),
              borderRadius: valueOrDefault<double>(
                widget!.previousBorderRadius,
                8.0,
              ),
              borderWidth: widget!.previousBorderWidth,
              buttonSize: valueOrDefault<double>(
                widget!.previousButtonSize,
                40.0,
              ),
              fillColor: widget!.previousFillColor,
              icon: Icon(
                Icons.chevron_left,
                color: valueOrDefault<Color>(
                  (_model.currentPage == 1) ||
                          (_model.textController.text == null ||
                              _model.textController.text == '') ||
                          (_model.textController.text == '1')
                      ? FlutterFlowTheme.of(context).secondaryText
                      : FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).secondaryText,
                ),
                size: valueOrDefault<double>(
                  widget!.previousIconSize,
                  20.0,
                ),
              ),
              onPressed: ((_model.currentPage == 1) ||
                          (_model.textController.text == null ||
                              _model.textController.text == '') ||
                          (_model.textController.text == '1')
                      ? true
                      : false)
                  ? null
                  : () async {
                      _model.currentPage = _model.currentPage + -1;
                      safeSetState(() {});
                      safeSetState(() {
                        _model.textController?.text =
                            _model.currentPage.toString();
                      });
                      await widget.onPreviousPage?.call();
                    },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 30.0,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 2000),
                    () async {
                      _model.currentPage =
                          int.parse(_model.textController.text);
                      safeSetState(() {});
                      await widget.onSearchPaging?.call();
                      if (_model.currentPage > _model.totalPage) {
                        safeSetState(() {
                          _model.textController?.text = '1';
                          _model.textFieldFocusNode?.requestFocus();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _model.textController?.selection =
                                TextSelection.collapsed(
                              offset: _model.textController!.text.length,
                            );
                          });
                        });
                      } else {
                        return;
                      }
                    },
                  ),
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: valueOrDefault<Color>(
                          widget!.currentPageTextColor,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        fontSize: valueOrDefault<double>(
                          widget!.currentPageFontSize,
                          14.0,
                        ),
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: valueOrDefault<String>(
                        widget!.ofText,
                        '  /   ',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: valueOrDefault<Color>(
                              widget!.ofTextColor,
                              FlutterFlowTheme.of(context).secondaryText,
                            ),
                            fontSize: valueOrDefault<double>(
                              widget!.ofFontSize,
                              14.0,
                            ),
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    TextSpan(
                      text: functions
                          .roundUp(
                              (widget!.totalItem!) / (_model.dropDownValue!))
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: valueOrDefault<Color>(
                              widget!.totalPageTextColor,
                              FlutterFlowTheme.of(context).secondaryText,
                            ),
                            fontSize: valueOrDefault<double>(
                              widget!.totalPageFontSize,
                              14.0,
                            ),
                            letterSpacing: 0.0,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            FlutterFlowIconButton(
              borderColor: valueOrDefault<Color>(
                widget!.nextBorderColor,
                FlutterFlowTheme.of(context).alternate,
              ),
              borderRadius: valueOrDefault<double>(
                widget!.nextBorderRadius,
                8.0,
              ),
              borderWidth: widget!.nextBorderWidth,
              buttonSize: valueOrDefault<double>(
                widget!.nextButtonSize,
                40.0,
              ),
              fillColor: widget!.nextFillColor,
              icon: Icon(
                Icons.navigate_next_rounded,
                color: valueOrDefault<Color>(
                  (functions.roundUp((widget!.totalItem!) /
                                  (_model.dropDownValue!)) ==
                              1) ||
                          (_model.currentPage ==
                              functions.roundUp((widget!.totalItem!) /
                                  (_model.dropDownValue!)))
                      ? FlutterFlowTheme.of(context).secondaryText
                      : FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).secondaryText,
                ),
                size: valueOrDefault<double>(
                  widget!.nextIconSize,
                  20.0,
                ),
              ),
              onPressed: ((functions.roundUp(
                              (widget!.totalItem!) / (_model.dropDownValue!)) ==
                          1) ||
                      (_model.currentPage ==
                          functions.roundUp(
                              (widget!.totalItem!) / (_model.dropDownValue!))))
                  ? null
                  : () async {
                      _model.currentPage = _model.currentPage + 1;
                      safeSetState(() {});
                      safeSetState(() {
                        _model.textController?.text =
                            _model.currentPage.toString();
                      });
                      await widget.onNextPage?.call();
                    },
            ),
          ],
        ),
      ],
    );
  }
}
