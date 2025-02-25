import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/sites/components/site_actions/site_actions_widget.dart';
import '/actions/actions.dart' as action_blocks;
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
import 'main_site_detial_view_model.dart';
export 'main_site_detial_view_model.dart';

class MainSiteDetialViewWidget extends StatefulWidget {
  const MainSiteDetialViewWidget({
    super.key,
    this.type,
    this.siteId,
    int? parentId,
    bool? triggerRefresh,
  })  : this.parentId = parentId ?? 0,
        this.triggerRefresh = triggerRefresh ?? false;

  final Flag? type;
  final int? siteId;
  final int parentId;
  final bool triggerRefresh;

  @override
  State<MainSiteDetialViewWidget> createState() =>
      _MainSiteDetialViewWidgetState();
}

class _MainSiteDetialViewWidgetState extends State<MainSiteDetialViewWidget> {
  late MainSiteDetialViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainSiteDetialViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.type != Flag.Add) {
        FFAppState().isLoading = false;
        safeSetState(() {});
        FFAppState().sitId = widget.siteId!;
        safeSetState(() {});
        _model.apiResultSite = await SitesGroup.getSiteByIDCall.call(
          id: widget.siteId,
          includeSubSite: true,
          search: _model.textController3.text,
        );

        if ((_model.apiResultSite?.succeeded ?? true)) {
          FFAppState().sitemodel = (getJsonField(
            (_model.apiResultSite?.jsonBody ?? ''),
            r'''$.Site[:].SubSites''',
            true,
          )!
                  .toList()
                  .map<SubSiteModelStruct?>(SubSiteModelStruct.maybeFromMap)
                  .toList() as Iterable<SubSiteModelStruct?>)
              .withoutNulls
              .toList()
              .cast<SubSiteModelStruct>();
          FFAppState().subSiteModel = (getJsonField(
            (_model.apiResultSite?.jsonBody ?? ''),
            r'''$.Site''',
            true,
          )!
                  .toList()
                  .map<SubSiteModelStruct?>(SubSiteModelStruct.maybeFromMap)
                  .toList() as Iterable<SubSiteModelStruct?>)
              .withoutNulls
              .toList()
              .cast<SubSiteModelStruct>();
          safeSetState(() {});
          safeSetState(() {
            _model.nameTextController?.text =
                FFAppState().subSiteModel.lastOrNull!.name;
          });
          safeSetState(() {
            _model.descriptionTextController?.text =
                FFAppState().subSiteModel.lastOrNull!.description;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                valueOrDefault<String>(
                  (_model.apiResultSite?.exceptionMessage ?? ''),
                  'Error',
                ),
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
      } else {
        safeSetState(() {
          _model.nameTextController?.clear();
          _model.descriptionTextController?.clear();
          _model.textController3?.clear();
        });
        await Future.delayed(const Duration(milliseconds: 300));
        FFAppState().subSiteModel = [];
        FFAppState().isLoading = false;
        _model.updatePage(() {});
        FFAppState().sitemodel = [];
        _model.updatePage(() {});
        FFAppState().isLoading = true;
        safeSetState(() {});
        return;
      }
    });

    _model.nameTextController ??= TextEditingController(
        text: widget.type != Flag.Add
            ? FFAppState().subSiteModel.lastOrNull?.name
            : '');
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController(
        text: widget.type != Flag.Add
            ? FFAppState().subSiteModel.lastOrNull?.description
            : '');
    _model.descriptionFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
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
    context.watch<FFAppState>();
    context.watch<epower_library_llyhdh_app_state.FFAppState>();

    return Container(
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterFlowIconButton(
                borderRadius: 30.0,
                buttonSize: 40.0,
                hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.goNamed(
                    MainSitePageWidget.routeName,
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
              Text(
                () {
                  if (widget.type == Flag.Add) {
                    return 'Add Site';
                  } else if (widget.type == Flag.Update) {
                    return 'Update Site';
                  } else if (widget.type == Flag.Delete) {
                    return 'Delete Siite';
                  } else {
                    return 'View Site';
                  }
                }(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (FFAppState().isLoading) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 350.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            't5z0zxo7' /* Main Site */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'meflyv6z' /* Name */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '8ywnzohi' /*  * */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )
                                                          ],
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
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .nameTextController,
                                                      focusNode:
                                                          _model.nameFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.nameTextController',
                                                        Duration(
                                                            milliseconds: 100),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      readOnly: () {
                                                        if (widget.type ==
                                                            Flag.Add) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              true);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Update) {
                                                          return (FFAppState()
                                                                  .view !=
                                                              false);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Delete) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        } else {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        }
                                                      }(),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    19.0,
                                                                    16.0,
                                                                    19.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.name,
                                                      validator: _model
                                                          .nameTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'b5c969xm' /* Description */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'x8xmonku' /*   */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )
                                                          ],
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
                                                    ),
                                                    TextFormField(
                                                      controller: _model
                                                          .descriptionTextController,
                                                      focusNode: _model
                                                          .descriptionFocusNode,
                                                      autofocus: false,
                                                      readOnly: () {
                                                        if (widget.type ==
                                                            Flag.Add) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              true);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Update) {
                                                          return (FFAppState()
                                                                  .view !=
                                                              false);
                                                        } else if (widget
                                                                .type ==
                                                            Flag.Delete) {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        } else {
                                                          return (FFAppState()
                                                                  .view ==
                                                              false);
                                                        }
                                                      }(),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 2.0,
                                                            )
                                                          ],
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    19.0,
                                                                    16.0,
                                                                    19.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: 3,
                                                      maxLength: 250,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      validator: _model
                                                          .descriptionTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'rcvmk3ku' /* Sub-Site */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController3,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController3',
                                                        Duration(
                                                            milliseconds: 300),
                                                        () async {
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      600));
                                                          _model.apiResultsSearch =
                                                              await SitesGroup
                                                                  .getSiteByIDCall
                                                                  .call(
                                                            id: widget.siteId,
                                                            includeSubSite:
                                                                true,
                                                            search:
                                                                '%${_model.textController3.text}%',
                                                          );

                                                          if ((_model
                                                                  .apiResultsSearch
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState()
                                                                    .sitemodel =
                                                                (getJsonField(
                                                              (_model.apiResultsSearch
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.Site[:].SubSites''',
                                                              true,
                                                            )!
                                                                        .toList()
                                                                        .map<SubSiteModelStruct?>(
                                                                            SubSiteModelStruct.maybeFromMap)
                                                                        .toList() as Iterable<SubSiteModelStruct?>)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .cast<SubSiteModelStruct>();
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '9qzab83m' /* Search */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons.search,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        suffixIcon: _model
                                                                .textController3!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .textController3
                                                                      ?.clear();
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              600));
                                                                  _model.apiResultsSearch =
                                                                      await SitesGroup
                                                                          .getSiteByIDCall
                                                                          .call(
                                                                    id: widget
                                                                        .siteId,
                                                                    includeSubSite:
                                                                        true,
                                                                    search:
                                                                        '%${_model.textController3.text}%',
                                                                  );

                                                                  if ((_model
                                                                          .apiResultsSearch
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    FFAppState()
                                                                        .sitemodel = (getJsonField(
                                                                      (_model.apiResultsSearch
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.Site[:].SubSites''',
                                                                      true,
                                                                    )!
                                                                            .toList()
                                                                            .map<SubSiteModelStruct?>(SubSiteModelStruct.maybeFromMap)
                                                                            .toList() as Iterable<SubSiteModelStruct?>)
                                                                        .withoutNulls
                                                                        .toList()
                                                                        .cast<SubSiteModelStruct>();
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: null,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .textController3Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((widget.type ==
                                                      Flag.Update) ||
                                                  (widget.type == Flag.View))
                                                wrapWithModel(
                                                  model: _model
                                                      .primaryButtonWithIconModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      PrimaryButtonWithIconWidget(
                                                    tbName: 'Add',
                                                    btIcon: Icon(
                                                      Icons.add_box,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    colorbottom:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textcolor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    btAction: () async {
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  600));

                                                      context.pushNamed(
                                                        SubsiteDetailPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'type':
                                                              serializeParam(
                                                            Flag.Add,
                                                            ParamType.Enum,
                                                          ),
                                                          'parentId':
                                                              serializeParam(
                                                            widget.siteId,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
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
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.slidersH,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'x6ksy5c9' /* No */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fgznugqo' /* Name */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'iuzq7nzy' /* Description */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final subsitemode =
                                                            FFAppState()
                                                                .sitemodel
                                                                .toList();
                                                        if (subsitemode
                                                            .isEmpty) {
                                                          return Center(
                                                            child:
                                                                NoDataFoundedWidget(),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: subsitemode
                                                              .length,
                                                          itemBuilder: (context,
                                                              subsitemodeIndex) {
                                                            final subsitemodeItem =
                                                                subsitemode[
                                                                    subsitemodeIndex];
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        SubsiteDetailPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'type':
                                                                              serializeParam(
                                                                            Flag.View,
                                                                            ParamType.Enum,
                                                                          ),
                                                                          'siteId':
                                                                              serializeParam(
                                                                            subsitemodeItem.id,
                                                                            ParamType.int,
                                                                          ),
                                                                          'parentId':
                                                                              serializeParam(
                                                                            widget.siteId,
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
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 0),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: functions.isOdd(subsitemodeIndex)
                                                                            ? FlutterFlowTheme.of(context).primaryBackground
                                                                            : FlutterFlowTheme.of(context).secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              hoverColor: FlutterFlowTheme.of(context).alternate,
                                                                              icon: Icon(
                                                                                Icons.more_vert,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                await showAlignedDialog(
                                                                                  barrierColor: Colors.transparent,
                                                                                  context: context,
                                                                                  isGlobal: false,
                                                                                  avoidOverflow: true,
                                                                                  targetAnchor: AlignmentDirectional(1.0, 1.0).resolve(Directionality.of(context)),
                                                                                  followerAnchor: AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                                                                                  builder: (dialogContext) {
                                                                                    return Material(
                                                                                      color: Colors.transparent,
                                                                                      child: SiteActionsWidget(
                                                                                        actionDelete: () async {
                                                                                          Navigator.pop(context);

                                                                                          context.pushNamed(
                                                                                            SubsiteDetailPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'type': serializeParam(
                                                                                                Flag.Delete,
                                                                                                ParamType.Enum,
                                                                                              ),
                                                                                              'siteId': serializeParam(
                                                                                                subsitemodeItem.id,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                              'parentId': serializeParam(
                                                                                                widget.siteId,
                                                                                                ParamType.int,
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
                                                                                        actionEdit: () async {
                                                                                          Navigator.pop(context);

                                                                                          context.pushNamed(
                                                                                            SubsiteDetailPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'type': serializeParam(
                                                                                                Flag.Update,
                                                                                                ParamType.Enum,
                                                                                              ),
                                                                                              'siteId': serializeParam(
                                                                                                subsitemodeItem.id,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                              'parentId': serializeParam(
                                                                                                widget.siteId,
                                                                                                ParamType.int,
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
                                                                                        actionView: () async {
                                                                                          Navigator.pop(context);

                                                                                          context.pushNamed(
                                                                                            SubsiteDetailPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'type': serializeParam(
                                                                                                Flag.View,
                                                                                                ParamType.Enum,
                                                                                              ),
                                                                                              'siteId': serializeParam(
                                                                                                subsitemodeItem.id,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                              'parentId': serializeParam(
                                                                                                widget.siteId,
                                                                                                ParamType.int,
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
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Text(
                                                                              (FFAppState().offset + subsitemodeIndex + 1).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              subsitemodeItem.name,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              subsitemodeItem.description,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
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
                                                ].divide(
                                                    SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(width: 24.0)),
                  );
                } else {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wrapWithModel(
                model: _model.secoundaryButtonModel,
                updateCallback: () => safeSetState(() {}),
                child: SecoundaryButtonWidget(
                  btName: 'Cancel',
                  btAction: () async {
                    context.goNamed(
                      MainSitePageWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );

                    FFAppState().subSiteModel = [];
                    FFAppState().sitemodel = [];
                    safeSetState(() {});
                  },
                ),
              ),
              if (widget.type != Flag.View)
                wrapWithModel(
                  model: _model.primaryButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: PrimaryButtonWidget(
                    tbName: 'Save',
                    font: FlutterFlowTheme.of(context).primaryBackground,
                    fillcolor: FlutterFlowTheme.of(context).primary,
                    btAction: () async {
                      var _shouldSetState = false;
                      if (widget.type == Flag.Add) {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        _model.apicreatesite =
                            await SitesGroup.createSiteCall.call(
                          name: _model.nameTextController.text,
                          description: _model.descriptionTextController.text,
                          parentId: widget.parentId,
                        );

                        _shouldSetState = true;
                        if ((_model.apicreatesite?.succeeded ?? true)) {
                          safeSetState(() {
                            _model.nameTextController?.clear();
                            _model.descriptionTextController?.clear();
                          });
                        } else {
                          await action_blocks.handleExceptions(
                            context,
                            message: functions.handleApiError(
                                HandleErrorStruct.maybeFromMap(
                                        (_model.apicreatesite?.jsonBody ?? ''))!
                                    .error,
                                _model.nameTextController.text),
                            title: 'Message',
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else if (widget.type == Flag.Update) {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        _model.apiupdatesite =
                            await SitesGroup.updateSiteCall.call(
                          name: _model.nameTextController.text,
                          description: _model.descriptionTextController.text,
                          id: widget.siteId,
                          parentId: FFAppState().sitId,
                        );

                        _shouldSetState = true;
                        if (!(_model.apiupdatesite?.succeeded ?? true)) {
                          await action_blocks.handleExceptions(
                            context,
                            message: functions.handleApiError(
                                HandleErrorStruct.maybeFromMap(
                                        (_model.apiupdatesite?.jsonBody ?? ''))!
                                    .error,
                                _model.nameTextController.text),
                            title: 'Message',
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else if (widget.type == Flag.Delete) {
                        _model.apideletesite =
                            await SitesGroup.deleteSiteCall.call(
                          id: widget.siteId?.toString(),
                        );

                        _shouldSetState = true;
                        if (!(_model.apideletesite?.succeeded ?? true)) {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      FFAppState().isLoading = false;
                      FFAppState().update(() {});
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        MainSitePageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );

                      if (_shouldSetState) safeSetState(() {});
                    },
                    exception: () async {},
                  ),
                ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
