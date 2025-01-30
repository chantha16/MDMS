import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/seasons/components/menuoption/menuoption_widget.dart';
import '/modules/seasons/components/search_not_found/search_not_found_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_season_model.dart';
export 'c_season_model.dart';

class CSeasonWidget extends StatefulWidget {
  const CSeasonWidget({
    super.key,
    this.months,
    this.month,
    this.seasonId,
  });

  final MonthStruct? months;
  final Month? month;
  final int? seasonId;

  @override
  State<CSeasonWidget> createState() => _CSeasonWidgetState();
}

class _CSeasonWidgetState extends State<CSeasonWidget> {
  late CSeasonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CSeasonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().loading = false;
      safeSetState(() {});
      _model.seasonRes1 = await SeasonGroup.readAllSeasonsCall.call(
        search: '%${_model.textController1.text}%',
        limit: _model.limitValue,
        offset: _model.offset,
      );

      if ((_model.seasonRes1?.succeeded ?? true)) {
        _model.seasonModel = (getJsonField(
          (_model.seasonRes1?.jsonBody ?? ''),
          r'''$.Season''',
          true,
        )!
                .toList()
                .map<SeasonModelStruct?>(SeasonModelStruct.maybeFromMap)
                .toList() as Iterable<SeasonModelStruct?>)
            .withoutNulls
            .toList()
            .cast<SeasonModelStruct>();
        _model.seasonPagingItemTotal = getJsonField(
          (_model.seasonRes1?.jsonBody ?? ''),
          r'''$.Paging.Item.Total''',
        );
        safeSetState(() {});
      }
      FFAppState().loading = true;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.currentPageTextController ??=
        TextEditingController(text: _model.currentPage.toString());
    _model.currentPageFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 350.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController1',
                              Duration(milliseconds: 300),
                              () async {
                                FFAppState().loading = false;
                                safeSetState(() {});
                                _model.seasonRes =
                                    await SeasonGroup.readAllSeasonsCall.call(
                                  search: '%${_model.textController1.text}%',
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                );

                                if ((_model.seasonRes?.succeeded ?? true)) {
                                  _model.seasonModel = (getJsonField(
                                    (_model.seasonRes?.jsonBody ?? ''),
                                    r'''$.Season''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SeasonModelStruct?>(
                                                  SeasonModelStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<SeasonModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SeasonModelStruct>();
                                  _model.seasonPagingItemTotal = getJsonField(
                                    (_model.seasonRes?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
                                  safeSetState(() {});
                                }
                                FFAppState().loading = true;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'r27xnf4p' /* Search */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              suffixIcon: _model
                                      .textController1!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textController1?.clear();
                                        FFAppState().loading = false;
                                        safeSetState(() {});
                                        _model.seasonRes = await SeasonGroup
                                            .readAllSeasonsCall
                                            .call(
                                          search:
                                              '%${_model.textController1.text}%',
                                          limit: _model.limitValue,
                                          offset: _model.offset,
                                        );

                                        if ((_model.seasonRes?.succeeded ??
                                            true)) {
                                          _model.seasonModel = (getJsonField(
                                            (_model.seasonRes?.jsonBody ?? ''),
                                            r'''$.Season''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<SeasonModelStruct?>(
                                                          SeasonModelStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      SeasonModelStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<SeasonModelStruct>();
                                          _model.seasonPagingItemTotal =
                                              getJsonField(
                                            (_model.seasonRes?.jsonBody ?? ''),
                                            r'''$.Paging.Item.Total''',
                                          );
                                          safeSetState(() {});
                                        }
                                        FFAppState().loading = true;
                                        safeSetState(() {});

                                        safeSetState(() {});
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    wrapWithModel(
                      model: _model.primaryButtonWithIconModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: PrimaryButtonWithIconWidget(
                        tbName: 'Add',
                        btIcon: Icon(
                          Icons.add_box,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        colorbottom: FlutterFlowTheme.of(context).primary,
                        textcolor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        btAction: () async {
                          context.pushNamed(
                            'pSeasonDetail',
                            queryParameters: {
                              'type': serializeParam(
                                Flag.Add,
                                ParamType.Enum,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.primaryButtonWithIconModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: PrimaryButtonWithIconWidget(
                        tbName: 'Export',
                        btIcon: Icon(
                          Icons.ios_share,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        colorbottom:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        textcolor: FlutterFlowTheme.of(context).primary,
                        btAction: () async {},
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 46.0,
                    height: 46.0,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,
                        buttonSize: 46.0,
                        hoverColor: FlutterFlowTheme.of(context).alternate,
                        icon: FaIcon(
                          FontAwesomeIcons.slidersH,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'mcse1ubg' /* No */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'b1k9nlw6' /* Name */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '7tsswfcw' /* Month Range */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '358p7w3t' /* Description */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          if (FFAppState().loading) {
                            return Builder(
                              builder: (context) {
                                final model = _model.seasonModel.toList();
                                if (model.isEmpty) {
                                  return SearchNotFoundWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: model.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 6.0),
                                  itemBuilder: (context, modelIndex) {
                                    final modelItem = model[modelIndex];
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: functions.isOdd(modelIndex)
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 46.0,
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    hoverIconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      await showAlignedDialog(
                                                        barrierColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        isGlobal: false,
                                                        avoidOverflow: true,
                                                        targetAnchor:
                                                            AlignmentDirectional(
                                                                    1.0, 1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        followerAnchor:
                                                            AlignmentDirectional(
                                                                    0.0, -1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        builder:
                                                            (dialogContext) {
                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            child:
                                                                MenuoptionWidget(
                                                              seasonId:
                                                                  modelItem.id,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    (_model.offset +
                                                            modelIndex +
                                                            1)
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    modelItem.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Builder(
                                                    builder: (context) {
                                                      final month = functions
                                                          .splitStringByComma(
                                                              modelItem
                                                                  .monthRange)
                                                          .toList();

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            month.length,
                                                            (monthIndex) {
                                                          final monthItem =
                                                              month[monthIndex];
                                                          return Text(
                                                            monthItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        }).divide(SizedBox(
                                                            width: 5.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Text(
                                                    modelItem.description,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 3.0, 16.0, 3.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ydmt64cj' /* Rows per page */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      FlutterFlowDropDown<int>(
                        controller: _model.limitValueController ??=
                            FormFieldController<int>(
                          _model.limitValue ??= 25,
                        ),
                        options: List<int>.from([25, 50, 100]),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            '7ye2aku7' /* 25 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '0cz8vcsk' /* 50 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '9rvjq1zq' /* 100 */,
                          )
                        ],
                        onChanged: (val) async {
                          safeSetState(() => _model.limitValue = val);
                          FFAppState().loading = false;
                          safeSetState(() {});
                          _model.currentPage = 1;
                          _model.offset = functions.calculateOffset(
                              _model.currentPage, _model.limitValue!);
                          safeSetState(() {});
                          safeSetState(() {
                            _model.currentPageTextController?.text =
                                _model.currentPage.toString();
                          });
                          _model.seasonRes6 =
                              await SeasonGroup.readAllSeasonsCall.call(
                            search: '%${_model.textController1.text}%',
                            limit: _model.limitValue,
                            offset: _model.offset,
                          );

                          if ((_model.seasonRes6?.succeeded ?? true)) {
                            _model.seasonModel = (getJsonField(
                              (_model.seasonRes6?.jsonBody ?? ''),
                              r'''$.Season''',
                              true,
                            )!
                                    .toList()
                                    .map<SeasonModelStruct?>(
                                        SeasonModelStruct.maybeFromMap)
                                    .toList() as Iterable<SeasonModelStruct?>)
                                .withoutNulls
                                .toList()
                                .cast<SeasonModelStruct>();
                            _model.seasonPagingItemTotal = getJsonField(
                              (_model.seasonRes6?.jsonBody ?? ''),
                              r'''$.Paging.Item.Total''',
                            );
                            safeSetState(() {});
                          }
                          FFAppState().loading = true;
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                        width: 90.0,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'yw4hbrcb' /* 25 */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: 8.0,
                        borderWidth: 1.0,
                        buttonSize: 36.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        disabledIconColor: Color(0xFFC0C0C0),
                        icon: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: (_model.currentPage == 1)
                            ? null
                            : () async {
                                FFAppState().loading = false;
                                safeSetState(() {});
                                _model.currentPage = _model.currentPage + -1;
                                _model.offset = functions.calculateOffset(
                                    _model.currentPage, _model.limitValue!);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.currentPageTextController?.text =
                                      _model.currentPage.toString();
                                });
                                _model.seasonRes4 =
                                    await SeasonGroup.readAllSeasonsCall.call(
                                  search: '%${_model.textController1.text}%',
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                );

                                if ((_model.seasonRes4?.succeeded ?? true)) {
                                  _model.seasonModel = (getJsonField(
                                    (_model.seasonRes4?.jsonBody ?? ''),
                                    r'''$.Season''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SeasonModelStruct?>(
                                                  SeasonModelStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<SeasonModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SeasonModelStruct>();
                                  _model.seasonPagingItemTotal = getJsonField(
                                    (_model.seasonRes4?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
                                  safeSetState(() {});
                                  FFAppState().loading = true;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                      ),
                      Container(
                        width: 50.0,
                        child: TextFormField(
                          controller: _model.currentPageTextController,
                          focusNode: _model.currentPageFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.currentPageTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              FFAppState().loading = false;
                              safeSetState(() {});
                              safeSetState(() {
                                _model.currentPageTextController?.text =
                                    functions
                                        .validatePageNumber(
                                            _model
                                                .currentPageTextController.text,
                                            functions.calculateTotalPages(
                                                _model.seasonPagingItemTotal,
                                                _model.limitValue!))
                                        .toString();
                              });
                              _model.currentPage = int.parse(
                                  _model.currentPageTextController.text);
                              _model.offset = functions.calculateOffset(
                                  _model.currentPage, _model.limitValue!);
                              safeSetState(() {});
                              _model.seasonRes3 =
                                  await SeasonGroup.readAllSeasonsCall.call(
                                search: '%${_model.textController1.text}%',
                                limit: _model.limitValue,
                                offset: _model.offset,
                              );

                              if ((_model.seasonRes3?.succeeded ?? true)) {
                                _model.seasonModel = (getJsonField(
                                  (_model.seasonRes3?.jsonBody ?? ''),
                                  r'''$.Season''',
                                  true,
                                )!
                                            .toList()
                                            .map<SeasonModelStruct?>(
                                                SeasonModelStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<SeasonModelStruct?>)
                                    .withoutNulls
                                    .toList()
                                    .cast<SeasonModelStruct>();
                                _model.seasonPagingItemTotal = getJsonField(
                                  (_model.seasonRes3?.jsonBody ?? ''),
                                  r'''$.Paging.Item.Total''',
                                );
                                safeSetState(() {});
                                FFAppState().loading = true;
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
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
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.currentPageTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'qsg2ljn0' /* of */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        functions
                            .calculateTotalPages(_model.seasonPagingItemTotal,
                                _model.limitValue!)
                            .toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: 8.0,
                        borderWidth: 1.0,
                        buttonSize: 36.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        disabledIconColor: Color(0xFFC0C0C0),
                        icon: Icon(
                          Icons.chevron_right,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: (_model.currentPage ==
                                functions.calculateTotalPages(
                                    _model.seasonPagingItemTotal,
                                    _model.limitValue!))
                            ? null
                            : () async {
                                FFAppState().loading = false;
                                safeSetState(() {});
                                _model.currentPage = _model.currentPage + 1;
                                _model.offset = functions.calculateOffset(
                                    _model.currentPage, _model.limitValue!);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.currentPageTextController?.text =
                                      _model.currentPage.toString();
                                });
                                _model.seasonRes5 =
                                    await SeasonGroup.readAllSeasonsCall.call(
                                  search: '%${_model.textController1.text}%',
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                );

                                if ((_model.seasonRes5?.succeeded ?? true)) {
                                  _model.seasonModel = (getJsonField(
                                    (_model.seasonRes5?.jsonBody ?? ''),
                                    r'''$.Season''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SeasonModelStruct?>(
                                                  SeasonModelStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<SeasonModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SeasonModelStruct>();
                                  _model.seasonPagingItemTotal = getJsonField(
                                    (_model.seasonRes5?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
                                  safeSetState(() {});
                                  FFAppState().loading = true;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
