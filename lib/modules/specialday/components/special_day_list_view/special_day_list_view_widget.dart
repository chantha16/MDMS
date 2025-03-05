import '';
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
import '/modules/specialday/components/special_day_action/special_day_action_widget.dart';
import '/modules/specialday/components/special_day_side_bar/special_day_side_bar_widget.dart';
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
import 'special_day_list_view_model.dart';
export 'special_day_list_view_model.dart';

class SpecialDayListViewWidget extends StatefulWidget {
  const SpecialDayListViewWidget({
    super.key,
    this.swearch,
  });

  final String? swearch;

  @override
  State<SpecialDayListViewWidget> createState() =>
      _SpecialDayListViewWidgetState();
}

class _SpecialDayListViewWidgetState extends State<SpecialDayListViewWidget> {
  late SpecialDayListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialDayListViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().loading = false;
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      _model.apiResultlkf = await SpecialDayGroup.readAllSpecialDaysCall.call(
        includeSpecialDayDetail: false,
        limit: _model.limitValue,
        offset: _model.offset,
        search: '%${FFAppState().specialDayNameStore}%',
      );

      if ((_model.apiResultlkf?.succeeded ?? true)) {
        _model.specialDay = (getJsonField(
          (_model.apiResultlkf?.jsonBody ?? ''),
          r'''$.SpecialDay''',
          true,
        )!
                .toList()
                .map<SpecialDayModelStruct?>(SpecialDayModelStruct.maybeFromMap)
                .toList() as Iterable<SpecialDayModelStruct?>)
            .withoutNulls
            .toList()
            .cast<SpecialDayModelStruct>();
        _model.specialDayPagingTotalItem = getJsonField(
          (_model.apiResultlkf?.jsonBody ?? ''),
          r'''$.Paging.Item.Total''',
        );
        safeSetState(() {});
        FFAppState().loading = true;
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (_model.apiResultlkf?.exceptionMessage ?? ''),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    });

    _model.searchspecialDayStoreTextController ??=
        TextEditingController(text: FFAppState().specialDayNameStore);
    _model.searchspecialDayStoreFocusNode ??= FocusNode();

    _model.currentPageTextController ??= TextEditingController();
    _model.currentPageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.currentPageTextController?.text =
              FFLocalizations.of(context).getText(
            'wisbl6r7' /* 1 */,
          );
        }));
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
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  width: 300.0,
                  child: TextFormField(
                    controller: _model.searchspecialDayStoreTextController,
                    focusNode: _model.searchspecialDayStoreFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.searchspecialDayStoreTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        FFAppState().loading = false;
                        safeSetState(() {});
                        await Future.delayed(const Duration(milliseconds: 600));
                        _model.apiRequestSearch =
                            await SpecialDayGroup.readAllSpecialDaysCall.call(
                          search:
                              '%${_model.searchspecialDayStoreTextController.text}%',
                          includeSpecialDayDetail: true,
                          limit: _model.limitValue,
                          offset: _model.offset,
                        );

                        if ((_model.apiRequestSearch?.succeeded ?? true)) {
                          _model.specialDay = (getJsonField(
                            (_model.apiRequestSearch?.jsonBody ?? ''),
                            r'''$.SpecialDay''',
                            true,
                          )!
                                  .toList()
                                  .map<SpecialDayModelStruct?>(
                                      SpecialDayModelStruct.maybeFromMap)
                                  .toList() as Iterable<SpecialDayModelStruct?>)
                              .withoutNulls
                              .toList()
                              .cast<SpecialDayModelStruct>();
                          _model.specialDayPagingTotalItem = getJsonField(
                            (_model.apiRequestSearch?.jsonBody ?? ''),
                            r'''$.Paging.Item.Total''',
                          );
                          safeSetState(() {});
                          FFAppState().loading = true;
                          safeSetState(() {});
                          FFAppState().deleteSpecialDayNameStore();
                          FFAppState().specialDayNameStore = '';

                          safeSetState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                (_model.apiRequestSearch?.exceptionMessage ??
                                    ''),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

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
                        'l1gyxin7' /* Search */,
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
                      suffixIcon: _model.searchspecialDayStoreTextController!
                              .text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.searchspecialDayStoreTextController
                                    ?.clear();
                                FFAppState().loading = false;
                                safeSetState(() {});
                                await Future.delayed(
                                    const Duration(milliseconds: 600));
                                _model.apiRequestSearch = await SpecialDayGroup
                                    .readAllSpecialDaysCall
                                    .call(
                                  search:
                                      '%${_model.searchspecialDayStoreTextController.text}%',
                                  includeSpecialDayDetail: true,
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                );

                                if ((_model.apiRequestSearch?.succeeded ??
                                    true)) {
                                  _model.specialDay = (getJsonField(
                                    (_model.apiRequestSearch?.jsonBody ?? ''),
                                    r'''$.SpecialDay''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SpecialDayModelStruct?>(
                                                  SpecialDayModelStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<SpecialDayModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SpecialDayModelStruct>();
                                  _model.specialDayPagingTotalItem =
                                      getJsonField(
                                    (_model.apiRequestSearch?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
                                  safeSetState(() {});
                                  FFAppState().loading = true;
                                  safeSetState(() {});
                                  FFAppState().deleteSpecialDayNameStore();
                                  FFAppState().specialDayNameStore = '';

                                  safeSetState(() {});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        (_model.apiRequestSearch
                                                ?.exceptionMessage ??
                                            ''),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).primaryText,
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
                    validator: _model
                        .searchspecialDayStoreTextControllerValidator
                        .asValidator(context),
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
                          SpecialDayAddWidget.routeName,
                          queryParameters: {
                            'types': serializeParam(
                              Flag.Add,
                              ParamType.Enum,
                            ),
                            'detailss': serializeParam(
                              SpecialDayModelStruct(),
                              ParamType.DataStruct,
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
                      Container(
                        width: 40.0,
                        height: 46.0,
                        decoration: BoxDecoration(),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
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
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '337ckkqj' /* No */,
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
                            '0hv4r6p3' /* Name */,
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
                            '5inxppyl' /* Description */,
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
                            final specialDayAll = _model.specialDay.toList();
                            if (specialDayAll.isEmpty) {
                              return Center(
                                child: NoDataFoundedWidget(),
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: specialDayAll.length,
                              itemBuilder: (context, specialDayAllIndex) {
                                final specialDayAllItem =
                                    specialDayAll[specialDayAllIndex];
                                return Container(
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: functions.isOdd(specialDayAllIndex)
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    children: [
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              barrierColor: Colors.transparent,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              1.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: 550.0,
                                                    child:
                                                        SpecialDaySideBarWidget(
                                                      specialDayId:
                                                          specialDayAllItem.id,
                                                      detailsSpecial:
                                                          SpecialDayModelStruct(
                                                        specialDayDetails:
                                                            specialDayAllItem
                                                                .specialDayDetails,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Builder(
                                                builder: (context) =>
                                                    FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 100.0,
                                                  buttonSize: 40.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                          color: Colors
                                                              .transparent,
                                                          child:
                                                              SpecialDayActionWidget(
                                                            actionEdit:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);

                                                              context.pushNamed(
                                                                SpecialDayPageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'types':
                                                                      serializeParam(
                                                                    Flag.Update,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'id':
                                                                      serializeParam(
                                                                    specialDayAllItem
                                                                        .id,
                                                                    ParamType
                                                                        .int,
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
                                                                SpecialDayPageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'types':
                                                                      serializeParam(
                                                                    Flag.Delete,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'id':
                                                                      serializeParam(
                                                                    specialDayAllItem
                                                                        .id,
                                                                    ParamType
                                                                        .int,
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
                                                            actionView:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);

                                                              context.pushNamed(
                                                                SpecialDayPageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'types':
                                                                      serializeParam(
                                                                    Flag.View,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'id':
                                                                      serializeParam(
                                                                    specialDayAllItem
                                                                        .id,
                                                                    ParamType
                                                                        .int,
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
                                              Expanded(
                                                child: Text(
                                                  (_model.offset +
                                                          specialDayAllIndex +
                                                          1)
                                                      .toString(),
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
                                                flex: 3,
                                                child: Text(
                                                  specialDayAllItem.name,
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
                                                flex: 3,
                                                child: Text(
                                                  specialDayAllItem.description,
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
                                      ),
                                      if (FFAppState().specialDayNameStore ==
                                          specialDayAllItem.name)
                                        Container(
                                          width: 12.0,
                                          height: 12.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF50EAA2),
                                            borderRadius:
                                                BorderRadius.circular(100.0),
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
                          'e7dzqhuf' /* Rows per page */,
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
                            'ervw23mi' /* 25 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'prb98rh0' /* 50 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'xzimepbq' /* 100 */,
                          )
                        ],
                        onChanged: (val) async {
                          safeSetState(() => _model.limitValue = val);
                          _model.currentPage = 1;
                          _model.offset = functions.calculateOffset(
                              _model.currentPage!, _model.limitValue!);
                          safeSetState(() {});
                          safeSetState(() {
                            _model.currentPageTextController?.text =
                                _model.currentPage!.toString();
                          });
                          _model.pagination =
                              await SpecialDayGroup.readAllSpecialDaysCall.call(
                            search:
                                '%${_model.searchspecialDayStoreTextController.text}%',
                            limit: _model.limitValue,
                            offset: _model.offset,
                          );

                          if ((_model.pagination?.succeeded ?? true)) {
                            _model.specialDay = (getJsonField(
                              (_model.pagination?.jsonBody ?? ''),
                              r'''$.SpecialDay''',
                              true,
                            )!
                                        .toList()
                                        .map<SpecialDayModelStruct?>(
                                            SpecialDayModelStruct.maybeFromMap)
                                        .toList()
                                    as Iterable<SpecialDayModelStruct?>)
                                .withoutNulls
                                .toList()
                                .cast<SpecialDayModelStruct>();
                            _model.specialDayPagingTotalItem = getJsonField(
                              (_model.pagination?.jsonBody ?? ''),
                              r'''$.Paging.Item.Total''',
                            );
                            safeSetState(() {});
                          }

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
                          'i9rta7xw' /* 25 */,
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
                        icon: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: (_model.currentPage == 1)
                            ? null
                            : () async {
                                _model.currentPage = _model.currentPage! + -1;
                                _model.offset = functions.calculateOffset(
                                    _model.currentPage!, _model.limitValue!);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.currentPageTextController?.text =
                                      _model.currentPage!.toString();
                                });
                                _model.decresePaging = await SpecialDayGroup
                                    .readAllSpecialDaysCall
                                    .call(
                                  search:
                                      '%${_model.searchspecialDayStoreTextController.text}%',
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                );

                                if ((_model.decresePaging?.succeeded ?? true)) {
                                  _model.specialDay = (getJsonField(
                                    (_model.decresePaging?.jsonBody ?? ''),
                                    r'''$.SpecialDay''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SpecialDayModelStruct?>(
                                                  SpecialDayModelStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<SpecialDayModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SpecialDayModelStruct>();
                                  _model.specialDayPagingTotalItem =
                                      getJsonField(
                                    (_model.decresePaging?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
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
                            Duration(milliseconds: 400),
                            () async {
                              safeSetState(() {
                                _model.currentPageTextController?.text =
                                    functions
                                        .validatePageNumber(
                                            FFAppState().currentPage.toString(),
                                            functions.calculateTotalPages(
                                                _model
                                                    .specialDayPagingTotalItem,
                                                _model.limitValue!))
                                        .toString();
                              });
                              FFAppState().currentPage = FFAppState().offset;
                              safeSetState(() {});
                              _model.apiResultPageValidate =
                                  await SpecialDayGroup.readAllSpecialDaysCall
                                      .call(
                                search:
                                    '%${_model.searchspecialDayStoreTextController.text}%',
                                limit: _model.limitValue,
                                offset: FFAppState().offset,
                              );

                              if ((_model.apiResultPageValidate?.succeeded ??
                                  true)) {
                                _model.specialDay = _model.specialDay
                                    .toList()
                                    .cast<SpecialDayModelStruct>();
                                _model.specialDayPagingTotalItem =
                                    _model.specialDayPagingTotalItem;
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
                              'hcwyc40t' /* 1 */,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.center,
                          minLines: 1,
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.currentPageTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z]'))
                          ],
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'hdjrqzx2' /* of */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        functions
                            .calculateTotalPages(
                                _model.specialDayPagingTotalItem,
                                _model.limitValue!)
                            .toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: 8.0,
                        borderWidth: 1.0,
                        buttonSize: 36.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.chevron_right,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: (_model.currentPage ==
                                functions.calculateTotalPages(
                                    _model.specialDayPagingTotalItem,
                                    _model.limitValue!))
                            ? null
                            : () async {
                                _model.currentPage = _model.currentPage! + 1;
                                _model.offset = functions.calculateOffset(
                                    _model.currentPage!, _model.limitValue!);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.currentPageTextController?.text =
                                      _model.currentPage!.toString();
                                });
                                _model.incresePaging = await SpecialDayGroup
                                    .readAllSpecialDaysCall
                                    .call(
                                  search:
                                      '%${_model.searchspecialDayStoreTextController.text}%',
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                );

                                if ((_model.incresePaging?.succeeded ?? true)) {
                                  _model.specialDay = (getJsonField(
                                    (_model.incresePaging?.jsonBody ?? ''),
                                    r'''$.SpecialDay''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SpecialDayModelStruct?>(
                                                  SpecialDayModelStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<SpecialDayModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SpecialDayModelStruct>();
                                  _model.specialDayPagingTotalItem =
                                      getJsonField(
                                    (_model.incresePaging?.jsonBody ?? ''),
                                    r'''$.Paging.Item.Total''',
                                  );
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
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
