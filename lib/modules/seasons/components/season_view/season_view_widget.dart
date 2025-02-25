import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/seasons/components/season_action/season_action_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'season_view_model.dart';
export 'season_view_model.dart';

class SeasonViewWidget extends StatefulWidget {
  const SeasonViewWidget({super.key});

  @override
  State<SeasonViewWidget> createState() => _SeasonViewWidgetState();
}

class _SeasonViewWidgetState extends State<SeasonViewWidget> {
  late SeasonViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().loading = false;
      safeSetState(() {});
      _model.seasonRes1 = await SeasonGroup.readAllSeasonsCall.call(
        search: '%${_model.txtSearchTextController.text}%',
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

    _model.txtSearchTextController ??=
        TextEditingController(text: FFAppState().storeName);
    _model.txtSearchFocusNode ??= FocusNode();

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
    context.watch<epower_library_llyhdh_app_state.FFAppState>();

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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: 300.0,
                    child: TextFormField(
                      controller: _model.txtSearchTextController,
                      focusNode: _model.txtSearchFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.txtSearchTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          FFAppState().loading = false;
                          safeSetState(() {});
                          _model.seasonResCopy =
                              await SeasonGroup.readAllSeasonsCall.call(
                            search: '%${_model.txtSearchTextController.text}%',
                            limit: _model.limitValue,
                            offset: _model.offset,
                          );

                          if ((_model.seasonResCopy?.succeeded ?? true)) {
                            _model.seasonModel = (getJsonField(
                              (_model.seasonResCopy?.jsonBody ?? ''),
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
                              (_model.seasonResCopy?.jsonBody ?? ''),
                              r'''$.Paging.Item.Total''',
                            );
                            safeSetState(() {});
                          }
                          FFAppState().loading = true;
                          safeSetState(() {});
                          FFAppState().storeName = '';
                          safeSetState(() {});

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
                          'dm4auawe' /* Search */,
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
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
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
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        suffixIcon: _model
                                .txtSearchTextController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.txtSearchTextController?.clear();
                                  FFAppState().loading = false;
                                  safeSetState(() {});
                                  _model.seasonResCopy =
                                      await SeasonGroup.readAllSeasonsCall.call(
                                    search:
                                        '%${_model.txtSearchTextController.text}%',
                                    limit: _model.limitValue,
                                    offset: _model.offset,
                                  );

                                  if ((_model.seasonResCopy?.succeeded ??
                                      true)) {
                                    _model.seasonModel = (getJsonField(
                                      (_model.seasonResCopy?.jsonBody ?? ''),
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
                                      (_model.seasonResCopy?.jsonBody ?? ''),
                                      r'''$.Paging.Item.Total''',
                                    );
                                    safeSetState(() {});
                                  }
                                  FFAppState().loading = true;
                                  safeSetState(() {});
                                  FFAppState().storeName = '';
                                  safeSetState(() {});

                                  safeSetState(() {});
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.txtSearchTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
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
                      textcolor: FlutterFlowTheme.of(context).primaryBackground,
                      btAction: () async {
                        context.pushNamed(
                          SeasonDetailPageWidget.routeName,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              height: 45.0,
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
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 100.0,
                      buttonSize: 40.0,
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
                  Expanded(
                    flex: 1,
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'trat5o7u' /* No */,
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
                        '913x43w4' /* Name */,
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
                        'tc38mlb1' /* Month Range */,
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
                        'sizmk51m' /* Description */,
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
                                return NoDataFoundedWidget();
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: model.length,
                                itemBuilder: (context, modelIndex) {
                                  final modelItem = model[modelIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: functions.isOdd(modelIndex)
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          children: [
                                            Builder(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 100.0,
                                                buttonSize: 46.0,
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                hoverIconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                icon: Icon(
                                                  Icons.more_vert,
                                                  color: FlutterFlowTheme.of(
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
                                                    builder: (dialogContext) {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        child:
                                                            SeasonActionWidget(
                                                          actionEdit: () async {
                                                            Navigator.pop(
                                                                context);

                                                            context.pushNamed(
                                                              SeasonDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'type':
                                                                    serializeParam(
                                                                  Flag.Update,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                                'seasonId':
                                                                    serializeParam(
                                                                  modelItem.id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          actionDelete:
                                                              () async {
                                                            Navigator.pop(
                                                                context);

                                                            context.pushNamed(
                                                              SeasonDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'type':
                                                                    serializeParam(
                                                                  Flag.Delete,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                                'seasonId':
                                                                    serializeParam(
                                                                  modelItem.id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          actionView: () async {
                                                            Navigator.pop(
                                                                context);

                                                            context.pushNamed(
                                                              SeasonDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'type':
                                                                    serializeParam(
                                                                  Flag.View,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                                'seasonId':
                                                                    serializeParam(
                                                                  modelItem.id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            if (FFAppState().storeName ==
                                                modelItem.name)
                                              Container(
                                                width: 12.0,
                                                height: 12.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF50EAA2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            (_model.offset + modelIndex + 1)
                                                .toString(),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
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
                                            style: FlutterFlowTheme.of(context)
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
                                                      modelItem.monthRange)
                                                  .toList();

                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    month.length, (monthIndex) {
                                                  final monthItem =
                                                      month[monthIndex];
                                                  return Text(
                                                    monthItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  );
                                                }).divide(SizedBox(width: 5.0)),
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            modelItem.description,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
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
                          'lg4whlof' /* Rows per page */,
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
                            '53qyipyr' /* 25 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'jk78vzpb' /* 50 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6xjyowie' /* 100 */,
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
                            search: '%${_model.txtSearchTextController.text}%',
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
                          'yxxb6954' /* 25 */,
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
                                  search:
                                      '%${_model.txtSearchTextController.text}%',
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
                                search:
                                    '%${_model.txtSearchTextController.text}%',
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
                                color: Color(0x00000000),
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
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
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
                          'a6j80l8y' /* of */,
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
                                  search:
                                      '%${_model.txtSearchTextController.text}%',
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
