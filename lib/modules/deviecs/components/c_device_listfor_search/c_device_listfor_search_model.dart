import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_device_listfor_search_widget.dart' show CDeviceListforSearchWidget;
import 'package:flutter/material.dart';

class CDeviceListforSearchModel
    extends FlutterFlowModel<CDeviceListforSearchWidget> {
  ///  Local state fields for this component.

  int currentpage = 1;

  int totalpagecount = 0;

  List<DeviceModelStruct> devicemodels = [];
  void addToDevicemodels(DeviceModelStruct item) => devicemodels.add(item);
  void removeFromDevicemodels(DeviceModelStruct item) =>
      devicemodels.remove(item);
  void removeAtIndexFromDevicemodels(int index) => devicemodels.removeAt(index);
  void insertAtIndexInDevicemodels(int index, DeviceModelStruct item) =>
      devicemodels.insert(index, item);
  void updateDevicemodelsAtIndex(
          int index, Function(DeviceModelStruct) updateFn) =>
      devicemodels[index] = updateFn(devicemodels[index]);

  String? search = '';

  int offset = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All Devices)] action in cDeviceListforSearch widget.
  ApiCallResponse? getalldevices;
  // State field(s) for textSearch widget.
  FocusNode? textSearchFocusNode;
  TextEditingController? textSearchTextController;
  String? Function(BuildContext, String?)? textSearchTextControllerValidator;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;
  // State field(s) for limit widget.
  int? limitValue1;
  FormFieldController<int>? limitValueController1;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in limit widget.
  ApiCallResponse? apicallalldevice;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in IconButton widget.
  ApiCallResponse? apiresultgetalldevice;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode1;
  TextEditingController? currentPageTextController1;
  String? Function(BuildContext, String?)? currentPageTextController1Validator;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in CurrentPage widget.
  ApiCallResponse? apicallforpagination;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in IconButton widget.
  ApiCallResponse? getapiresultalldevice;
  // State field(s) for TextFieldweb widget.
  FocusNode? textFieldwebFocusNode;
  TextEditingController? textFieldwebTextController;
  String? Function(BuildContext, String?)? textFieldwebTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in TextFieldweb widget.
  ApiCallResponse? apigetalldevices;
  // State field(s) for limit widget.
  int? limitValue2;
  FormFieldController<int>? limitValueController2;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in limit widget.
  ApiCallResponse? apicallalldevicem;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in IconButton widget.
  ApiCallResponse? apiresultgetalldevicem;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode2;
  TextEditingController? currentPageTextController2;
  String? Function(BuildContext, String?)? currentPageTextController2Validator;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in CurrentPage widget.
  ApiCallResponse? apicallforpaginationm;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in IconButton widget.
  ApiCallResponse? getapiresultalldevicem;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel1 =
        createModel(context, () => PrimaryButtonWithIconModel());
    primaryButtonWithIconModel2 =
        createModel(context, () => PrimaryButtonWithIconModel());
  }

  @override
  void dispose() {
    textSearchFocusNode?.dispose();
    textSearchTextController?.dispose();

    primaryButtonWithIconModel1.dispose();
    primaryButtonWithIconModel2.dispose();
    currentPageFocusNode1?.dispose();
    currentPageTextController1?.dispose();

    textFieldwebFocusNode?.dispose();
    textFieldwebTextController?.dispose();

    currentPageFocusNode2?.dispose();
    currentPageTextController2?.dispose();
  }
}
