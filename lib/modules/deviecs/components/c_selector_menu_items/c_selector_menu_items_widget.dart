import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_menu_items_indicator/c_menu_items_indicator_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'c_selector_menu_items_model.dart';
export 'c_selector_menu_items_model.dart';

class CSelectorMenuItemsWidget extends StatefulWidget {
  const CSelectorMenuItemsWidget({
    super.key,
    required this.actionCallBackValue,
    required this.itemsToSearchIn,
    required this.itemIcon,
  });

  final Future Function(String? selectedItem)? actionCallBackValue;
  final List<String>? itemsToSearchIn;
  final Widget? itemIcon;

  @override
  State<CSelectorMenuItemsWidget> createState() =>
      _CSelectorMenuItemsWidgetState();
}

class _CSelectorMenuItemsWidgetState extends State<CSelectorMenuItemsWidget> {
  late CSelectorMenuItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CSelectorMenuItemsModel());

    _model.searchTextTextController ??= TextEditingController();
    _model.searchTextFocusNode ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        width: 240.0,
        constraints: BoxConstraints(
          maxHeight: 300.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x0D000000),
              offset: Offset(
                0.0,
                4.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Container(
                  width: 200.0,
                  child: TextFormField(
                    controller: _model.searchTextTextController,
                    focusNode: _model.searchTextFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.searchTextTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        safeSetState(() {
                          _model.simpleSearchResults = TextSearch(widget
                                  .itemsToSearchIn!
                                  .map((str) =>
                                      TextSearchItem.fromTerms(str, [str]))
                                  .toList())
                              .search(_model.searchTextTextController.text)
                              .map((r) => r.object)
                              .toList();
                          ;
                        });
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'k8yqr9t3' /* Search.... */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.searchTextTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
            ),
            if (_model.searchTextTextController.text == '')
              Flexible(
                child: Builder(
                  builder: (context) {
                    final item = widget.itemsToSearchIn!.toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(item.length, (itemIndex) {
                          final itemItem = item[itemIndex];
                          return CMenuItemsIndicatorWidget(
                            key: Key('Keygdi_${itemIndex}_of_${item.length}'),
                            text: itemItem,
                            icon: widget.itemIcon,
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            showLoadingIndicator: false,
                            actionButton: () async {
                              Navigator.pop(context);
                              await widget.actionCallBackValue?.call(
                                itemItem,
                              );
                            },
                          );
                        })
                            .divide(SizedBox(height: 8.0))
                            .addToStart(SizedBox(height: 8.0))
                            .addToEnd(SizedBox(height: 8.0)),
                      ),
                    );
                  },
                ),
              ),
            if (_model.searchTextTextController.text == '')
              Flexible(
                child: Builder(
                  builder: (context) {
                    final item = _model.simpleSearchResults.toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(item.length, (itemIndex) {
                          final itemItem = item[itemIndex];
                          return CMenuItemsIndicatorWidget(
                            key: Key('Key39f_${itemIndex}_of_${item.length}'),
                            text: itemItem,
                            icon: widget.itemIcon,
                            showLoadingIndicator: false,
                            actionButton: () async {
                              Navigator.pop(context);
                              await widget.actionCallBackValue?.call(
                                itemItem,
                              );
                            },
                          );
                        })
                            .divide(SizedBox(height: 8.0))
                            .addToStart(SizedBox(height: 8.0))
                            .addToEnd(SizedBox(height: 8.0)),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
