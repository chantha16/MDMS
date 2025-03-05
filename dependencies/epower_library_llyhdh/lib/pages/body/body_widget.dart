import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/cutomization/body_header/body_header_widget.dart';
import '/cutomization/pagination_panel/pagination_panel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'body_model.dart';
export 'body_model.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late BodyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultwhh = await GetSeasonsCall.call();

      if ((_model.apiResultwhh?.succeeded ?? true)) {
        FFAppState().seasonResponse = (getJsonField(
          (_model.apiResultwhh?.jsonBody ?? ''),
          r'''$.Season''',
          true,
        )!
                .toList()
                .map<SeasonModelStruct?>(SeasonModelStruct.maybeFromMap)
                .toList() as Iterable<SeasonModelStruct?>)
            .withoutNulls
            .toList()
            .cast<SeasonModelStruct>();
        safeSetState(() {});
        _model.onSearch = true;
        safeSetState(() {});
      }
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

    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.bodyHeaderModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: BodyHeaderWidget(
              onChanged: () async {
                _model.searchResponse = await GetSeasonsCall.call(
                  search: '%${_model.bodyHeaderModel.textController.text}%',
                  limit: _model.paginationPanelModel.dropDownValue,
                );

                if ((_model.searchResponse?.succeeded ?? true)) {
                  FFAppState().seasonResponse = (getJsonField(
                    (_model.searchResponse?.jsonBody ?? ''),
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
                  _model.onSearch = true;
                  safeSetState(() {});
                } else {
                  _model.onSearch = false;
                  safeSetState(() {});
                }

                safeSetState(() {});
              },
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.tune,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'No',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Name',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Discriptions',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Month Range',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (_model.onSearch == true) {
                          return Builder(
                            builder: (context) {
                              final seasons =
                                  FFAppState().seasonResponse.toList();
                              if (seasons.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'dependencies/epower_library_llyhdh/assets/images/mdms-1.png',
                                  ),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: seasons.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 2.0),
                                itemBuilder: (context, seasonsIndex) {
                                  final seasonsItem = seasons[seasonsIndex];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 12.0, 15.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.more_vert,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  (seasonsIndex + 1).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              seasonsItem.name,
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
                                              seasonsItem.description,
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
                                              seasonsItem.monthRange,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Icon(
                                Icons.build,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
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
          ),
          wrapWithModel(
            model: _model.paginationPanelModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: PaginationPanelWidget(
              totalItem: valueOrDefault<int>(
                getJsonField(
                  (_model.apiResultwhh?.jsonBody ?? ''),
                  r'''$.Paging.Item.Total''',
                ),
                1,
              ),
              ddInitialValue: 10,
              ddOptionLabel: List.generate(random_data.randomInteger(5, 5),
                  (index) => random_data.randomName(true, true)),
              ddOptionValue: List.generate(random_data.randomInteger(5, 5),
                  (index) => random_data.randomInteger(0, 10)),
              onSelected: () async {
                _model.pagingResponse = await GetSeasonsCall.call(
                  search: '%${_model.bodyHeaderModel.textController.text}%',
                  limit: _model.paginationPanelModel.dropDownValue,
                );

                if ((_model.pagingResponse?.succeeded ?? true)) {
                  FFAppState().seasonResponse = (getJsonField(
                    (_model.pagingResponse?.jsonBody ?? ''),
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
                  _model.onSearch = true;
                  safeSetState(() {});
                } else {
                  _model.onSearch = false;
                  safeSetState(() {});
                }

                safeSetState(() {});
              },
              onSearchPaging: () async {
                _model.searchPagingResponse = await GetSeasonsCall.call(
                  search: '%${_model.bodyHeaderModel.textController.text}%',
                  limit: _model.paginationPanelModel.dropDownValue,
                  offset: (_model.paginationPanelModel.currentPage - 1) *
                      (_model.paginationPanelModel.dropDownValue!),
                );

                if ((_model.pagingResponse?.succeeded ?? true)) {
                  FFAppState().seasonResponse = (getJsonField(
                    (_model.searchPagingResponse?.jsonBody ?? ''),
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
                  _model.onSearch = true;
                  safeSetState(() {});
                } else {
                  _model.onSearch = false;
                  safeSetState(() {});
                }

                safeSetState(() {});
              },
              onPreviousPage: () async {
                _model.prevouisPageResponse = await GetSeasonsCall.call(
                  search: '%${_model.bodyHeaderModel.textController.text}%',
                  limit: _model.paginationPanelModel.dropDownValue,
                  offset: (_model.paginationPanelModel.currentPage - 1) *
                      (_model.paginationPanelModel.dropDownValue!),
                );

                if ((_model.prevouisPageResponse?.succeeded ?? true)) {
                  FFAppState().seasonResponse = (getJsonField(
                    (_model.prevouisPageResponse?.jsonBody ?? ''),
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
                  _model.onSearch = true;
                  safeSetState(() {});
                } else {
                  _model.onSearch = false;
                  safeSetState(() {});
                }

                safeSetState(() {});
              },
              onNextPage: () async {
                _model.nextPageResponse = await GetSeasonsCall.call(
                  search: '%${_model.bodyHeaderModel.textController.text}%',
                  limit: _model.paginationPanelModel.dropDownValue,
                  offset: (_model.paginationPanelModel.currentPage - 1) *
                      (_model.paginationPanelModel.dropDownValue!),
                );

                if ((_model.nextPageResponse?.succeeded ?? true)) {
                  FFAppState().seasonResponse = (getJsonField(
                    (_model.nextPageResponse?.jsonBody ?? ''),
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
                  _model.onSearch = true;
                  safeSetState(() {});
                } else {
                  _model.onSearch = false;
                  safeSetState(() {});
                }

                safeSetState(() {});
              },
            ),
          ),
        ].divide(SizedBox(height: 15.0)),
      ),
    );
  }
}
