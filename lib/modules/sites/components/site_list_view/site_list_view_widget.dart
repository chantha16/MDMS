import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/sites/components/site_actions/site_actions_widget.dart';
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
import 'site_list_view_model.dart';
export 'site_list_view_model.dart';

class SiteListViewWidget extends StatefulWidget {
  const SiteListViewWidget({
    super.key,
    this.actionMore,
    this.siteId,
    this.parentId,
  });

  final Future Function()? actionMore;
  final int? siteId;
  final int? parentId;

  @override
  State<SiteListViewWidget> createState() => _SiteListViewWidgetState();
}

class _SiteListViewWidgetState extends State<SiteListViewWidget> {
  late SiteListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SiteListViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = false;
      FFAppState().sitemodel = [];
      FFAppState().subSiteModel = [];
      safeSetState(() {});
      _model.apiResultdim = await SitesGroup.getAllSitesVTwoCall.call(
        search: _model.textController1.text,
        limit: _model.limitValue,
        offset: _model.offset,
      );

      if ((_model.apiResultdim?.succeeded ?? true)) {
        _model.sitemodel = (getJsonField(
          (_model.apiResultdim?.jsonBody ?? ''),
          r'''$.Site''',
          true,
        )!
                .toList()
                .map<SiteModelStruct?>(SiteModelStruct.maybeFromMap)
                .toList() as Iterable<SiteModelStruct?>)
            .withoutNulls
            .toList()
            .cast<SiteModelStruct>();
        _model.sitetotalpaginationcount = getJsonField(
          (_model.apiResultdim?.jsonBody ?? ''),
          r'''$.Paging.Item.Total''',
        );
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (_model.apiResultdim?.exceptionMessage ?? ''),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }

      FFAppState().isLoading = true;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.currentPageTextController ??=
        TextEditingController(text: _model.currentpage.toString());
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                  await Future.delayed(
                                      const Duration(milliseconds: 600));
                                  _model.getapiresultsearch =
                                      await SitesGroup.getAllSitesVTwoCall.call(
                                    search: '%${_model.textController1.text}%',
                                  );

