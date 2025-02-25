import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'sub_site_detail_view_model.dart';
export 'sub_site_detail_view_model.dart';

class SubSiteDetailViewWidget extends StatefulWidget {
  const SubSiteDetailViewWidget({
    super.key,
    required this.type,
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
  State<SubSiteDetailViewWidget> createState() =>
      _SubSiteDetailViewWidgetState();
}

class _SubSiteDetailViewWidgetState extends State<SubSiteDetailViewWidget> {
  late SubSiteDetailViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubSiteDetailViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = false;
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          _model.allSite = await SitesGroup.getAllSitesVTwoCall.call(
            includeSubSite: true,
          );

          _model.main = await SitesGroup.getSiteByIDCall.call(
            id: widget.parentId,
            includeSubSite: false,
          );

          if ((_model.allSite?.succeeded ?? true)) {
            _model.maindropdown = (getJsonField(
              (_model.allSite?.jsonBody ?? ''),
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
          }
          if ((_model.main?.succeeded ?? true)) {
            _model.subsitemodel = (getJsonField(
              (_model.main?.jsonBody ?? ''),
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
              _model.dropDownValueController?.value = widget.parentId;
            });
          }
        }),
        Future(() async {
          _model.apiResultbyId = await SitesGroup.getSiteByIDCall.call(
            id: widget.siteId,
            includeSubSite: false,
          );

          if ((_model.apiResultbyId?.succeeded ?? true)) {
            _model.subsitemodel = (getJsonField(
              (_model.apiResultbyId?.jsonBody ?? ''),
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
                  _model.subsitemodel.lastOrNull!.name;
            });
            safeSetState(() {
              _model.descriptionTextController?.text =
                  _model.subsitemodel.lastOrNull!.description;
            });
            safeSetState(() {
              _model.dropDownValueController?.value = widget.parentId;
            });
          }
        }),
      ]);
      FFAppState().isLoading = true;
      safeSetState(() {});
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

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
                  context.safePop();
                },
              ),
              Text(
                () {
                  if (widget.type == Flag.Add) {
                    return 'Add Sub-Site';
                  } else if (widget.type == Flag.Update) {
                    return 'Update Sub-Site';
                  } else if (widget.type == Flag.Delete) {
                    return 'Delete Sub-Site';
                  } else {
                    return 'View Sub-Site';
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
                      Expanded(
                        child: Container(
                          width: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                150.0, 0.0, 150.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'xhbv5vcc' /* Name */,
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
                                                            'jhcr6axb' /*  * */,
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
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _model.nameTextController,
                                                  focusNode:
                                                      _model.nameFocusNode,
                                                  autofocus: false,
                                                  readOnly: () {
                                                    if (widget.type ==
                                                        Flag.Add) {
                                                      return (FFAppState()
                                                              .view ==
                                                          true);
                                                    } else if (widget.type ==
                                                        Flag.Update) {
                                                      return (FFAppState()
                                                              .view !=
                                                          false);
                                                    } else if (widget.type ==
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
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    alignLabelWithHint: true,
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'i6lyjjph' /* Choose Main */,
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
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SafeArea(
                                                  child: Container(
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                        int>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              int>(null),
                                                      options: List<int>.from(
                                                          _model.maindropdown
                                                              .map((e) => e.id)
                                                              .toList()),
                                                      optionLabels: _model
                                                          .maindropdown
                                                          .map((e) => e.name)
                                                          .toList(),
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.dropDownValue =
                                                                  val),
                                                      maxHeight: 400.0,
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      searchHintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'bpsxgy5i' /* Search... */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      disabled: widget.type !=
                                                          Flag.Update,
                                                      isOverButton: false,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'ftmg3n8u' /* Description */,
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
                                                            'v4mywfue' /*   */,
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
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
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
                                                    } else if (widget.type ==
                                                        Flag.Update) {
                                                      return (FFAppState()
                                                              .view !=
                                                          false);
                                                    } else if (widget.type ==
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
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    alignLabelWithHint: true,
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
                                                          offset:
                                                              Offset(2.0, 2.0),
                                                          blurRadius: 2.0,
                                                        )
                                                      ],
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(150.0, 0.0, 150.0, 24.0),
            child: Row(
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
                      context.safePop();
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
                          _model.apiResultxsd =
                              await SitesGroup.createSiteCall.call(
                            name: _model.nameTextController.text,
                            description: _model.descriptionTextController.text,
                            parentId: widget.parentId,
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResultxsd?.succeeded ?? true)) {
                            await action_blocks.handleExceptions(
                              context,
                              message: functions.handleApiError(
                                  HandleErrorStruct.maybeFromMap(
                                          (_model.apiResultxsd?.jsonBody ??
                                              ''))!
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
                          _model.apiResult68v =
                              await SitesGroup.updateSiteCall.call(
                            name: _model.nameTextController.text,
                            description: _model.descriptionTextController.text,
                            id: widget.siteId,
                            parentId: _model.dropDownValue == null
                                ? widget.parentId
                                : _model.dropDownValue,
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResult68v?.succeeded ?? true)) {
                            await action_blocks.handleExceptions(
                              context,
                              message: functions.handleApiError(
                                  HandleErrorStruct.maybeFromMap(
                                          (_model.apiResult68v?.jsonBody ??
                                              ''))!
                                      .error,
                                  _model.nameTextController.text),
                              title: 'Message',
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else if (widget.type == Flag.Delete) {
                          _model.apiResultxsds =
                              await SitesGroup.deleteSiteCall.call(
                            id: widget.siteId?.toString(),
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResult68v?.succeeded ?? true)) {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        _model.allSiteRepsonse =
                            await SitesGroup.getSiteByIDCall.call(
                          id: FFAppState().sitId,
                          includeSubSite: true,
                        );

                        _shouldSetState = true;
                        FFAppState().sitemodel = (getJsonField(
                          (_model.allSiteRepsonse?.jsonBody ?? ''),
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
                        FFAppState().subSiteModel = (getJsonField(
                          (_model.allSiteRepsonse?.jsonBody ?? ''),
                          r'''$.Site''',
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
                        context.safePop();
                        FFAppState().loading = false;
                        FFAppState().update(() {});
                        if (_shouldSetState) safeSetState(() {});
                      },
                      exception: () async {},
                    ),
                  ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
