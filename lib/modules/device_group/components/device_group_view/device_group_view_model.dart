import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'device_group_view_widget.dart' show DeviceGroupViewWidget;
import 'package:flutter/material.dart';

class DeviceGroupViewModel extends FlutterFlowModel<DeviceGroupViewWidget> {
  ///  Local state fields for this component.

  int currentPage = 1;

  int deviceGroupPagingItemTotal = 0;

  List<DeviceGroupModelStruct> deviceGroupModel = [];
  void addToDeviceGroupModel(DeviceGroupModelStruct item) =>
      deviceGroupModel.add(item);
  void removeFromDeviceGroupModel(DeviceGroupModelStruct item) =>
      deviceGroupModel.remove(item);
  void removeAtIndexFromDeviceGroupModel(int index) =>
      deviceGroupModel.removeAt(index);
  void insertAtIndexInDeviceGroupModel(
          int index, DeviceGroupModelStruct item) =>
      deviceGroupModel.insert(index, item);
  void updateDeviceGroupModelAtIndex(
          int index, Function(DeviceGroupModelStruct) updateFn) =>
      deviceGroupModel[index] = updateFn(deviceGroupModel[index]);

  int totalPage = 0;

  bool loading = true;

  int offset = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txtSearch widget.
  FocusNode? txtSearchFocusNode;
  TextEditingController? txtSearchTextController;
  String? Function(BuildContext, String?)? txtSearchTextControllerValidator;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;
  // State field(s) for limit widget.
  int? limitValue;
  FormFieldController<int>? limitValueController;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel1 =
        createModel(context, () => PrimaryButtonWithIconModel());
    primaryButtonWithIconModel2 =
        createModel(context, () => PrimaryButtonWithIconModel());
  }

  @override
  void dispose() {
    txtSearchFocusNode?.dispose();
    txtSearchTextController?.dispose();

    primaryButtonWithIconModel1.dispose();
    primaryButtonWithIconModel2.dispose();
    currentPageFocusNode?.dispose();
    currentPageTextController?.dispose();
  }

  /// Action blocks.
  Future search(BuildContext context) async {
    ApiCallResponse? apiResultg4d;

    loading = false;
    apiResultg4d = await DeviceGroupGroup.readAllDeviceGroupCall.call(
      search: '%${txtSearchTextController.text}%',
      limit: limitValue,
      offset: offset,
      includeDevices: true,
    );

    if ((apiResultg4d.succeeded ?? true)) {
      deviceGroupModel = (getJsonField(
        (apiResultg4d.jsonBody ?? ''),
        r'''$.DeviceGroup''',
        true,
      )!
              .toList()
              .map<DeviceGroupModelStruct?>(DeviceGroupModelStruct.maybeFromMap)
              .toList() as Iterable<DeviceGroupModelStruct?>)
          .withoutNulls
          .toList()
          .cast<DeviceGroupModelStruct>();
      deviceGroupPagingItemTotal = getJsonField(
        (apiResultg4d.jsonBody ?? ''),
        r'''$.Paging.Item.Total''',
      );
      totalPage = functions.calulationTotalPages(
          deviceGroupPagingItemTotal, limitValue!);
    } else {
      return;
    }

    loading = true;
  }

  Future calculateOffset(BuildContext context) async {
    offset = functions.calculateOffset(currentPage, limitValue!);
  }
}