                                  if ((_model.getapiresultsearch?.succeeded ??
                                      true)) {
                                    safeSetState(() {});
                                    _model.sitemodel = (getJsonField(
                                      (_model.getapiresultsearch?.jsonBody ??
                                          ''),
                                      r'''$.Site''',
                                      true,
                                    )!
                                                .toList()
                                                .map<SiteModelStruct?>(
                                                    SiteModelStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<SiteModelStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<SiteModelStruct>();
                                    _model.sitetotalpaginationcount =
                                        getJsonField(
                                      (_model.getapiresultsearch?.jsonBody ??
                                          ''),
                                      r'''$.Paging.Item.Total''',
                                    );
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
                                  'x2lumm5n' /* Search */,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                suffixIcon: _model
                                        .textController1!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.textController1?.clear();
                                          await Future.delayed(const Duration(
                                              milliseconds: 600));
                                          _model.getapiresultsearch =
                                              await SitesGroup
                                                  .getAllSitesVTwoCall
                                                  .call(
                                            search:
                                                '%${_model.textController1.text}%',
                                          );

                                          if ((_model.getapiresultsearch
                                                  ?.succeeded ??
                                              true)) {
                                            safeSetState(() {});
                                            _model.sitemodel = (getJsonField(
                                              (_model.getapiresultsearch
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.Site''',
                                              true,
                                            )!
                                                        .toList()
                                                        .map<SiteModelStruct?>(
                                                            SiteModelStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        SiteModelStruct?>)
                                                .withoutNulls
                                                .toList()
                                                .cast<SiteModelStruct>();
                                            _model.sitetotalpaginationcount =
                                                getJsonField(
                                              (_model.getapiresultsearch
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.Paging.Item.Total''',
                                            );
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
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      FlutterFlowLanguageSelector(
                        width: 200.0,
                        height: 40.0,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        borderColor: Colors.transparent,
                        dropdownIconColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: 8.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hideFlags: true,
                        flagSize: 24.0,
                        flagTextGap: 8.0,
                        currentLanguage:
                            FFLocalizations.of(context).languageCode,
                        languages: FFLocalizations.languages(),
                        onChanged: (lang) => setAppLanguage(context, lang),
                      ),
                    ],
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
                        textcolor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        btAction: () async {
                          await Future.delayed(
                              const Duration(milliseconds: 600));

                          context.goNamed(
                            MainSiteDetailPageWidget.routeName,
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
                  width: 46.0,
                  height: 46.0,
                  decoration: BoxDecoration(),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: Colors.transparent,
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
                      'y4edeqdr' /* No */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'd79s7v47' /* Name */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'g8c0zcqw' /* Description */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
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
                    ),
                    child: Builder(
                      builder: (context) {
                        if (FFAppState().isLoading) {
                          return Builder(
                            builder: (context) {
                              final readsitemodel =
                                  _model.sitemodel.map((e) => e).toList();
                              if (readsitemodel.isEmpty) {
                                return NoDataFoundedWidget();
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: readsitemodel.length,
                                itemBuilder: (context, readsitemodelIndex) {
                                  final readsitemodelItem =
                                      readsitemodel[readsitemodelIndex];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              MainSiteDetailPageWidget
                                                  .routeName,
                                              queryParameters: {
                                                'type': serializeParam(
                                                  Flag.View,
                                                  ParamType.Enum,
                                                ),
                                                'siteId': serializeParam(
                                                  readsitemodelItem.id,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: functions
                                                      .isOdd(readsitemodelIndex)
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
                                                                SiteActionsWidget(
                                                              actionDelete:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);

                                                                context
                                                                    .pushNamed(
                                                                  MainSiteDetailPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'type':
                                                                        serializeParam(
                                                                      Flag.Delete,
                                                                      ParamType
                                                                          .Enum,
                                                                    ),
                                                                    'siteId':
                                                                        serializeParam(
                                                                      readsitemodelItem
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
                                                              actionEdit:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);

                                                                context
                                                                    .pushNamed(
                                                                  MainSiteDetailPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'type':
                                                                        serializeParam(
                                                                      Flag.Update,
                                                                      ParamType
                                                                          .Enum,
                                                                    ),
                                                                    'siteId':
                                                                        serializeParam(
                                                                      readsitemodelItem
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

                                                                context
                                                                    .pushNamed(
                                                                  MainSiteDetailPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'type':
                                                                        serializeParam(
                                                                      Flag.View,
                                                                      ParamType
                                                                          .Enum,
                                                                    ),
                                                                    'siteId':
                                                                        serializeParam(
                                                                      readsitemodelItem
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
                                                  flex: 1,
                                                  child: Text(
                                                    (_model.offset +
                                                            readsitemodelIndex +
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
                                                  flex: 2,
                                                  child: Text(
                                                    readsitemodelItem.name,
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
                                                  flex: 2,
                                                  child: Text(
                                                    readsitemodelItem
                                                        .description,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
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
                                'q5dd749w' /* Rows per page */,
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
                                  'qmc3ubgi' /* 25 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ydrxdz1q' /* 50 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'a841zfmo' /* 100 */,
                                )
                              ],
                              onChanged: (val) async {
                                safeSetState(() => _model.limitValue = val);
                                _model.currentpage = 1;
                                _model.offset = functions.caluclationOffset(
                                    _model.currentpage, _model.limitValue!);
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.currentPageTextController?.text =
                                      _model.currentpage.toString();
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 600));
                                _model.apiResultPagination =
                                    await SitesGroup.getAllSitesVTwoCall.call(
                                  limit: _model.limitValue,
                                  offset: _model.offset,
                                  search: _model.textController1.text,
                                  includeSubSite: true,
                                );

                                if ((_model.apiResultPagination?.succeeded ??
                                    true)) {
                                  _model.sitemodel = (getJsonField(
                                    (_model.apiResultPagination?.jsonBody ??
                                        ''),
                                    r'''$.Site''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SiteModelStruct?>(
                                                  SiteModelStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<SiteModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SiteModelStruct>();
                                  _model.sitetotalpaginationcount =
                                      getJsonField(
                                    (_model.apiResultPagination?.jsonBody ??
                                        ''),
                                    r'''$.Paging.Item.Total''',
                                  );
                                  safeSetState(() {});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        (_model.apiResultdim
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
                                '9ps4yjnp' /* 25 */,
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
                              onPressed: (_model.currentpage == 1)
                                  ? null
                                  : () async {
                                      _model.currentpage =
                                          _model.currentpage + -1;
                                      _model.offset =
                                          functions.caluclationOffset(
                                              _model.currentpage,
                                              _model.limitValue!);
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.currentPageTextController?.text =
                                            _model.currentpage.toString();
                                      });
                                      await Future.delayed(
                                          const Duration(milliseconds: 600));
                                      _model.apiResultPrevious =
                                          await SitesGroup.getAllSitesVTwoCall
                                              .call(
                                        limit: _model.limitValue,
                                        offset: _model.offset,
                                      );

                                      if ((_model
                                              .apiResultPrevious?.succeeded ??
                                          true)) {
                                        _model.sitemodel = (getJsonField(
                                          (_model.apiResultPrevious?.jsonBody ??
                                              ''),
                                          r'''$.Site''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<SiteModelStruct?>(
                                                        SiteModelStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<SiteModelStruct?>)
                                            .withoutNulls
                                            .toList()
                                            .cast<SiteModelStruct>();
                                        _model.sitetotalpaginationcount =
                                            getJsonField(
                                          (_model.apiResultPrevious?.jsonBody ??
                                              ''),
                                          r'''$.Paging.Item.Total''',
                                        );
                                        safeSetState(() {});
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              (_model.apiResultdim
                                                      ?.exceptionMessage ??
                                                  ''),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
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
                                              .validationPageInputNo(
                                                  _model
                                                      .currentPageTextController
                                                      .text,
                                                  functions.calulationTotalPages(
                                                      _model
                                                          .sitetotalpaginationcount,
                                                      _model.limitValue!))
                                              .toString();
                                    });
                                    _model.currentpage = int.parse(
                                        _model.currentPageTextController.text);
                                    _model.offset = functions.calculateOffset(
                                        _model.currentpage, _model.limitValue!);
                                    safeSetState(() {});
                                    await Future.delayed(
                                        const Duration(milliseconds: 600));
                                    _model.apiResultInput = await SitesGroup
                                        .getAllSitesVTwoCall
                                        .call(
                                      limit: _model.limitValue,
                                      offset: _model.offset,
                                      search: _model.textController1.text,
                                    );

                                    if ((_model.apiResultInput?.succeeded ??
                                        true)) {
                                      _model.sitemodel = (getJsonField(
                                        (_model.apiResultInput?.jsonBody ?? ''),
                                        r'''$.Site''',
                                        true,
                                      )!
                                                  .toList()
                                                  .map<SiteModelStruct?>(
                                                      SiteModelStruct.maybeFromMap)
                                                  .toList()
                                              as Iterable<SiteModelStruct?>)
                                          .withoutNulls
                                          .toList()
                                          .cast<SiteModelStruct>();
                                      _model.sitetotalpaginationcount =
                                          getJsonField(
                                        (_model.apiResultInput?.jsonBody ?? ''),
                                        r'''$.Paging.Item.Total''',
                                      );
                                      safeSetState(() {});
                                      FFAppState().isLoading = true;
                                      safeSetState(() {});
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            (_model.apiResultdim
                                                    ?.exceptionMessage ??
                                                ''),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
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
                                  hintText: FFLocalizations.of(context).getText(
                                    '8vecf9ax' /* 1 */,
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
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .currentPageTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'b79tv1vm' /* of */,
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
                                  .calulationTotalPages(
                                      _model.sitetotalpaginationcount,
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
                              onPressed: (_model.currentpage ==
                                      functions.calulationTotalPages(
                                          _model.sitetotalpaginationcount,
                                          _model.limitValue!))
                                  ? null
                                  : () async {
                                      _model.currentpage =
                                          _model.currentpage + 1;
                                      _model.offset =
                                          functions.caluclationOffset(
                                              _model.currentpage,
                                              _model.limitValue!);
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.currentPageTextController?.text =
                                            _model.currentpage.toString();
                                      });
                                      await Future.delayed(
                                          const Duration(milliseconds: 600));
                                      _model.apiResultNext = await SitesGroup
                                          .getAllSitesVTwoCall
                                          .call(
                                        limit: _model.limitValue,
                                        offset: _model.offset,
                                        search: _model.textController1.text,
                                        includeSubSite: false,
                                      );

                                      if ((_model.apiResultNext?.succeeded ??
                                          true)) {
                                        _model.sitemodel = (getJsonField(
                                          (_model.apiResultNext?.jsonBody ??
                                              ''),
                                          r'''$.Site''',
                                          true,
                                        )!
                                                    .toList()
                                                    .map<SiteModelStruct?>(
                                                        SiteModelStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<SiteModelStruct?>)
                                            .withoutNulls
                                            .toList()
                                            .cast<SiteModelStruct>();
                                        _model.sitetotalpaginationcount =
                                            getJsonField(
                                          (_model.apiResultNext?.jsonBody ??
                                              ''),
                                          r'''$.Paging.Item.Total''',
                                        );
                                        safeSetState(() {});
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              (_model.apiResultdim
                                                      ?.exceptionMessage ??
                                                  ''),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
