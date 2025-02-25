import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/deviecs/components/c_google_map/c_google_map_widget.dart';
import 'device_infos_widget.dart' show DeviceInfosWidget;
import 'package:flutter/material.dart';

class DeviceInfosModel extends FlutterFlowModel<DeviceInfosWidget> {
  ///  Local state fields for this component.

  int? totalPage = 0;

  int? currentPage = 1;

  int? offset = 0;

  int tabbarindex = 0;

  bool? isloading = false;

  DateTime? startDateTime;

  DateTime? endDateTime;

  int? tabIndext = 0;

  bool? temporaryHide = false;

  List<ScheduleStruct> scheduleByDId = [];
  void addToScheduleByDId(ScheduleStruct item) => scheduleByDId.add(item);
  void removeFromScheduleByDId(ScheduleStruct item) =>
      scheduleByDId.remove(item);
  void removeAtIndexFromScheduleByDId(int index) =>
      scheduleByDId.removeAt(index);
  void insertAtIndexInScheduleByDId(int index, ScheduleStruct item) =>
      scheduleByDId.insert(index, item);
  void updateScheduleByDIdAtIndex(
          int index, Function(ScheduleStruct) updateFn) =>
      scheduleByDId[index] = updateFn(scheduleByDId[index]);

  ScheduleNameStruct? scheduleModel;
  void updateScheduleModelStruct(Function(ScheduleNameStruct) updateFn) {
    updateFn(scheduleModel ??= ScheduleNameStruct());
  }

  int loopIndex = 0;

  List<ScheduleStruct> scheduleByGroup = [];
  void addToScheduleByGroup(ScheduleStruct item) => scheduleByGroup.add(item);
  void removeFromScheduleByGroup(ScheduleStruct item) =>
      scheduleByGroup.remove(item);
  void removeAtIndexFromScheduleByGroup(int index) =>
      scheduleByGroup.removeAt(index);
  void insertAtIndexInScheduleByGroup(int index, ScheduleStruct item) =>
      scheduleByGroup.insert(index, item);
  void updateScheduleByGroupAtIndex(
          int index, Function(ScheduleStruct) updateFn) =>
      scheduleByGroup[index] = updateFn(scheduleByGroup[index]);

  int loopIndexG = 0;

  int? totalPageFromAPI;

  ///  State fields for stateful widgets in this component.

  // Model for export2.
  late PrimaryButtonWithIconModel export2Model;
  // State field(s) for ChannelTab widget.
  TabController? channelTabController;
  int get channelTabCurrentIndex =>
      channelTabController != null ? channelTabController!.index : 0;

  // Stores action output result for [Backend Call - API (Read Device Metrics by Id)] action in loadProfile2 widget.
  ApiCallResponse? apiReadMetricsIds2;
  // State field(s) for limitNum widget.
  int? limitNumValue;
  FormFieldController<int>? limitNumValueController;
  // State field(s) for getCurrentPage widget.
  FocusNode? getCurrentPageFocusNode;
  TextEditingController? getCurrentPageTextController;
  String? Function(BuildContext, String?)?
      getCurrentPageTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read Schedule by DeviceId)] action in Tab widget.
  ApiCallResponse? readScheduleByDId;
  // Stores action output result for [Backend Call - API (Read Schedule by DeviceGroup)] action in Tab widget.
  ApiCallResponse? apiGroupSchedule;
  // Stores action output result for [Backend Call - API (Update Device Schedule)] action in switchcomponent widget.
  ApiCallResponse? updateScheduleById;
  // Stores action output result for [Backend Call - API (Update Device Schedule)] action in switchcomponent widget.
  ApiCallResponse? updateScheduleByIdFalse;
  // Model for cGoogleMap component.
  late CGoogleMapModel cGoogleMapModel;
  // Model for NoDataFounded component.
  late NoDataFoundedModel noDataFoundedModel;

  @override
  void initState(BuildContext context) {
    export2Model = createModel(context, () => PrimaryButtonWithIconModel());
    cGoogleMapModel = createModel(context, () => CGoogleMapModel());
    noDataFoundedModel = createModel(context, () => NoDataFoundedModel());
  }

  @override
  void dispose() {
    export2Model.dispose();
    channelTabController?.dispose();
    getCurrentPageFocusNode?.dispose();
    getCurrentPageTextController?.dispose();

    cGoogleMapModel.dispose();
    noDataFoundedModel.dispose();
  }
}
