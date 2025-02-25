import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_device_group_detial_view_widget.dart'
    show MainDeviceGroupDetialViewWidget;
import 'package:flutter/material.dart';

class MainDeviceGroupDetialViewModel
    extends FlutterFlowModel<MainDeviceGroupDetialViewWidget> {
  ///  Local state fields for this component.

  DeviceGroupModelStruct? deviceGroupModel;
  void updateDeviceGroupModelStruct(Function(DeviceGroupModelStruct) updateFn) {
    updateFn(deviceGroupModel ??= DeviceGroupModelStruct());
  }

  HandleErrorStruct? handleError;
  void updateHandleErrorStruct(Function(HandleErrorStruct) updateFn) {
    updateFn(handleError ??= HandleErrorStruct());
  }

  int devicePagingItemTotal = 0;

  int currentPage = 1;

  int offset = 0;

  int totalPage = 1;

  bool loadingDevices = true;

  List<DeviceModelStruct> deleteExistedDeviceIds = [];
  void addToDeleteExistedDeviceIds(DeviceModelStruct item) =>
      deleteExistedDeviceIds.add(item);
  void removeFromDeleteExistedDeviceIds(DeviceModelStruct item) =>
      deleteExistedDeviceIds.remove(item);
  void removeAtIndexFromDeleteExistedDeviceIds(int index) =>
      deleteExistedDeviceIds.removeAt(index);
  void insertAtIndexInDeleteExistedDeviceIds(
          int index, DeviceModelStruct item) =>
      deleteExistedDeviceIds.insert(index, item);
  void updateDeleteExistedDeviceIdsAtIndex(
          int index, Function(DeviceModelStruct) updateFn) =>
      deleteExistedDeviceIds[index] = updateFn(deleteExistedDeviceIds[index]);

  List<DeviceModelStruct> deviceSelected = [];
  void addToDeviceSelected(DeviceModelStruct item) => deviceSelected.add(item);
  void removeFromDeviceSelected(DeviceModelStruct item) =>
      deviceSelected.remove(item);
  void removeAtIndexFromDeviceSelected(int index) =>
      deviceSelected.removeAt(index);
  void insertAtIndexInDeviceSelected(int index, DeviceModelStruct item) =>
      deviceSelected.insert(index, item);
  void updateDeviceSelectedAtIndex(
          int index, Function(DeviceModelStruct) updateFn) =>
      deviceSelected[index] = updateFn(deviceSelected[index]);

  List<DeviceModelStruct> devicesForRender = [];
  void addToDevicesForRender(DeviceModelStruct item) =>
      devicesForRender.add(item);
  void removeFromDevicesForRender(DeviceModelStruct item) =>
      devicesForRender.remove(item);
  void removeAtIndexFromDevicesForRender(int index) =>
      devicesForRender.removeAt(index);
  void insertAtIndexInDevicesForRender(int index, DeviceModelStruct item) =>
      devicesForRender.insert(index, item);
  void updateDevicesForRenderAtIndex(
          int index, Function(DeviceModelStruct) updateFn) =>
      devicesForRender[index] = updateFn(devicesForRender[index]);

  List<DeviceModelStruct> devicesForRenderFilter = [];
  void addToDevicesForRenderFilter(DeviceModelStruct item) =>
      devicesForRenderFilter.add(item);
  void removeFromDevicesForRenderFilter(DeviceModelStruct item) =>
      devicesForRenderFilter.remove(item);
  void removeAtIndexFromDevicesForRenderFilter(int index) =>
      devicesForRenderFilter.removeAt(index);
  void insertAtIndexInDevicesForRenderFilter(
          int index, DeviceModelStruct item) =>
      devicesForRenderFilter.insert(index, item);
  void updateDevicesForRenderFilterAtIndex(
          int index, Function(DeviceModelStruct) updateFn) =>
      devicesForRenderFilter[index] = updateFn(devicesForRenderFilter[index]);

  List<ScheduleStruct> schedulesModel = [];
  void addToSchedulesModel(ScheduleStruct item) => schedulesModel.add(item);
  void removeFromSchedulesModel(ScheduleStruct item) =>
      schedulesModel.remove(item);
  void removeAtIndexFromSchedulesModel(int index) =>
      schedulesModel.removeAt(index);
  void insertAtIndexInSchedulesModel(int index, ScheduleStruct item) =>
      schedulesModel.insert(index, item);
  void updateSchedulesModelAtIndex(
          int index, Function(ScheduleStruct) updateFn) =>
      schedulesModel[index] = updateFn(schedulesModel[index]);

  bool loadingSchedule = true;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Read Device Group by Id)] action in MainDeviceGroupDetialView widget.
  ApiCallResponse? deviceGroupResult;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hcr13xdv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DeviceGroupViewData widget.
  TabController? deviceGroupViewDataController;
  int get deviceGroupViewDataCurrentIndex =>
      deviceGroupViewDataController != null
          ? deviceGroupViewDataController!.index
          : 0;

  // State field(s) for textSearch widget.
  FocusNode? textSearchFocusNode1;
  TextEditingController? textSearchTextController1;
  String? Function(BuildContext, String?)? textSearchTextController1Validator;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // State field(s) for limit widget.
  int? limitValue1;
  FormFieldController<int>? limitValueController1;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode1;
  TextEditingController? currentPageTextController1;
  String? Function(BuildContext, String?)? currentPageTextController1Validator;
  // State field(s) for textSearch widget.
  FocusNode? textSearchFocusNode2;
  TextEditingController? textSearchTextController2;
  String? Function(BuildContext, String?)? textSearchTextController2Validator;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;
  // State field(s) for limit widget.
  int? limitValue2;
  FormFieldController<int>? limitValueController2;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode2;
  TextEditingController? currentPageTextController2;
  String? Function(BuildContext, String?)? currentPageTextController2Validator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (Create Device Group)] action in PrimaryButton widget.
  ApiCallResponse? apiResultAdd;
  // Stores action output result for [Backend Call - API (Update Device Group)] action in PrimaryButton widget.
  ApiCallResponse? apiResultUpdate;
  // Stores action output result for [Backend Call - API (Delete Device Group)] action in PrimaryButton widget.
  ApiCallResponse? apiResultDelete;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    primaryButtonWithIconModel1 =
        createModel(context, () => PrimaryButtonWithIconModel());
    primaryButtonWithIconModel2 =
        createModel(context, () => PrimaryButtonWithIconModel());
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    deviceGroupViewDataController?.dispose();
    textSearchFocusNode1?.dispose();
    textSearchTextController1?.dispose();

    primaryButtonWithIconModel1.dispose();
    currentPageFocusNode1?.dispose();
    currentPageTextController1?.dispose();

    textSearchFocusNode2?.dispose();
    textSearchTextController2?.dispose();

    primaryButtonWithIconModel2.dispose();
    currentPageFocusNode2?.dispose();
    currentPageTextController2?.dispose();

    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks.
  Future searchDevice(BuildContext context) async {
    devicesForRenderFilter = (getJsonField(
      functions.filterAndPaginateDevices(devicesForRender.toList(),
          textSearchTextController1.text, limitValue1!, offset),
      r'''$.Devices''',
      true,
    )!
            .toList()
            .map<DeviceModelStruct?>(DeviceModelStruct.maybeFromMap)
            .toList() as Iterable<DeviceModelStruct?>)
        .withoutNulls
        .toList()
        .cast<DeviceModelStruct>();
    devicePagingItemTotal = getJsonField(
      functions.filterAndPaginateDevices(devicesForRender.toList(),
          textSearchTextController1.text, limitValue1!, offset),
      r'''$.TotalItems''',
    );
    totalPage =
        functions.calculateTotalPages(devicePagingItemTotal, limitValue1!);
  }

  Future calculateOffset(BuildContext context) async {
    offset = functions.calculateOffset(currentPage, limitValue1!);
  }

  Future searchScheclue(BuildContext context) async {
    ApiCallResponse? apiResultyShcheduleForDeviceG;

    apiResultyShcheduleForDeviceG =
        await ScheduleGroup.readScheduleByDeviceGroupCall.call(
      id: widget!.deviceGroupId,
    );

    if ((apiResultyShcheduleForDeviceG.succeeded ?? true)) {
      schedulesModel = (getJsonField(
        (apiResultyShcheduleForDeviceG.jsonBody ?? ''),
        r'''$.Schedule''',
        true,
      )!
              .toList()
              .map<ScheduleStruct?>(ScheduleStruct.maybeFromMap)
              .toList() as Iterable<ScheduleStruct?>)
          .withoutNulls
          .toList()
          .cast<ScheduleStruct>();
    }
  }
}
