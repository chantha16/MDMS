import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button_with_icon/secoundary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/timeofuse/components/action_t_o_u/action_t_o_u_widget.dart';
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
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'tou_detail_lists_model.dart';
export 'tou_detail_lists_model.dart';

class TouDetailListsWidget extends StatefulWidget {
  const TouDetailListsWidget({super.key});

  @override
  State<TouDetailListsWidget> createState() => _TouDetailListsWidgetState();
}

class _TouDetailListsWidgetState extends State<TouDetailListsWidget> {
  late TouDetailListsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouDetailListsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().loading = false;
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.touResponse = await TimeOfUseGroup.readAllTimeOfUseCall.call(
        search: '%${_model.textsearchTextController.text}%',
        includeTimeOfUseDetails: true,
        limit: _model.limitValue,
        offset: _model.offset,
      );

      if ((_model.touResponse?.succeeded ?? true)) {
        _model.timeOfUse = (getJsonField(
          (_model.touResponse?.jsonBody ?? ''),
          r'''$.TimeOfUse''',
          true,
        )!
                .toList()
                .map<TimeOfUseStruct?>(TimeOfUseStruct.maybeFromMap)
                .toList() as Iterable<TimeOfUseStruct?>)
            .withoutNulls
            .toList()
            .cast<TimeOfUseStruct>();
        _model.timeOfUsePagingTotalItem = getJsonField(
          (_model.touResponse?.jsonBody ?? ''),
          r'''$.Paging.Item.Total''',
        );
        safeSetState(() {});
        FFAppState().loading = true;
        safeSetState(() {});
      }
    });

    _model.textsearchTextController ??=
        TextEditingController(text: FFAppState().storeCode);
    _model.textsearchFocusNode ??= FocusNode();

    _model.currentPageTextController ??=
        TextEditingController(text: _model.currentPage?.toString());
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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
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
                      controller: _model.textsearchTextController,
                      focusNode: _model.textsearchFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textsearchTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          await Future.delayed(
                              const Duration(milliseconds: 600));
                          _model.apiRequestSearch =
                              await TimeOfUseGroup.readAllTimeOfUseCall.call(
                            search: '%${_model.textsearchTextController.text}%',
                          );

                          if ((_model.apiRequestSearch?.succeeded ?? true)) {
                            _model.timeOfUse = (getJsonField(
                              (_model.apiRequestSearch?.jsonBody ?? ''),
                              r'''$.TimeOfUse''',
                              true,
                            )!
                                    .toList()
                                    .map<TimeOfUseStruct?>(
                                        TimeOfUseStruct.maybeFromMap)
                                    .toList() as Iterable<TimeOfUseStruct?>)
                                .withoutNulls
                                .toList()
                                .cast<TimeOfUseStruct>();
                            safeSetState(() {});
                            FFAppState().storeCode = '';
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'u31p9751' /* Search */,
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
                                .textsearchTextController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textsearchTextController?.clear();
                                  await Future.delayed(
                                      const Duration(milliseconds: 600));
                                  _model.apiRequestSearch = await TimeOfUseGroup
                                      .readAllTimeOfUseCall
                                      .call(
                                    search:
                                        '%${_model.textsearchTextController.text}%',
                                  );

                                  if ((_model.apiRequestSearch?.succeeded ??
                                      true)) {
                                    _model.timeOfUse = (getJsonField(
                                      (_model.apiRequestSearch?.jsonBody ?? ''),
                                      r'''$.TimeOfUse''',
                                      true,
                                    )!
                                                .toList()
                                                .map<TimeOfUseStruct?>(
                                                    TimeOfUseStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<TimeOfUseStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<TimeOfUseStruct>();
                                    safeSetState(() {});
                                    FFAppState().storeCode = '';
                                    safeSetState(() {});
                                  }

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
                      validator: _model.textsearchTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.primaryButtonWithIconModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PrimaryButtonWithIconWidget(
                      tbName: 'Add',
                      btIcon: Icon(
                        Icons.add_box,
                      ),
                      btAction: () async {
                        context.pushNamed(
                          TouDetailsWidget.routeName,
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
                    model: _model.secoundaryButtonWithIconModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SecoundaryButtonWithIconWidget(
                      btName: 'Export',
                      btIcon: Icon(
                        Icons.ios_share,
                      ),
                      btAction: () async {},
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ],
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                      FlutterFlowIconButton(
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
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'fw805qpy' /* No */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'euhy7mtn' /* Code */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ulyvnwhz' /* Name */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'se0itetu' /* Description */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
                Flexible(
                  child: Builder(
                    builder: (context) {
                      if (FFAppState().loading) {
                        return Builder(
                          builder: (context) {
                            final listTOU = _model.timeOfUse.toList();
                            if (listTOU.isEmpty) {
                              return Center(
                                child: NoDataFoundedWidget(),
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listTOU.length,
                              itemBuilder: (context, listTOUIndex) {
                                final listTOUItem = listTOU[listTOUIndex];
                                return Container(
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: functions.isOdd(listTOUIndex)
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Builder(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 100.0,
                                                buttonSize: 40.0,
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
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
                                                        child: ActionTOUWidget(
                                                          actionEdit: () async {
                                                            Navigator.pop(
                                                                context);

                                                            context.pushNamed(
                                                              TouDetailsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'type':
                                                                    serializeParam(
                                                                  Flag.Update,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                                'id':
                                                                    serializeParam(
                                                                  listTOUItem
                                                                      .id,
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
                                                              TouDetailsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'type':
                                                                    serializeParam(
                                                                  Flag.Delete,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                                'id':
                                                                    serializeParam(
                                                                  listTOUItem
                                                                      .id,
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
                                                              TouDetailsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'type':
                                                                    serializeParam(
                                                                  Flag.View,
                                                                  ParamType
                                                                      .Enum,
                                                                ),
                                                                'id':
                                                                    serializeParam(
                                                                  listTOUItem
                                                                      .id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                (_model.offset +
                                                        listTOUIndex +
                                                        1)
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                listTOUItem.code,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                listTOUItem.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                listTOUItem.description,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      if (FFAppState().storeCode ==
                                          listTOUItem.code)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.99, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 6.0, 0.0),
                                            child: Container(
                                              width: 12.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF50EAA2),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
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
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 500.0,
                            height: 600.0,
                            child: custom_widgets.LoadingIndicatorWidget(
                              width: 500.0,
                              height: 600.0,
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
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 3.0, 16.0, 3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '2ajbst1z' /* Rows per page */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                                  'kqp62tzp' /* 25 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '0zrohftp' /* 50 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'hk10918p' /* 100 */,
                                )
                              ],
                              onChanged: (val) async {
                                safeSetState(() => _model.limitValue = val);
                                FFAppState().isLoading = false;
                                safeSetState(() {});
                                _model.currentPage = 1;
                                _model.offset = functions.calculateOffset(
                                    _model.currentPage!, _model.limitValue!);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.currentPageTextController?.text =
                                      _model.currentPage!.toString();
                                });
                                _model.pagination = await TimeOfUseGroup
                                    .readAllTimeOfUseCall
                                    .call(
                                  search:
                                      '%${_model.textsearchTextController.text}%',
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                  includeTimeOfUseDetails: true,
                                );

                                if ((_model.pagination?.succeeded ?? true)) {
                                  _model.timeOfUse = (getJsonField(
                                    (_model.touResponse?.jsonBody ?? ''),
                                    r'''$.TimeOfUse''',
                                    true,
                                  )!
                                              .toList()
                                              .map<TimeOfUseStruct?>(
                                                  TimeOfUseStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<TimeOfUseStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<TimeOfUseStruct>();
                                  _model.timeOfUsePagingTotalItem =
                                      getJsonField(
                                    (_model.pagination?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
                                  safeSetState(() {});
                                  FFAppState().isLoading = true;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              width: 90.0,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'x5wc552b' /* 25 */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 36.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: (_model.currentPage == 1)
                                  ? null
                                  : () async {
                                      FFAppState().isLoading = false;
                                      safeSetState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 600));
                                      _model.currentPage =
                                          _model.currentPage! + -1;
                                      _model.offset = functions.calculateOffset(
                                          _model.currentPage!,
                                          _model.limitValue!);
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.currentPageTextController?.text =
                                            _model.currentPage!.toString();
                                      });
                                      _model.decresePaging =
                                          await TimeOfUseGroup
                                              .readAllTimeOfUseCall
                                              .call(
                                        limit: _model.limitValue,
                                        offset: _model.offset,
                                        search:
                                            '%${_model.textsearchTextController.text}%',
                                        includeTimeOfUseDetails: true,
                                      );

                                      if ((_model.decresePaging?.succeeded ??
                                          true)) {
                                        _model.timeOfUse = (getJsonField(
                                          (_model.decresePaging?.jsonBody ??
                                              ''),
                                          r'''$.TimeOfUse''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<TimeOfUseStruct?>(
                                                        TimeOfUseStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<TimeOfUseStruct?>)
                                            .withoutNulls
                                            .toList()
                                            .cast<TimeOfUseStruct>();
                                        _model.timeOfUsePagingTotalItem =
                                            getJsonField(
                                          (_model.decresePaging?.jsonBody ??
                                              ''),
                                          r'''$.Paging.Item.Total''',
                                        );
                                        _model.updatePage(() {});
                                        FFAppState().isLoading = true;
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
                                    FFAppState().isLoading = false;
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.currentPageTextController?.text =
                                          functions
                                              .validatePageNumber(
                                                  _model
                                                      .currentPageTextController
                                                      .text,
                                                  functions.calculateTotalPages(
                                                      _model
                                                          .timeOfUsePagingTotalItem,
                                                      _model.limitValue!))
                                              .toString();
                                    });
                                    _model.offset = FFAppState().offset;
                                    _model.currentPage = int.tryParse(
                                        _model.currentPageTextController.text);
                                    safeSetState(() {});
                                    _model.apiResultPageValidate =
                                        await SpecialDayGroup
                                            .readAllSpecialDaysCall
                                            .call(
                                      limit: _model.limitValue,
                                      offset: FFAppState().offset,
                                      search:
                                          '%${_model.textsearchTextController.text}%',
                                      includeSpecialDayDetail: true,
                                    );

                                    if ((_model
                                            .apiResultPageValidate?.succeeded ??
                                        true)) {
                                      _model.timeOfUse = _model.timeOfUse
                                          .toList()
                                          .cast<TimeOfUseStruct>();
                                      _model.timeOfUsePagingTotalItem =
                                          _model.timeOfUsePagingTotalItem;
                                      safeSetState(() {});
                                      FFAppState().isLoading = true;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: FFLocalizations.of(context).getText(
                                    '5b1z492n' /* 1 */,
                                  ),
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                textAlign: TextAlign.center,
                                minLines: 1,
                                keyboardType: TextInputType.number,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .currentPageTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[a-zA-Z]'))
                                ],
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '7n7augk6' /* of */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              functions
                                  .calculateTotalPages(
                                      _model.timeOfUsePagingTotalItem,
                                      _model.limitValue!)
                                  .toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 36.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.chevron_right,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: (_model.currentPage ==
                                      functions.calulationTotalPages(
                                          _model.timeOfUsePagingTotalItem,
                                          _model.limitValue!))
                                  ? null
                                  : () async {
                                      FFAppState().isLoading = false;
                                      safeSetState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 600));
                                      _model.currentPage =
                                          _model.currentPage! + 1;
                                      _model.offset = functions.calculateOffset(
                                          _model.currentPage!,
                                          _model.limitValue!);
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.currentPageTextController?.text =
                                            _model.currentPage!.toString();
                                      });
                                      _model.incresePaging =
                                          await TimeOfUseGroup
                                              .readAllTimeOfUseCall
                                              .call(
                                        limit: _model.limitValue,
                                        offset: _model.offset,
                                        search:
                                            '%${_model.textsearchTextController.text}%',
                                        includeTimeOfUseDetails: true,
                                      );

                                      if ((_model.incresePaging?.succeeded ??
                                          true)) {
                                        _model.timeOfUse = (getJsonField(
                                          (_model.incresePaging?.jsonBody ??
                                              ''),
                                          r'''$.TimeOfUse''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<TimeOfUseStruct?>(
                                                        TimeOfUseStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<TimeOfUseStruct?>)
                                            .withoutNulls
                                            .toList()
                                            .cast<TimeOfUseStruct>();
                                        _model.timeOfUsePagingTotalItem =
                                            getJsonField(
                                          (_model.incresePaging?.jsonBody ??
                                              ''),
                                          r'''$.Paging.Item.Total''',
                                        );
                                        safeSetState(() {});
                                        FFAppState().isLoading = true;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                            ),
                          ].divide(SizedBox(width: 7.0)),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
