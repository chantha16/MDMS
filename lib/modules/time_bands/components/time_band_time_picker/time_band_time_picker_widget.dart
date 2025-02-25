import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'time_band_time_picker_model.dart';
export 'time_band_time_picker_model.dart';

class TimeBandTimePickerWidget extends StatefulWidget {
  const TimeBandTimePickerWidget({
    super.key,
    this.time,
    required this.timeType,
  });

  final String? time;
  final Time? timeType;

  @override
  State<TimeBandTimePickerWidget> createState() =>
      _TimeBandTimePickerWidgetState();
}

class _TimeBandTimePickerWidgetState extends State<TimeBandTimePickerWidget> {
  late TimeBandTimePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandTimePickerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.time == null || widget.time == '') {
        safeSetState(() {
          _model.hourTextController?.text = '00';
        });
        safeSetState(() {
          _model.minuteTextController?.text = '00';
        });
      } else {
        _model.hour =
            functions.splitTimeToIntList(widget.time!).elementAtOrNull(0);
        safeSetState(() {});
        _model.minute =
            functions.splitTimeToIntList(widget.time!).elementAtOrNull(1);
        safeSetState(() {});
        safeSetState(() {
          _model.hourTextController?.text = formatNumber(
            _model.hour,
            formatType: FormatType.custom,
            format: '00',
            locale: '',
          );
        });
        safeSetState(() {
          _model.minuteTextController?.text = formatNumber(
            _model.minute,
            formatType: FormatType.custom,
            format: '00',
            locale: '',
          );
        });
      }
    });

    _model.hourTextController ??= TextEditingController();
    _model.hourFocusNode ??= FocusNode();

    _model.minuteTextController ??= TextEditingController();
    _model.minuteFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 500.0,
          height: 245.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'gns85tx9' /* Select Time */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'e171kuwa' /* Hour */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.hourTextController,
                                    focusNode: _model.hourFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.hourTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        safeSetState(() {
                                          _model.hourTextController?.text =
                                              formatNumber(
                                            functions.validateTimeNumber(
                                                _model.hourTextController.text,
                                                23),
                                            formatType: FormatType.custom,
                                            format: '00',
                                            locale: '',
                                          );
                                        });
                                        _model.hour = int.tryParse(
                                            _model.hourTextController.text);
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
                                        shadows: [
                                          Shadow(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 2.0,
                                          )
                                        ],
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
                                              .secondaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
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
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                        ),
                                    textAlign: TextAlign.center,
                                    maxLength: 2,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .hourTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 32.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor: Color(0xFFC0C0C0),
                                      icon: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                      onPressed: (_model.hour! >= 23)
                                          ? null
                                          : () async {
                                              _model.hour = _model.hour! + 1;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.hourTextController
                                                    ?.text = formatNumber(
                                                  _model.hour,
                                                  formatType: FormatType.custom,
                                                  format: '00',
                                                  locale: '',
                                                );
                                              });
                                            },
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 32.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor: Color(0xFFC0C0C0),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                      onPressed: (_model.hour! <= 0)
                                          ? null
                                          : () async {
                                              _model.hour = _model.hour! + -1;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.hourTextController
                                                    ?.text = formatNumber(
                                                  _model.hour,
                                                  formatType: FormatType.custom,
                                                  format: '00',
                                                  locale: '',
                                                );
                                              });
                                            },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'd6lzjuhz' /* Minute */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.minuteTextController,
                                    focusNode: _model.minuteFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.minuteTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        safeSetState(() {
                                          _model.minuteTextController?.text =
                                              formatNumber(
                                            functions.validateTimeNumber(
                                                _model
                                                    .minuteTextController.text,
                                                59),
                                            formatType: FormatType.custom,
                                            format: '00',
                                            locale: '',
                                          );
                                        });
                                        _model.minute = int.tryParse(
                                            _model.minuteTextController.text);
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
                                        shadows: [
                                          Shadow(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 2.0,
                                          )
                                        ],
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
                                              .secondaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
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
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                        ),
                                    textAlign: TextAlign.center,
                                    maxLength: 2,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .minuteTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 32.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor: Color(0xFFC0C0C0),
                                      icon: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                      onPressed: (_model.minute! >= 59)
                                          ? null
                                          : () async {
                                              safeSetState(() {
                                                _model.minuteTextController
                                                    ?.text = formatNumber(
                                                  functions.validateTimeNumber(
                                                      (int.parse(_model
                                                                  .minuteTextController
                                                                  .text) +
                                                              (_model
                                                                  .selectedTime!))
                                                          .toString(),
                                                      59),
                                                  formatType: FormatType.custom,
                                                  format: '00',
                                                  locale: '',
                                                );
                                              });
                                              _model.minute = int.tryParse(
                                                  _model.minuteTextController
                                                      .text);
                                              safeSetState(() {});
                                            },
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 32.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor: Color(0xFFC0C0C0),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                      onPressed: (_model.minute! <= 0)
                                          ? null
                                          : () async {
                                              safeSetState(() {
                                                _model.minuteTextController
                                                    ?.text = formatNumber(
                                                  functions.validateTimeNumber(
                                                      (int.parse(_model
                                                                  .minuteTextController
                                                                  .text) -
                                                              (_model
                                                                  .selectedTime!))
                                                          .toString(),
                                                      59),
                                                  formatType: FormatType.custom,
                                                  format: '00',
                                                  locale: '',
                                                );
                                              });
                                              _model.minute = int.tryParse(
                                                  _model.minuteTextController
                                                      .text);
                                              safeSetState(() {});
                                            },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(FFLocalizations.of(context).getText(
                                  '33o7c7u9' /* 15 mn */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'scgqzalk' /* 30 mn */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  '4j1rxuhm' /* 45 mn */,
                                ))
                              ],
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                if (_model.choiceChipsValue == '15 mn') {
                                  _model.selectedTime = 15;
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue == '30 mn') {
                                  _model.selectedTime = 30;
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue == '45 mn') {
                                  _model.selectedTime = 45;
                                  safeSetState(() {});
                                } else {
                                  return;
                                }

                                _model.minute = _model.selectedTime;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.minuteTextController?.text =
                                      formatNumber(
                                    _model.minute,
                                    formatType: FormatType.custom,
                                    format: '00',
                                    locale: '',
                                  );
                                });
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 70.0,
                          height: 34.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              _model.mouseRegionHovered1
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'z16g17ld' /* Cancel */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onEnter: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered1 = true);
                      }),
                      onExit: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered1 = false);
                      }),
                    ),
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.timeType == Time.StartTime) {
                            FFAppState().selectedStartTime =
                                '${_model.hourTextController.text}:${_model.minuteTextController.text}';
                            safeSetState(() {});
                          } else if (widget.timeType == Time.EndTime) {
                            FFAppState().selectedEndTime =
                                '${_model.hourTextController.text}:${_model.minuteTextController.text}';
                            safeSetState(() {});
                          } else {
                            return;
                          }

                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 70.0,
                          height: 34.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              _model.mouseRegionHovered2
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6x8kroxz' /* OK */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onEnter: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered2 = true);
                      }),
                      onExit: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered2 = false);
                      }),
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ],
    );
  }
}
