import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/device_view/device_view_widget.dart';
import 'search_device_widget.dart' show SearchDeviceWidget;
import 'package:flutter/material.dart';

class SearchDeviceModel extends FlutterFlowModel<SearchDeviceWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DeviceView component.
  late DeviceViewModel deviceViewModel;

  @override
  void initState(BuildContext context) {
    deviceViewModel = createModel(context, () => DeviceViewModel());
  }

  @override
  void dispose() {
    deviceViewModel.dispose();
  }
}
