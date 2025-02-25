import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'c_device_maps_model.dart';
export 'c_device_maps_model.dart';

class CDeviceMapsWidget extends StatefulWidget {
  const CDeviceMapsWidget({
    super.key,
    this.type,
  });

  final Flag? type;

  @override
  State<CDeviceMapsWidget> createState() => _CDeviceMapsWidgetState();
}

class _CDeviceMapsWidgetState extends State<CDeviceMapsWidget> {
  late CDeviceMapsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CDeviceMapsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apigooglemapcallc = await GeocodingAPICall.call();

      if ((_model.apigooglemapcallc?.succeeded ?? true)) {
        FFAppState().latitude = getJsonField(
          (_model.apigooglemapcallc?.jsonBody ?? ''),
          r'''$.results[:].geometry.lat''',
        );
        FFAppState().longitude = getJsonField(
          (_model.apigooglemapcallc?.jsonBody ?? ''),
          r'''$.results[:].geometry.lng''',
        );
        FFAppState().StoreMapList = (getJsonField(
          (_model.apigooglemapcallc?.jsonBody ?? ''),
          r'''$.results[:].formatted''',
          true,
        ) as List)
            .map<String>((s) => s.toString())
            .toList()
            .toList()
            .cast<String>();
        safeSetState(() {});
        FFAppState().address = getJsonField(
          (_model.apigooglemapcallc?.jsonBody ?? ''),
          r'''$.results[:].formatted''',
        ).toString().toString();
        FFAppState().StoreMap = _model.googleMapsCenter;
        safeSetState(() {});
      }
    });

    _model.cLatLongsSearchTextController ??=
        TextEditingController(text: FFAppState().storMapString);
    _model.cLatLongsSearchFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 1100.0,
        height: 800.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 500.0,
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: 400.0,
                                    child: TextFormField(
                                      controller:
                                          _model.cLatLongsSearchTextController,
                                      focusNode:
                                          _model.cLatLongsSearchFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.cLatLongsSearchTextController',
                                        Duration(milliseconds: 1000),
                                        () async {
                                          FFAppState().StoreMapList = [];
                                          safeSetState(() {});
                                          _model.apigooglemapcallcmapsearch =
                                              await GeocodingAPICall.call(
                                            locationInput:
                                                '%${_model.cLatLongsSearchTextController.text}%',
                                          );

                                          if ((_model.apigooglemapcallcmapsearch
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().latitude =
                                                GeocodingAPICall.lat(
                                              (_model.apigooglemapcallcmapsearch
                                                      ?.jsonBody ??
                                                  ''),
                                            )!;
                                            FFAppState().longitude =
                                                GeocodingAPICall.lng(
                                              (_model.apigooglemapcallcmapsearch
                                                      ?.jsonBody ??
                                                  ''),
                                            )!;
                                            FFAppState().storMapString =
                                                getJsonField(
                                              (_model.apigooglemapcallcmapsearch
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.results[:].formatted''',
                                            ).toString();
                                            FFAppState().StoreMapList =
                                                (getJsonField(
                                              (_model.apigooglemapcallcmapsearch
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.results[:].formatted''',
                                              true,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()
                                                    .toList()
                                                    .cast<String>();
                                            safeSetState(() {});
                                            FFAppState().StoreMap =
                                                functions.formatLatLng(
                                                    getJsonField(
                                                      (_model.apigooglemapcallcmapsearch
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.results[:].geometry.lat''',
                                                    ),
                                                    getJsonField(
                                                      (_model.apigooglemapcallcmapsearch
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.results[:].geometry.lng''',
                                                    ));
                                            FFAppState().update(() {});
                                          }

                                          FFAppState().update(() {});

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
                                          .cLatLongsSearchTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.04, 0.1),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 11.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.apigooglemapcallcsearchenter =
                                    await GeocodingAPICall.call(
                                  locationInput:
                                      '%${_model.cLatLongsSearchTextController.text}%',
                                );

                                if ((_model.apigooglemapcallcsearchenter
                                        ?.succeeded ??
                                    true)) {
                                  FFAppState().storMapString = getJsonField(
                                    (_model.apigooglemapcallcsearchenter
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.results[:].formatted''',
                                  ).toString();
                                  FFAppState().StoreMapList = (getJsonField(
                                    (_model.apigooglemapcallcsearchenter
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.results[:].formatted''',
                                    true,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()
                                      .toList()
                                      .cast<String>();
                                  safeSetState(() {});
                                  FFAppState().StoreMap =
                                      functions.formatLatLng(
                                          getJsonField(
                                            (_model.map?.jsonBody ?? ''),
                                            r'''$.results[:].geometry.lat''',
                                          ),
                                          getJsonField(
                                            (_model.map?.jsonBody ?? ''),
                                            r'''$.results[:].geometry.lng''',
                                          ));
                                  safeSetState(() {});
                                  _model.search =
                                      _model.cLatLongsSearchTextController.text;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.search_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 100.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    hoverColor: FlutterFlowTheme.of(context).alternate,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(2.0, 16.0, 0.0, 0.0),
                      child: Builder(builder: (context) {
                        final _googleMapMarker = FFAppState().StoreMap;
                        return FlutterFlowGoogleMap(
                          controller: _model.googleMapsController,
                          onCameraIdle: (latLng) => safeSetState(
                              () => _model.googleMapsCenter = latLng),
                          initialLocation: _model.googleMapsCenter ??=
                              LatLng(11.562108, 104.888535),
                          markers: [
                            if (_googleMapMarker != null)
                              FlutterFlowMarker(
                                _googleMapMarker.serialize(),
                                _googleMapMarker,
                                () async {
                                  _model.apigooglemapcallcmapongooglewidget =
                                      await GeocodingAPICall.call(
                                    locationInput:
                                        FFAppState().StoreMap?.toString(),
                                  );

                                  if ((_model.apigooglemapcallcmapongooglewidget
                                          ?.succeeded ??
                                      true)) {
                                    FFAppState().storMapString = getJsonField(
                                      (_model.apigooglemapcallcmapongooglewidget
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.results[:].formatted''',
                                    ).toString();
                                    FFAppState().StoreMapList = (getJsonField(
                                      (_model.apigooglemapcallcmapongooglewidget
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.results[:].formatted''',
                                      true,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()
                                        .toList()
                                        .cast<String>();
                                    safeSetState(() {});
                                    FFAppState().latitude = getJsonField(
                                      (_model.apigooglemapcallcmapongooglewidget
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.results[:].annotations.DMS.lat''',
                                    );
                                    FFAppState().longitude = getJsonField(
                                      (_model.apigooglemapcallcmapongooglewidget
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.results[:].annotations.DMS.lng''',
                                    );
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                              ),
                          ],
                          markerColor: GoogleMarkerColor.violet,
                          mapType: MapType.hybrid,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14.0,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: true,
                          showLocation: true,
                          showCompass: true,
                          showMapToolbar: true,
                          showTraffic: true,
                          centerMapOnMarkerTap: false,
                        );
                      }),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: PointerInterceptor(
                        intercepting: isWeb,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().StoreMap != null) {
                              safeSetState(() {
                                _model.cLatLongsSearchTextController?.clear();
                              });
                              FFAppState().StoreMap = _model.googleMapsCenter;
                              safeSetState(() {});
                              _model.map = await GeocodingAPICall.call(
                                locationInput: _model.cLatLongsSearchTextController
                                                .text !=
                                            ''
                                    ? _model.cLatLongsSearchTextController.text
                                    : functions.convertLatLngToString(
                                        FFAppState().StoreMap!),
                              );

                              FFAppState().storMapString = getJsonField(
                                (_model.map?.jsonBody ?? ''),
                                r'''$.results[:].formatted''',
                              ).toString();
                              safeSetState(() {});
                              safeSetState(() {
                                _model.cLatLongsSearchTextController?.text =
                                    FFAppState().storMapString;
                              });
                            } else {
                              FFAppState().StoreMap = _model.googleMapsCenter;
                              safeSetState(() {});
                              safeSetState(() {
                                _model.cLatLongsSearchTextController?.text =
                                    FFAppState().StoreMap!.toString();
                              });
                            }

                            FFAppState().update(() {});

                            safeSetState(() {});
                          },
                          child: FaIcon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ),
                    if (((FFAppState().StoreMapList.isNotEmpty) == true) ||
                        _model.closemap)
                      PointerInterceptor(
                        intercepting: isWeb,
                        child: Container(
                          height: 300.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 500.0,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 5.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final listMap = FFAppState()
                                              .StoreMapList
                                              .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listMap.length,
                                            itemBuilder:
                                                (context, listMapIndex) {
                                              final listMapItem =
                                                  listMap[listMapIndex];
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (FFAppState()
                                                                    .storMapString !=
                                                                '') {
                                                          safeSetState(() {
                                                            _model
                                                                .cLatLongsSearchTextController
                                                                ?.clear();
                                                          });
                                                          FFAppState()
                                                                  .storMapString =
                                                              listMapItem;
                                                          FFAppState()
                                                                  .StoreMap =
                                                              functions.formatLatLng(
                                                                  listMapIndex
                                                                      .toDouble(),
                                                                  listMapIndex
                                                                      .toDouble());
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.cLatLongsSearchTextController
                                                                    ?.text =
                                                                listMapItem;
                                                          });
                                                          _model.closemap =
                                                              false;
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState()
                                                                  .storMapString =
                                                              listMapItem;
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.cLatLongsSearchTextController
                                                                    ?.text =
                                                                listMapItem;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .mapMarkerAlt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 22.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  listMapItem,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.closemap = false;
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().storMapString = getJsonField(
                          (_model.map?.jsonBody ?? ''),
                          r'''$.results[:].formatted''',
                        ).toString();
                        safeSetState(() {});
                        safeSetState(() {
                          _model.cLatLongsSearchTextController?.text =
                              FFAppState().generateDataDevice.location;
                        });
                        Navigator.pop(context);
                      },
                      child: wrapWithModel(
                        model: _model.primaryButtonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: PrimaryButtonWidget(
                          tbName: 'Save',
                          btAction: () async {
                            FFAppState().StoreMap = _model.googleMapsCenter;
                            safeSetState(() {});
                            Navigator.pop(context);
                          },
                          exception: () async {},
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
