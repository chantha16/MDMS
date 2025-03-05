import '';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/time_bands/components/special_day_menu_items_indicator/special_day_menu_items_indicator_widget.dart';
import '/modules/time_bands/components/time_band_special_day_detail/time_band_special_day_detail_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'time_band_special_day_drop_down_model.dart';
export 'time_band_special_day_drop_down_model.dart';

class TimeBandSpecialDayDropDownWidget extends StatefulWidget {
  const TimeBandSpecialDayDropDownWidget({super.key});

  @override
  State<TimeBandSpecialDayDropDownWidget> createState() =>
      _TimeBandSpecialDayDropDownWidgetState();
}

class _TimeBandSpecialDayDropDownWidgetState
    extends State<TimeBandSpecialDayDropDownWidget> {
  late TimeBandSpecialDayDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandSpecialDayDropDownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.search(context);
      safeSetState(() {});
    });

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
        height: 600.0,
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
                        await _model.search(context);
                        safeSetState(() {});
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
                        '3ykte2gv' /* Search.... */,
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
            Flexible(
              child: Builder(
                builder: (context) {
                  if (_model.loading) {
                    return Builder(
                      builder: (context) {
                        final item = _model.specialDayModel.toList();

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(item.length, (itemIndex) {
                              final itemItem = item[itemIndex];
                              return Builder(
                                builder: (context) =>
                                    SpecialDayMenuItemsIndicatorWidget(
                                  key: Key(
                                      'Keyqkd_${itemIndex}_of_${item.length}'),
                                  text: itemItem.name,
                                  moreAction: () async {
                                    await showAlignedDialog(
                                      context: context,
                                      isGlobal: false,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: TimeBandSpecialDayDetailWidget(
                                            type: Flag.View,
                                            specialDayId: itemItem.id,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  addAction: () async {
                                    Navigator.pop(context);
                                    _model.removeAtIndexFromSpecialDayModel(
                                        itemIndex);
                                    safeSetState(() {});
                                    FFAppState().addToSpecialDayState(itemItem);
                                    safeSetState(() {});
                                  },
                                ),
                              );
                            })
                                .divide(SizedBox(height: 8.0))
                                .addToStart(SizedBox(height: 8.0))
                                .addToEnd(SizedBox(height: 8.0)),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        child: custom_widgets.LoadingIndicatorWidget(
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
