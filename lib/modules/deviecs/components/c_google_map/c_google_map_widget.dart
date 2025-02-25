import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'c_google_map_model.dart';
export 'c_google_map_model.dart';

class CGoogleMapWidget extends StatefulWidget {
  const CGoogleMapWidget({
    super.key,
    this.mapAction,
  });

  final Future Function()? mapAction;

  @override
  State<CGoogleMapWidget> createState() => _CGoogleMapWidgetState();
}

class _CGoogleMapWidgetState extends State<CGoogleMapWidget> {
  late CGoogleMapModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CGoogleMapModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: LinearProgressIndicator(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
      );
    }

    return Builder(builder: (context) {
      final _googleMapMarker = FFAppState().StoreMap;
      return FlutterFlowGoogleMap(
        controller: _model.googleMapsController,
        onCameraIdle: (latLng) =>
            safeSetState(() => _model.googleMapsCenter = latLng),
        initialLocation: _model.googleMapsCenter ??= currentUserLocationValue!,
        markers: [
          if (_googleMapMarker != null)
            FlutterFlowMarker(
              _googleMapMarker.serialize(),
              _googleMapMarker,
              () async {
                await widget.mapAction?.call();
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
        centerMapOnMarkerTap: true,
      );
    });
  }
}
