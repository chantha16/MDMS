import '';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/deviecs/components/c_device_maps/c_device_maps_widget.dart';
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
import 'c_general_info_model.dart';
export 'c_general_info_model.dart';

class CGeneralInfoWidget extends StatefulWidget {
  const CGeneralInfoWidget({
    super.key,
    this.deviceId,
    this.type,
    this.groupId,
  });

  final String? deviceId;
  final Flag? type;
  final int? groupId;

  @override
  State<CGeneralInfoWidget> createState() => _CGeneralInfoWidgetState();
}

class _CGeneralInfoWidgetState extends State<CGeneralInfoWidget> {
  late CGeneralInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CGeneralInfoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.cSerialNumberTextController?.text =
            FFAppState().deviceModel.lastOrNull!.serialNumber;
      });
      safeSetState(() {
        _model.cModelTextController?.text =
            FFAppState().deviceModel.lastOrNull!.model;
      });
      safeSetState(() {
        _model.cDevicetypeValueController?.value =
            FFAppState().deviceModel.lastOrNull!.deviceType;
      });
      safeSetState(() {
        _model.cManufactureTextController?.text =
            FFAppState().deviceModel.lastOrNull!.manufacturer;
      });
      safeSetState(() {
        _model.cDeviceGroupValueController?.value =
            FFAppState().deviceModel.lastOrNull!.deviceGroupId;
      });
      safeSetState(() {
        _model.cLocationTextController?.text = FFAppState().storMapString;
      });
      if (widget.type != Flag.Add) {
        safeSetState(() {
          _model.cLocationTextController?.text = FFAppState().storMapString;
        });
      } else {
        FFAppState().StoreMap = LatLng(11.5945062, 104.8577052);
        FFAppState().storMapString = '';
        safeSetState(() {});
        safeSetState(() {
          _model.cLocationTextController?.clear();
        });
      }
    });

    _model.cSerialNumberTextController ??= TextEditingController();
    _model.cSerialNumberFocusNode ??= FocusNode();

    _model.cModelTextController ??= TextEditingController();
    _model.cModelFocusNode ??= FocusNode();

    _model.cManufactureTextController ??= TextEditingController();
    _model.cManufactureFocusNode ??= FocusNode();

    _model.cLocationTextController ??=
        TextEditingController(text: FFAppState().storMapString);
    _model.cLocationFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '84bovnfx' /* General Info */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '7amcn8qn' /* Serial Number */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'ziedugmb' /*  * */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).error,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _model.cSerialNumberTextController,
                        focusNode: _model.cSerialNumberFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.cSerialNumberTextController',
                          Duration(milliseconds: 2000),
                          () async {
                            FFAppState().updateGenerateDataDeviceStruct(
                              (e) => e
                                ..serialNumber =
                                    _model.cSerialNumberTextController.text,
                            );
                            FFAppState().update(() {});
                          },
                        ),
                        autofocus: false,
                        readOnly: () {
                          if (widget.type == Flag.Add) {
                            return (FFAppState().view == true);
                          } else if (widget.type == Flag.Update) {
                            return (FFAppState().view != false);
                          } else if (widget.type == Flag.Delete) {
                            return (FFAppState().view == false);
                          } else {
                            return (FFAppState().view == false);
                          }
                        }(),
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          alignLabelWithHint: true,
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
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
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 19.0, 16.0, 19.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        maxLength: 50,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        keyboardType: TextInputType.name,
                        validator: _model.cSerialNumberTextControllerValidator
                            .asValidator(context),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'q5gz7398' /* Model */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _model.cModelTextController,
                        focusNode: _model.cModelFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.cModelTextController',
                          Duration(milliseconds: 2000),
                          () async {
                            FFAppState().updateGenerateDataDeviceStruct(
                              (e) =>
                                  e..model = _model.cModelTextController.text,
                            );
                            safeSetState(() {});
                          },
                        ),
                        autofocus: false,
                        readOnly: () {
                          if (widget.type == Flag.Add) {
                            return (FFAppState().view == true);
                          } else if (widget.type == Flag.Update) {
                            return (FFAppState().view != false);
                          } else if (widget.type == Flag.Delete) {
                            return (FFAppState().view == false);
                          } else {
                            return (FFAppState().view == false);
                          }
                        }(),
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          alignLabelWithHint: true,
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
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
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 19.0, 16.0, 19.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        keyboardType: TextInputType.name,
                        validator: _model.cModelTextControllerValidator
                            .asValidator(context),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '0ydgrj9g' /* Manufacture */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _model.cManufactureTextController,
                        focusNode: _model.cManufactureFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.cManufactureTextController',
                          Duration(milliseconds: 2000),
                          () async {
                            FFAppState().updateGenerateDataDeviceStruct(
                              (e) => e
                                ..manufacturer =
                                    _model.cManufactureTextController.text,
                            );
                            safeSetState(() {});
                          },
                        ),
                        autofocus: false,
                        readOnly: () {
                          if (widget.type == Flag.Add) {
                            return (FFAppState().view == true);
                          } else if (widget.type == Flag.Update) {
                            return (FFAppState().view != false);
                          } else if (widget.type == Flag.Delete) {
                            return (FFAppState().view == false);
                          } else {
                            return (FFAppState().view == false);
                          }
                        }(),
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          alignLabelWithHint: true,
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
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
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 19.0, 16.0, 19.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        keyboardType: TextInputType.name,
                        validator: _model.cManufactureTextControllerValidator
                            .asValidator(context),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'xupg4hj2' /* Location */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 47.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFAppState().storMapString,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if ((widget.type == Flag.Add) ||
                                  (widget.type == Flag.Update))
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: true,
                                          targetAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: CDeviceMapsWidget(
                                                type: Flag.Add,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.mapMarkerAlt,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.hidetemporary)
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
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
                                          'jf8ahoc5' /* Location2 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _model.cLocationTextController,
                                focusNode: _model.cLocationFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.cLocationTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    FFAppState().updateGenerateDataDeviceStruct(
                                      (e) => e
                                        ..model =
                                            _model.cLocationTextController.text,
                                    );
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                readOnly: () {
                                  if (widget.type == Flag.Add) {
                                    return (FFAppState().view == true);
                                  } else if (widget.type == Flag.Update) {
                                    return (FFAppState().view != false);
                                  } else if (widget.type == Flag.Delete) {
                                    return (FFAppState().view == false);
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
                                    .cLocationTextControllerValidator
                                    .asValidator(context),
                              ),
                            ],
                          ),
                        ),
                        if ((widget.type == Flag.Add) ||
                            (widget.type == Flag.Update))
                          Align(
                            alignment: AlignmentDirectional(0.97, 0.5),
                            child: Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 35.0, 10.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showAlignedDialog(
                                      context: context,
                                      isGlobal: false,
                                      avoidOverflow: true,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: CDeviceMapsWidget(
                                            type: Flag.Add,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'zir09zk9' /* Device Type */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Container(
                          height: 47.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.cDevicetypeValueController ??=
                                FormFieldController<String>(
                              _model.cDevicetypeValue ??= 'None',
                            ),
                            options: List<String>.from(FFAppState().DeviceType),
                            optionLabels: FFAppState().DeviceType,
                            onChanged: (val) async {
                              safeSetState(() => _model.cDevicetypeValue = val);
                              FFAppState().updateGenerateDataDeviceStruct(
                                (e) => e..deviceType = _model.cDevicetypeValue,
                              );
                              safeSetState(() {});
                            },
                            maxHeight: 400.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'zjg18kb4' /* None */,
                            ),
                            searchHintText: FFLocalizations.of(context).getText(
                              '2pcpk7h3' /* Search... */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            disabled: () {
                              if (widget.type == Flag.Add) {
                                return (FFAppState().view == true);
                              } else if (widget.type == Flag.Update) {
                                return (FFAppState().view != false);
                              } else if (widget.type == Flag.Delete) {
                                return (FFAppState().view == false);
                              } else {
                                return (FFAppState().view == false);
                              }
                            }(),
                            isOverButton: false,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'jpezww47' /* Device Group */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Container(
                          height: 47.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: FlutterFlowDropDown<int>(
                            controller: _model.cDeviceGroupValueController ??=
                                FormFieldController<int>(null),
                            options: List<int>.from(FFAppState()
                                .deviceGroups
                                .map((e) => e.id)
                                .toList()),
                            optionLabels: FFAppState()
                                .deviceGroups
                                .map((e) => e.name)
                                .toList(),
                            onChanged: (val) async {
                              safeSetState(
                                  () => _model.cDeviceGroupValue = val);
                              FFAppState().updateGenerateDataDeviceStruct(
                                (e) =>
                                    e..deviceGroupId = _model.cDeviceGroupValue,
                              );
                              safeSetState(() {});
                            },
                            maxHeight: 400.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'x9u5z5k0' /* None */,
                            ),
                            searchHintText: FFLocalizations.of(context).getText(
                              'yfuedqz7' /* Search... */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
