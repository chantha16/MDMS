import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'c_season_detail_copy_model.dart';
export 'c_season_detail_copy_model.dart';

class CSeasonDetailCopyWidget extends StatefulWidget {
  const CSeasonDetailCopyWidget({
    super.key,
    this.type,
    this.types,
    this.api,
    this.id,
    this.seasondetail,
  });

  final Flag? type;
  final FlagStruct? types;
  final dynamic api;
  final int? id;
  final SeasonModelStruct? seasondetail;

  @override
  State<CSeasonDetailCopyWidget> createState() =>
      _CSeasonDetailCopyWidgetState();
}

class _CSeasonDetailCopyWidgetState extends State<CSeasonDetailCopyWidget> {
  late CSeasonDetailCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CSeasonDetailCopyModel());

    _model.nameFocusNode ??= FocusNode();

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
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      () {
                        if (widget.type == Flag.Add) {
                          return 'Add Season';
                        } else if (widget.type == Flag.Update) {
                          return 'Update Season';
                        } else {
                          return 'View Season';
                        }
                      }(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ].divide(SizedBox(height: 3.0)),
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
            Expanded(
              child: FutureBuilder<ApiCallResponse>(
                future: SeasonGroup.readSeasonByIdCall.call(
                  id: widget.id,
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
                  final formReadSeasonByIdResponse = snapshot.data!;

                  return Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          150.0, 0.0, 150.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'z0tyq1i6' /* Name */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'i5p5mg9t' /*  * */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _model.nameTextController ??=
                                          TextEditingController(
                                        text: () {
                                          if (widget.type == Flag.Add) {
                                            return '';
                                          } else if (widget.type ==
                                              Flag.Update) {
                                            return getJsonField(
                                              formReadSeasonByIdResponse
                                                  .jsonBody,
                                              r'''$.Season[:].Name''',
                                            ).toString();
                                          } else {
                                            return getJsonField(
                                              formReadSeasonByIdResponse
                                                  .jsonBody,
                                              r'''$.Season[:].Name''',
                                            ).toString();
                                          }
                                        }(),
                                      ),
                                      focusNode: _model.nameFocusNode,
                                      autofocus: false,
                                      readOnly: () {
                                        if (widget.type == Flag.Add) {
                                          return (FFAppState().view == true);
                                        } else if (widget.type ==
                                            Flag.Update) {
                                          return (FFAppState().view != false);
                                        } else {
                                          return (FFAppState().view == false);
                                        }
                                      }(),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        alignLabelWithHint: true,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 19.0, 16.0, 19.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.name,
                                      validator: _model
                                          .nameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 15.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '6o7ezh30' /* Start Month */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'zktv24ri' /*  * */,
                                              ),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController1 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue1 ??= () {
                                              if (widget.type == Flag.Add) {
                                                return '';
                                              } else if (widget.type ==
                                                  Flag.Update) {
                                                return getJsonField(
                                                  formReadSeasonByIdResponse
                                                      .jsonBody,
                                                  r'''$.Season[:].MonthRage''',
                                                ).toString();
                                              } else {
                                                return getJsonField(
                                                  formReadSeasonByIdResponse
                                                      .jsonBody,
                                                  r'''$.Season[:].MonthRage''',
                                                ).toString();
                                              }
                                            }(),
                                          ),
                                          options: [
                                            Month.Jan.name,
                                            Month.Feb.name,
                                            Month.Mar.name,
                                            Month.Apr.name,
                                            Month.May.name,
                                            Month.Jun.name,
                                            Month.Jul.name,
                                            Month.Aug.name,
                                            Month.Sep.name,
                                            Month.Oct.name,
                                            Month.Nov.name,
                                            Month.Dec.name
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownValue1 = val),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: () {
                                            if (widget.type == Flag.Add) {
                                              return '';
                                            } else if (widget.type ==
                                                Flag.Update) {
                                              return getJsonField(
                                                formReadSeasonByIdResponse
                                                    .jsonBody,
                                                r'''$.Season[:].MonthRange''',
                                              ).toString();
                                            } else {
                                              return getJsonField(
                                                formReadSeasonByIdResponse
                                                    .jsonBody,
                                                r'''$.Season[:].MonthRange''',
                                              ).toString();
                                            }
                                          }(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          elevation: 1.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          disabled: () {
                                            if (widget.type == Flag.Add) {
                                              return (FFAppState().view ==
                                                  true);
                                            } else if (widget.type ==
                                                Flag.Update) {
                                              return (FFAppState().view !=
                                                  false);
                                            } else {
                                              return (FFAppState().view ==
                                                  false);
                                            }
                                          }(),
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionHovered1 = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionHovered1 = false);
                                      }),
                                    ),
                                    if (FFAppState().ValidateDropdown != false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'el5n4t3q' /* Please choose start month! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'm2bb4q5b' /* End Month */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'f17fnhke' /*  * */,
                                              ),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController2 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue2 ??= () {
                                              if (widget.type == Flag.Add) {
                                                return '';
                                              } else if (widget.type ==
                                                  Flag.Update) {
                                                return getJsonField(
                                                  formReadSeasonByIdResponse
                                                      .jsonBody,
                                                  r'''$.Season[:].MonthRange''',
                                                ).toString();
                                              } else {
                                                return getJsonField(
                                                  formReadSeasonByIdResponse
                                                      .jsonBody,
                                                  r'''$.Season[:].MonthRange''',
                                                ).toString();
                                              }
                                            }(),
                                          ),
                                          options: [
                                            Month.Jan.name,
                                            Month.Feb.name,
                                            Month.Mar.name,
                                            Month.Apr.name,
                                            Month.May.name,
                                            Month.Jun.name,
                                            Month.Jul.name,
                                            Month.Aug.name,
                                            Month.Sep.name,
                                            Month.Oct.name,
                                            Month.Nov.name,
                                            Month.Dec.name
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownValue2 = val),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: () {
                                            if (widget.type == Flag.Add) {
                                              return '';
                                            } else if (widget.type ==
                                                Flag.Update) {
                                              return getJsonField(
                                                formReadSeasonByIdResponse
                                                    .jsonBody,
                                                r'''$.Season[:].MonthRange''',
                                              ).toString();
                                            } else {
                                              return getJsonField(
                                                formReadSeasonByIdResponse
                                                    .jsonBody,
                                                r'''$.Season[:].MonthRange''',
                                              ).toString();
                                            }
                                          }(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          elevation: 1.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 10.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          disabled: () {
                                            if (widget.type == Flag.Add) {
                                              return (FFAppState().view ==
                                                  true);
                                            } else if (widget.type ==
                                                Flag.Update) {
                                              return (FFAppState().view !=
                                                  false);
                                            } else {
                                              return (FFAppState().view ==
                                                  false);
                                            }
                                          }(),
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionHovered2 = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionHovered2 = false);
                                      }),
                                    ),
                                    if (valueOrDefault<bool>(
                                      FFAppState().Selectedrequired != '',
                                      true,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'b2k2348a' /* Please choose end month! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 15.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'r255wnww' /* Description */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.descriptionTextController ??=
                                              TextEditingController(
                                        text: () {
                                          if (widget.type == Flag.Add) {
                                            return '';
                                          } else if (widget.type ==
                                              Flag.Update) {
                                            return getJsonField(
                                              formReadSeasonByIdResponse
                                                  .jsonBody,
                                              r'''$.Season[:].Description''',
                                            ).toString();
                                          } else {
                                            return getJsonField(
                                              formReadSeasonByIdResponse
                                                  .jsonBody,
                                              r'''$.Season[:].Description''',
                                            ).toString();
                                          }
                                        }(),
                                      ),
                                      focusNode: _model.descriptionFocusNode,
                                      autofocus: false,
                                      readOnly: () {
                                        if (widget.type == Flag.Add) {
                                          return (FFAppState().view == true);
                                        } else if (widget.type ==
                                            Flag.Update) {
                                          return (FFAppState().view != false);
                                        } else {
                                          return (FFAppState().view == false);
                                        }
                                      }(),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        alignLabelWithHint: true,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 18.0, 20.0, 18.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      maxLines: 5,
                                      validator: _model
                                          .descriptionTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(150.0, 0.0, 150.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (widget.type == Flag.Add) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.secoundaryButtonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: SecoundaryButtonWidget(
                            btName: 'Cancel',
                            btAction: () async {
                              context.safePop();
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.primaryButtonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryButtonWidget(
                            tbName: 'Save',
                            font:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fillcolor: FlutterFlowTheme.of(context).primary,
                            btAction: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.dropDownValue1 == null) {
                                return;
                              }
                              if (_model.dropDownValue2 == null) {
                                return;
                              }
                              _model.apiResultp7h =
                                  await SeasonGroup.createSeasonCall.call(
                                name: _model.nameTextController.text,
                                description:
                                    _model.descriptionTextController.text,
                                monthRange: '1,2,3',
                              );

                              if ((_model.apiResultp7h?.succeeded ?? true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Add Successfully.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                  ),
                                );
                                context.safePop();
                              }

                              safeSetState(() {});
                            },
                            exception: () async {},
                          ),
                        ),
                      ].divide(SizedBox(width: 15.0)),
                    );
                  } else if (widget.type == Flag.Update) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.secoundaryButtonModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: SecoundaryButtonWidget(
                            btName: 'Cancel',
                            btAction: () async {
                              context.safePop();
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.primaryButtonModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryButtonWidget(
                            tbName: 'Save',
                            font:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fillcolor: FlutterFlowTheme.of(context).primary,
                            btAction: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.dropDownValue1 == null) {
                                return;
                              }
                              if (_model.dropDownValue2 == null) {
                                return;
                              }
                              _model.apiResultrn9 =
                                  await SeasonGroup.updateSeasonCall.call(
                                name: _model.nameTextController.text,
                                description:
                                    _model.descriptionTextController.text,
                                id: widget.id,
                                monthRange: '1,2,3,4',
                              );

                              if ((_model.apiResultrn9?.succeeded ?? true)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Update Successfully.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                  ),
                                );
                                context.safePop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Update Failed!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            exception: () async {},
                          ),
                        ),
                      ].divide(SizedBox(width: 15.0)),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 15.0, 10.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.primaryButtonModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: PrimaryButtonWidget(
                              tbName: 'Close',
                              font: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fillcolor: FlutterFlowTheme.of(context).primary,
                              btAction: () async {
                                Navigator.pop(context);
                              },
                              exception: () async {},
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    );
                  }
                },
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
