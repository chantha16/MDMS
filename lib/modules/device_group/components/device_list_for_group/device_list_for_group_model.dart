import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'device_list_for_group_widget.dart' show DeviceListForGroupWidget;
import 'package:flutter/material.dart';

class DeviceListForGroupModel
    extends FlutterFlowModel<DeviceListForGroupWidget> {
  ///  Local state fields for this component.

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

  int offset = 0;

  int currentPage = 1;

  int devicePagingItemTotal = 0;

  int totalPage = 0;

  bool loading = false;

  List<DeviceModelStruct> deviceSelete = [];
  void addToDeviceSelete(DeviceModelStruct item) => deviceSelete.add(item);
  void removeFromDeviceSelete(DeviceModelStruct item) =>
      deviceSelete.remove(item);
  void removeAtIndexFromDeviceSelete(int index) => deviceSelete.removeAt(index);
  void insertAtIndexInDeviceSelete(int index, DeviceModelStruct item) =>
      deviceSelete.insert(index, item);
  void updateDeviceSeleteAtIndex(
          int index, Function(DeviceModelStruct) updateFn) =>
      deviceSelete[index] = updateFn(deviceSelete[index]);

  bool showDeviceSelect = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for textSearch widget.
  FocusNode? textSearchFocusNode;
  TextEditingController? textSearchTextController;
  String? Function(BuildContext, String?)? textSearchTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for limit widget.
  int? limitValue;
  FormFieldController<int>? limitValueController;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  @override
  void initState(BuildContext context) {
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    textSearchFocusNode?.dispose();
    textSearchTextController?.dispose();

    currentPageFocusNode?.dispose();
    currentPageTextController?.dispose();

    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks.
  Future search(BuildContext context) async {
    ApiCallResponse? apiResultg4d;

    loading = false;
    apiResultg4d = await DevicesGroup.readDeviceFilterCall.call(
      search: '%${textSearchTextController.text}%',
      offset: offset,
      limit: limitValue,
      deviceGroupId: 0,
    );

    if ((apiResultg4d.succeeded ?? true)) {
      devicemodels = (getJsonField(
        (apiResultg4d.jsonBody ?? ''),
        r'''$.Device''',
        true,
      )!
              .toList()
              .map<DeviceModelStruct?>(DeviceModelStruct.maybeFromMap)
              .toList() as Iterable<DeviceModelStruct?>)
          .withoutNulls
          .toList()
          .cast<DeviceModelStruct>();
      devicePagingItemTotal = getJsonField(
        (apiResultg4d.jsonBody ?? ''),
        r'''$.Paging.Item.Total''',
      );
      totalPage =
          functions.calculateTotalPages(devicePagingItemTotal, limitValue!);
    } else {
      return;
    }

    loading = true;
  }

  Future calculateOffset(BuildContext context) async {
    offset = functions.calculateOffset(currentPage, limitValue!);
  }
}
