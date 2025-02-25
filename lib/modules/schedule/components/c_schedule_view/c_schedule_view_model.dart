import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_schedule_view_widget.dart' show CScheduleViewWidget;
import 'package:flutter/material.dart';

class CScheduleViewModel extends FlutterFlowModel<CScheduleViewWidget> {
  ///  Local state fields for this component.

  ScheduleStruct? scheduleDetail;
  void updateScheduleDetailStruct(Function(ScheduleStruct) updateFn) {
    updateFn(scheduleDetail ??= ScheduleStruct());
  }

  List<DeviceModelStruct> devices = [];
  void addToDevices(DeviceModelStruct item) => devices.add(item);
  void removeFromDevices(DeviceModelStruct item) => devices.remove(item);
  void removeAtIndexFromDevices(int index) => devices.removeAt(index);
  void insertAtIndexInDevices(int index, DeviceModelStruct item) =>
      devices.insert(index, item);
  void updateDevicesAtIndex(int index, Function(DeviceModelStruct) updateFn) =>
      devices[index] = updateFn(devices[index]);

  List<DeviceGroupModelStruct> deviceGroup = [];
  void addToDeviceGroup(DeviceGroupModelStruct item) => deviceGroup.add(item);
  void removeFromDeviceGroup(DeviceGroupModelStruct item) =>
      deviceGroup.remove(item);
  void removeAtIndexFromDeviceGroup(int index) => deviceGroup.removeAt(index);
  void insertAtIndexInDeviceGroup(int index, DeviceGroupModelStruct item) =>
      deviceGroup.insert(index, item);
  void updateDeviceGroupAtIndex(
          int index, Function(DeviceGroupModelStruct) updateFn) =>
      deviceGroup[index] = updateFn(deviceGroup[index]);

  List<SiteModelStruct> site = [];
  void addToSite(SiteModelStruct item) => site.add(item);
  void removeFromSite(SiteModelStruct item) => site.remove(item);
  void removeAtIndexFromSite(int index) => site.removeAt(index);
  void insertAtIndexInSite(int index, SiteModelStruct item) =>
      site.insert(index, item);
  void updateSiteAtIndex(int index, Function(SiteModelStruct) updateFn) =>
      site[index] = updateFn(site[index]);

  List<TimeOfUseStruct> timeOfUse = [];
  void addToTimeOfUse(TimeOfUseStruct item) => timeOfUse.add(item);
  void removeFromTimeOfUse(TimeOfUseStruct item) => timeOfUse.remove(item);
  void removeAtIndexFromTimeOfUse(int index) => timeOfUse.removeAt(index);
  void insertAtIndexInTimeOfUse(int index, TimeOfUseStruct item) =>
      timeOfUse.insert(index, item);
  void updateTimeOfUseAtIndex(int index, Function(TimeOfUseStruct) updateFn) =>
      timeOfUse[index] = updateFn(timeOfUse[index]);

  bool isLoading = true;

  BillingDeviceAddStruct? billingDeviceAdd;
  void updateBillingDeviceAddStruct(Function(BillingDeviceAddStruct) updateFn) {
    updateFn(billingDeviceAdd ??= BillingDeviceAddStruct());
  }

  bool scheduleType = false;

  bool interval = false;

  bool startDate = false;

  bool retryCount = false;

  bool devicee = false;

  bool devicegroupField = false;

  bool sitee = false;

  bool timeOfuse = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Read All Time Of Use)] action in cScheduleView widget.
  ApiCallResponse? timeOfUses;
  // Stores action output result for [Backend Call - API (Read All Devices)] action in cScheduleView widget.
  ApiCallResponse? device;
  // Stores action output result for [Backend Call - API (Read All Device Group)] action in cScheduleView widget.
  ApiCallResponse? devicegroup;
  // Stores action output result for [Backend Call - API (Get All Sites)] action in cScheduleView widget.
  ApiCallResponse? sites;
  // Stores action output result for [Backend Call - API (Read Schedule by Id)] action in cScheduleView widget.
  ApiCallResponse? schedule;
  // State field(s) for ScheduleType widget.
  String? scheduleTypeValue;
  FormFieldController<String>? scheduleTypeValueController;
  // State field(s) for Interval widget.
  String? intervalValue;
  FormFieldController<String>? intervalValueController;
  DateTime? datePicked;
  // State field(s) for RetryCount widget.
  FocusNode? retryCountFocusNode;
  TextEditingController? retryCountTextController;
  String? Function(BuildContext, String?)? retryCountTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Device widget.
  String? deviceValue;
  FormFieldController<String>? deviceValueController;
  // State field(s) for DeviceGroup widget.
  int? deviceGroupValue;
  FormFieldController<int>? deviceGroupValueController;
  // State field(s) for Site widget.
  int? siteValue;
  FormFieldController<int>? siteValueController;
  // State field(s) for TimeOfUse widget.
  int? timeOfUseValue;
  FormFieldController<int>? timeOfUseValueController;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for SaveDeviceGroupId.
  late PrimaryButtonModel saveDeviceGroupIdModel;
  // Model for SaveSchedule.
  late PrimaryButtonModel saveScheduleModel;
  // Stores action output result for [Backend Call - API (Create Schedule)] action in SaveSchedule widget.
  ApiCallResponse? addSchedule;
  // Stores action output result for [Backend Call - API (Update  Schedule)] action in SaveSchedule widget.
  ApiCallResponse? updateSchedule;
  // Stores action output result for [Backend Call - API (Delete Schedule)] action in SaveSchedule widget.
  ApiCallResponse? deleteSchedue;

  @override
  void initState(BuildContext context) {
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    saveDeviceGroupIdModel = createModel(context, () => PrimaryButtonModel());
    saveScheduleModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    retryCountFocusNode?.dispose();
    retryCountTextController?.dispose();

    secoundaryButtonModel.dispose();
    saveDeviceGroupIdModel.dispose();
    saveScheduleModel.dispose();
  }
}
