import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/c_integration/c_integration_widget.dart';
import '/modules/deviecs/components/c_general_info/c_general_info_widget.dart';
import '/modules/deviecs/device_infos/device_infos_widget.dart';
import 'c_device_details_widget.dart' show CDeviceDetailsWidget;
import 'package:flutter/material.dart';

class CDeviceDetailsModel extends FlutterFlowModel<CDeviceDetailsWidget> {
  ///  Local state fields for this component.

  String? id;

  DeviceModelStruct? deviceDetail;
  void updateDeviceDetailStruct(Function(DeviceModelStruct) updateFn) {
    updateFn(deviceDetail ??= DeviceModelStruct());
  }

  int? padding = 10;

  List<ChannelStruct> dChannelModel = [];
  void addToDChannelModel(ChannelStruct item) => dChannelModel.add(item);
  void removeFromDChannelModel(ChannelStruct item) =>
      dChannelModel.remove(item);
  void removeAtIndexFromDChannelModel(int index) =>
      dChannelModel.removeAt(index);
  void insertAtIndexInDChannelModel(int index, ChannelStruct item) =>
      dChannelModel.insert(index, item);
  void updateDChannelModelAtIndex(
          int index, Function(ChannelStruct) updateFn) =>
      dChannelModel[index] = updateFn(dChannelModel[index]);

  List<DeviceAttributesStruct> dAttributesMdel = [];
  void addToDAttributesMdel(DeviceAttributesStruct item) =>
      dAttributesMdel.add(item);
  void removeFromDAttributesMdel(DeviceAttributesStruct item) =>
      dAttributesMdel.remove(item);
  void removeAtIndexFromDAttributesMdel(int index) =>
      dAttributesMdel.removeAt(index);
  void insertAtIndexInDAttributesMdel(int index, DeviceAttributesStruct item) =>
      dAttributesMdel.insert(index, item);
  void updateDAttributesMdelAtIndex(
          int index, Function(DeviceAttributesStruct) updateFn) =>
      dAttributesMdel[index] = updateFn(dAttributesMdel[index]);

  List<MetricsStruct> devicemetric = [];
  void addToDevicemetric(MetricsStruct item) => devicemetric.add(item);
  void removeFromDevicemetric(MetricsStruct item) => devicemetric.remove(item);
  void removeAtIndexFromDevicemetric(int index) => devicemetric.removeAt(index);
  void insertAtIndexInDevicemetric(int index, MetricsStruct item) =>
      devicemetric.insert(index, item);
  void updateDevicemetricAtIndex(int index, Function(MetricsStruct) updateFn) =>
      devicemetric[index] = updateFn(devicemetric[index]);

  JsonLabelStruct? jsonlable;
  void updateJsonlableStruct(Function(JsonLabelStruct) updateFn) {
    updateFn(jsonlable ??= JsonLabelStruct());
  }

  int currentpage = 1;

  int totalpagecount = 0;

  int offset = 0;

  /// for switch to UI1
  bool switchv1 = false;

  /// for switch to UI2
  bool swtichv2 = false;

  int tabbarIndex = 0;

  bool selectiontabbar = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Read Device by Id)] action in cDeviceDetails widget.
  ApiCallResponse? apiReadDevicebyId;
  // Stores action output result for [Backend Call - API (Read All Channel)] action in cDeviceDetails widget.
  ApiCallResponse? getAllChannels;
  // Stores action output result for [Backend Call - API (Read All Device Group)] action in cDeviceDetails widget.
  ApiCallResponse? apiresultgroupdevice;
  // Stores action output result for [Backend Call - API (GeocodingAPI)] action in cDeviceDetails widget.
  ApiCallResponse? apiGoogleMapCall;
  // Stores action output result for [Backend Call - API (Read All Device Group)] action in cDeviceDetails widget.
  ApiCallResponse? apiresultgroupdeviceAnd;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Stores action output result for [Backend Call - API (Link HES)] action in PrimaryButtonWithIcon widget.
  ApiCallResponse? apiLinkHes;
  // Stores action output result for [Backend Call - API (Read Device by Id)] action in PrimaryButtonWithIcon widget.
  ApiCallResponse? apiReadDevicebyIdLinkHes;
  // Model for cGeneralInfo component.
  late CGeneralInfoModel cGeneralInfoModel1;
  // Model for cIntegration component.
  late CIntegrationModel cIntegrationModel1;
  // Model for deviceInfos component.
  late DeviceInfosModel deviceInfosModel1;
  // Model for cGeneralInfo component.
  late CGeneralInfoModel cGeneralInfoModel2;
  // Model for cIntegration component.
  late CIntegrationModel cIntegrationModel2;
  // Model for deviceInfos component.
  late DeviceInfosModel deviceInfosModel2;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (Create Device)] action in PrimaryButton widget.
  ApiCallResponse? apiCreateDevice;
  // Stores action output result for [Backend Call - API (Update DeviceList)] action in PrimaryButton widget.
  ApiCallResponse? apiResultDeviceList;
  // Stores action output result for [Backend Call - API (Delete Device)] action in PrimaryButton widget.
  ApiCallResponse? apiDelete;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
    cGeneralInfoModel1 = createModel(context, () => CGeneralInfoModel());
    cIntegrationModel1 = createModel(context, () => CIntegrationModel());
    deviceInfosModel1 = createModel(context, () => DeviceInfosModel());
    cGeneralInfoModel2 = createModel(context, () => CGeneralInfoModel());
    cIntegrationModel2 = createModel(context, () => CIntegrationModel());
    deviceInfosModel2 = createModel(context, () => DeviceInfosModel());
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    cGeneralInfoModel1.cSerialNumberTextControllerValidator =
        _formTextFieldValidator1;
    cGeneralInfoModel2.cSerialNumberTextControllerValidator =
        _formTextFieldValidator2;
  }

  @override
  void dispose() {
    primaryButtonWithIconModel.dispose();
    cGeneralInfoModel1.dispose();
    cIntegrationModel1.dispose();
    deviceInfosModel1.dispose();
    cGeneralInfoModel2.dispose();
    cIntegrationModel2.dispose();
    deviceInfosModel2.dispose();
    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mxo0iz90' /* Field is required */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1dkgzw6p' /* Field is required */,
      );
    }

    return null;
  }
}
