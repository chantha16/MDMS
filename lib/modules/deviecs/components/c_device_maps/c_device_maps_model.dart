import '/backend/api_requests/api_calls.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_device_maps_widget.dart' show CDeviceMapsWidget;
import 'package:flutter/material.dart';

class CDeviceMapsModel extends FlutterFlowModel<CDeviceMapsWidget> {
  ///  Local state fields for this component.

  String? search;

  bool closemap = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in cDeviceMaps widget.
  ApiCallResponse? apigooglemapcallc;
  // State field(s) for cLatLongsSearch widget.
  FocusNode? cLatLongsSearchFocusNode;
  TextEditingController? cLatLongsSearchTextController;
  String? Function(BuildContext, String?)?
      cLatLongsSearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in cLatLongsSearch widget.
  ApiCallResponse? apigooglemapcallcmapsearch;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in Icon widget.
  ApiCallResponse? apigooglemapcallcsearchenter;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in GoogleMap widget.
  ApiCallResponse? apigooglemapcallcmapongooglewidget;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in Icon widget.
  ApiCallResponse? map;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  @override
  void initState(BuildContext context) {
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    cLatLongsSearchFocusNode?.dispose();
    cLatLongsSearchTextController?.dispose();

    primaryButtonModel.dispose();
  }
}
