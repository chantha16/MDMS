import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_general_info_widget.dart' show CGeneralInfoWidget;
import 'package:flutter/material.dart';

class CGeneralInfoModel extends FlutterFlowModel<CGeneralInfoWidget> {
  ///  Local state fields for this component.

  bool hidetemporary = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for cSerialNumber widget.
  FocusNode? cSerialNumberFocusNode;
  TextEditingController? cSerialNumberTextController;
  String? Function(BuildContext, String?)? cSerialNumberTextControllerValidator;
  // State field(s) for cModel widget.
  FocusNode? cModelFocusNode;
  TextEditingController? cModelTextController;
  String? Function(BuildContext, String?)? cModelTextControllerValidator;
  // State field(s) for cManufacture widget.
  FocusNode? cManufactureFocusNode;
  TextEditingController? cManufactureTextController;
  String? Function(BuildContext, String?)? cManufactureTextControllerValidator;
  // State field(s) for cLocation widget.
  FocusNode? cLocationFocusNode;
  TextEditingController? cLocationTextController;
  String? Function(BuildContext, String?)? cLocationTextControllerValidator;
  // State field(s) for cDevicetype widget.
  String? cDevicetypeValue;
  FormFieldController<String>? cDevicetypeValueController;
  // State field(s) for cDeviceGroup widget.
  int? cDeviceGroupValue;
  FormFieldController<int>? cDeviceGroupValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cSerialNumberFocusNode?.dispose();
    cSerialNumberTextController?.dispose();

    cModelFocusNode?.dispose();
    cModelTextController?.dispose();

    cManufactureFocusNode?.dispose();
    cManufactureTextController?.dispose();

    cLocationFocusNode?.dispose();
    cLocationTextController?.dispose();
  }
}
