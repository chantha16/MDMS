import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/seasons/components/menuoption/menuoption_widget.dart';
import '/modules/seasons/components/search_not_found/search_not_found_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_season_copy2_team1_model.dart';
export 'c_season_copy2_team1_model.dart';

class CSeasonCopy2Team1Widget extends StatefulWidget {
  const CSeasonCopy2Team1Widget({
    super.key,
    this.months,
    this.month,
    this.seasonId,
  });

  final MonthStruct? months;
  final Month? month;
  final int? seasonId;

  @override
  State<CSeasonCopy2Team1Widget> createState() =>
      _CSeasonCopy2Team1WidgetState();
}

class _CSeasonCopy2Team1WidgetState extends State<CSeasonCopy2Team1Widget> {
  late CSeasonCopy2Team1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CSeasonCopy2Team1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultlbp = await SeasonGroup.readAllSeasonsCall.call(
        search: _model.textController.text,
        limit: 25,
        offset: 0,
      );

      if ((_model.apiResultlbp?.succeeded ?? true)) {
        _model.modelSeason = (getJsonField(
          (_model.apiResultlbp?.jsonBody ?? ''),
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
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 300),
                              () async {
                                _model.apiResult64i =
                                    await SeasonGroup.readAllSeasonsCall.call(
                                  search: _model.textController.text,
                                  limit: 25,
                                  offset: 0,
                                );

                                if ((_model.apiResult64i?.succeeded ?? true)) {
                                  _model.modelSeason = (getJsonField(
                                    (_model.apiResult64i?.jsonBody ?? ''),
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
                                  safeSetState(() {});
                                }

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
                                'tmi0axnc' /* Search */,
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
                              suffixIcon: _model.textController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textController?.clear();
                                        _model.apiResult64i = await SeasonGroup
                                            .readAllSeasonsCall
                                            .call(
                                          search: _model.textController.text,
                                          limit: 25,
                                          offset: 0,
                                        );

                                        if ((_model.apiResult64i?.succeeded ??
                                            true)) {
                                          _model.modelSeason = (getJsonField(
                                            (_model.apiResult64i?.jsonBody ??
                                                ''),
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
                                          safeSetState(() {});
                                        }

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
                            validator: _model.textControllerValidator
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
                        'gz16fy31' /* No */,
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
                        'i9dvdj2n' /* Name */,
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
                        'j0doup3s' /* Month Range */,
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
                        '0ubnqch8' /* Description */,
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
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                      child: Builder(
                        builder: (context) {
                          final model = _model.modelSeason.toList();
                          if (model.isEmpty) {
                            return SearchNotFoundWidget();
                          }

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: model.length,
                            separatorBuilder: (_, __) => SizedBox(height: 6.0),
                            itemBuilder: (context, modelIndex) {
                              final modelItem = model[modelIndex];
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) =>
                                                FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 46.0,
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              hoverIconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              icon: Icon(
                                                Icons.more_vert,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      color: Colors.transparent,
                                                      child: MenuoptionWidget(),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              (modelIndex + 1).toString(),
                                              textAlign: TextAlign.start,
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
                                            flex: 4,
                                            child: Text(
                                              modelItem.name,
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
                                            flex: 6,
                                            child: Builder(
                                              builder: (context) {
                                                final month = functions
                                                    .splitStringByComma(
                                                        modelItem.monthRange)
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
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    );
                                                  }).divide(
                                                      SizedBox(width: 5.0)),
                                                );
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              modelItem.description,
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
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
