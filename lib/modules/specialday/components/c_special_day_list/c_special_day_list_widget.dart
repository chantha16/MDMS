import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/body_header/body_header_widget.dart';
import '/components/system_logic/c_pagination/c_pagination_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/c_activity_log_special_day/c_activity_log_special_day_widget.dart';
import '/modules/specialday/components/c_special_day_action/c_special_day_action_widget.dart';
import '/modules/specialday/components/c_special_day_detail_list/c_special_day_detail_list_widget.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_special_day_list_model.dart';
export 'c_special_day_list_model.dart';

class CSpecialDayListWidget extends StatefulWidget {
  const CSpecialDayListWidget({
    super.key,
    this.swearch,
  });

  final String? swearch;

  @override
  State<CSpecialDayListWidget> createState() => _CSpecialDayListWidgetState();
}

class _CSpecialDayListWidgetState extends State<CSpecialDayListWidget> {
  late CSpecialDayListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CSpecialDayListModel());

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
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.bodyHeaderModel,
              updateCallback: () => safeSetState(() {}),
              child: BodyHeaderWidget(
                tbName1: 'Export',
                btIcon1: Icon(
                  Icons.ios_share_sharp,
                ),
                tbName2: 'Add',
                btIcon2: Icon(
                  Icons.add_box_sharp,
                ),
                filterAction: () async {},
                btAction1: () async {},
                btAction2: () async {
                  context.pushNamed(
                    'pSpecialDayAdd',
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
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                              hoverColor:
                                  FlutterFlowTheme.of(context).alternate,
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
                              '0hv4r6p3' /* Code */,
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
                  Expanded(
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<ApiCallResponse>(
                            future: FFAppState().search(
                              uniqueQueryKey: valueOrDefault<String>(
                                widget!.swearch,
                                'kh',
                              ),
                              overrideCache: FFAppState().isRefresh,
                              requestFn: () =>
                                  SpecialDayGroup.readAllSpecialDaysCall.call(
                                offset: FFAppState().offset,
                                search:
                                    _model.bodyHeaderModel.textController1.text,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: LinearProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                              }
                              final listViewReadAllSpecialDaysResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final specialDayAll = (getJsonField(
                                        listViewReadAllSpecialDaysResponse
                                            .jsonBody,
                                        r'''$.SpecialDay''',
                                        true,
                                      )
                                                  ?.toList()
                                                  .map<SpecialDayModelStruct?>(
                                                      SpecialDayModelStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  SpecialDayModelStruct?>)
                                          .withoutNulls
                                          ?.toList() ??
                                      [];

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: specialDayAll.length,
                                    itemBuilder: (context, specialDayAllIndex) {
                                      final specialDayAllItem =
                                          specialDayAll[specialDayAllIndex];
                                      return ClipRRect(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FFAppState().hoverIndex ==
                                                    valueOrDefault<int>(
                                                      specialDayAllIndex,
                                                      1,
                                                    )
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : Color(0x00000000),
                                          ),
                                          child: Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  barrierColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  1.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child:
                                                          CSpecialDayDetailListWidget(
                                                        specialDayDetails:
                                                            specialDayAllItem
                                                                .specialDayDetails,
                                                        specialDayId:
                                                            specialDayAllItem
                                                                .id,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showAlignedDialog(
                                                          barrierColor: Colors
                                                              .transparent,
                                                          context: context,
                                                          isGlobal: false,
                                                          avoidOverflow: true,
                                                          targetAnchor:
                                                              AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                          followerAnchor:
                                                              AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                          builder:
                                                              (dialogContext) {
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  CSpecialDayActionWidget(
                                                                actionEdit:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);

                                                                  context
                                                                      .pushNamed(
                                                                    'pSpecialDayView',
                                                                    queryParameters:
                                                                        {
                                                                      'types':
                                                                          serializeParam(
                                                                        Flag.Update,
                                                                        ParamType
                                                                            .Enum,
                                                                      ),
                                                                      'detailsSpecials':
                                                                          serializeParam(
                                                                        specialDayAllItem,
                                                                        ParamType
                                                                            .DataStruct,
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
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                actionDelete:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);

                                                                  context
                                                                      .pushNamed(
                                                                    'pSpecialDayAdd',
                                                                    queryParameters:
                                                                        {
                                                                      'types':
                                                                          serializeParam(
                                                                        Flag.Delete,
                                                                        ParamType
                                                                            .Enum,
                                                                      ),
                                                                      'detailss':
                                                                          serializeParam(
                                                                        specialDayAllItem,
                                                                        ParamType
                                                                            .DataStruct,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                actionView:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);

                                                                  context
                                                                      .pushNamed(
                                                                    'pSpecialDayView',
                                                                    queryParameters:
                                                                        {
                                                                      'types':
                                                                          serializeParam(
                                                                        Flag.View,
                                                                        ParamType
                                                                            .Enum,
                                                                      ),
                                                                      'detailsSpecials':
                                                                          serializeParam(
                                                                        specialDayAllItem,
                                                                        ParamType
                                                                            .DataStruct,
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
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                actionViewChangLog:
                                                                    () async {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.8,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.9,
                                                                          child:
                                                                              CActivityLogSpecialDayWidget(
                                                                            id: specialDayAllItem.id,
                                                                          ),
                                                                        ),
                                                                      );
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
                                                      (specialDayAllIndex + 1)
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                      valueOrDefault<String>(
                                                        specialDayAllItem.name,
                                                        ' Name',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                      valueOrDefault<String>(
                                                        specialDayAllItem
                                                            .description,
                                                        'Description',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: AlignmentDirectional(0.0, 1.0),
            ),
            wrapWithModel(
              model: _model.cPaginationModel,
              updateCallback: () => safeSetState(() {}),
              child: CPaginationWidget(
                actionstruc: () async {},
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
