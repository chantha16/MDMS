import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/deviecs/components/c_selector_menu_items/c_selector_menu_items_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'c_add_integration_model.dart';
export 'c_add_integration_model.dart';

class CAddIntegrationWidget extends StatefulWidget {
  const CAddIntegrationWidget({
    super.key,
    this.initial,
    this.availbleItems,
    int? minItems,
    int? maxItems,
    this.showMinMaxSelected,
    this.itemIcon,
    String? textButton,
    required this.flag,
  })  : this.minItems = minItems ?? 1,
        this.maxItems = maxItems ?? 10000,
        this.textButton = textButton ?? 'add';

  final List<String>? initial;
  final List<String>? availbleItems;
  final int minItems;
  final int maxItems;
  final bool? showMinMaxSelected;
  final Widget? itemIcon;
  final String textButton;
  final Flag? flag;

  @override
  State<CAddIntegrationWidget> createState() => _CAddIntegrationWidgetState();
}

class _CAddIntegrationWidgetState extends State<CAddIntegrationWidget> {
  late CAddIntegrationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CAddIntegrationModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = false;
      safeSetState(() {});
      if ((widget.initial?.length == 0) ||
          !(widget.initial != null && (widget.initial)!.isNotEmpty)) {
        _model.addToItemsTemp('none');
        _model.updatePage(() {});
      } else {
        _model.itemsTemp = widget.initial!.toList().cast<String>();
        _model.items = widget.initial!.toList().cast<String>();
        _model.updatePage(() {});
      }

      FFAppState().isLoading = true;
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
    context.watch<FFAppState>();
    context.watch<epower_library_llyhdh_app_state.FFAppState>();

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: valueOrDefault<Color>(
                  _model.mouseRegionHovered
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).alternate,
                  FlutterFlowTheme.of(context).alternate,
                ),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        if (_model.itemsTemp.length > 0)
                          Builder(
                            builder: (context) {
                              final item = _model.itemsTemp.toList();

                              return Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children:
                                    List.generate(item.length, (itemIndex) {
                                  final itemItem = item[itemIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (itemItem != 'none')
                                        Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    if (valueOrDefault<bool>(
                                                      widget.itemIcon != null,
                                                      false,
                                                    ))
                                                      widget.itemIcon!,
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        itemItem,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if ((widget.flag ==
                                                            Flag.View) ||
                                                        (widget.flag ==
                                                            Flag.Delete)) {
                                                      return;
                                                    }

                                                    _model.removeFromItemsTemp(
                                                        itemItem);
                                                    _model.removeFromItems(
                                                        itemItem);
                                                    safeSetState(() {});
                                                    if (_model
                                                            .itemsTemp.length ==
                                                        0) {
                                                      _model.addToItemsTemp(
                                                          'none');
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.close_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (itemIndex ==
                                          (_model.itemsTemp.length - 1))
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (itemItem == 'none')
                                              Container(
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '4yicmh15' /* Add  items ... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                    ].divide(SizedBox(width: 8.0)),
                                  );
                                }),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ].addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
            ),
          ),
          if ((functions
                      .listStringExclude(widget.availbleItems!.toList(),
                          _model.itemsTemp.toList())
                      .length >
                  0) &&
              (_model.itemsTemp.length != widget.maxItems))
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: ((widget.flag == Flag.View) ||
                          (widget.flag == Flag.Delete))
                      ? null
                      : () async {
                          await showAlignedDialog(
                            barrierColor: Colors.transparent,
                            context: context,
                            isGlobal: false,
                            avoidOverflow: true,
                            targetAnchor: AlignmentDirectional(-1.0, 1.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(-1.0, -1.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: CSelectorMenuItemsWidget(
                                  itemsToSearchIn: functions.listStringExclude(
                                      widget.availbleItems!.toList(),
                                      _model.itemsTemp.toList()),
                                  itemIcon: Icon(
                                    Icons.link,
                                  ),
                                  actionCallBackValue: (selectedItem) async {
                                    if (_model.itemsTemp.length == 1) {
                                      _model.removeFromItemsTemp('none');
                                      safeSetState(() {});
                                    }
                                    _model.addToItemsTemp(selectedItem!);
                                    _model.addToItems(selectedItem);
                                    safeSetState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                  text: widget.textButton,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
        ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
