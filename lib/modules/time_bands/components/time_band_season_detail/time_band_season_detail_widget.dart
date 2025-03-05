import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'time_band_season_detail_model.dart';
export 'time_band_season_detail_model.dart';

class TimeBandSeasonDetailWidget extends StatefulWidget {
  const TimeBandSeasonDetailWidget({
    super.key,
    required this.type,
    this.seasonId,
  });

  final Flag? type;
  final int? seasonId;

  @override
  State<TimeBandSeasonDetailWidget> createState() =>
      _TimeBandSeasonDetailWidgetState();
}

class _TimeBandSeasonDetailWidgetState
    extends State<TimeBandSeasonDetailWidget> {
  late TimeBandSeasonDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandSeasonDetailModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.type == Flag.View) {
        _model.loading = false;
        safeSetState(() {});
        _model.seasonRes = await SeasonGroup.readSeasonByIdCall.call(
          id: widget.seasonId,
        );

        if ((_model.seasonRes?.succeeded ?? true)) {
          _model.season = SeasonModelStruct.maybeFromMap(getJsonField(
            (_model.seasonRes?.jsonBody ?? ''),
            r'''$.Season[0]''',
          ));
          safeSetState(() {});
          safeSetState(() {
            _model.nameTextController?.text = _model.season!.name;
          });
          safeSetState(() {
            _model.descriptionTextController?.text = _model.season!.description;
          });
          safeSetState(() {
            _model.choiceChipsValueController?.value =
                functions.splitStringByComma(_model.season!.monthRange);
          });
          _model.loading = true;
          safeSetState(() {});
        } else {
          return;
        }
      } else {
        return;
      }
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
    return Builder(
      builder: (context) {
        if (_model.loading) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Container(
                  width: 450.0,
                  height: 470.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
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
                                '2smr7ded' /* Season */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7enpqgol' /* Name */,
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
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nt3hrg7d' /*   */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                        controller: _model.nameTextController,
                                        focusNode: _model.nameFocusNode,
                                        autofocus: false,
                                        readOnly: (widget.type == Flag.View) ||
                                            (widget.type == Flag.Delete),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            shadows: [
                                              Shadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: Offset(1.0, 1.0),
                                                blurRadius: 2.0,
                                              )
                                            ],
                                          ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 19.0, 16.0, 19.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength: 200,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: TextInputType.name,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'jmhaubzo' /* Month Range */,
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
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'vtv0alju' /*   */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(Month.Jan.name),
                                                ChipData(Month.Feb.name),
                                                ChipData(Month.Mar.name),
                                                ChipData(Month.Apr.name),
                                                ChipData(Month.May.name),
                                                ChipData(Month.Jun.name),
                                                ChipData(Month.Jul.name),
                                                ChipData(Month.Aug.name),
                                                ChipData(Month.Sep.name),
                                                ChipData(Month.Oct.name),
                                                ChipData(Month.Nov.name),
                                                ChipData(Month.Dec.name)
                                              ],
                                              onChanged: ((widget.type ==
                                                          Flag.View) ||
                                                      (widget.type ==
                                                          Flag.Delete))
                                                  ? null
                                                  : (val) => safeSetState(() =>
                                                      _model.choiceChipsValues =
                                                          val),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 2.0,
                                                            10.0, 2.0),
                                                elevation: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 2.0,
                                                            10.0, 2.0),
                                                elevation: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: true,
                                              initialized:
                                                  _model.choiceChipsValues !=
                                                      null,
                                              alignment: WrapAlignment.center,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              wrapped: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
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
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '8a4tbpet' /* Description */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'mub76t8a' /*   */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                controller: _model.descriptionTextController,
                                focusNode: _model.descriptionFocusNode,
                                autofocus: false,
                                readOnly: (widget.type == Flag.View) ||
                                    (widget.type == Flag.Delete),
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
                                        color: FlutterFlowTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
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
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: 5,
                                maxLength: 250,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                validator: _model
                                    .descriptionTextControllerValidator
                                    .asValidator(context),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          );
        } else {
          return Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
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
            ),
          );
        }
      },
    );
  }
}
