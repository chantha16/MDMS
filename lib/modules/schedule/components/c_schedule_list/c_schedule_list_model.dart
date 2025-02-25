import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_schedule_list_widget.dart' show CScheduleListWidget;
import 'package:flutter/material.dart';

class CScheduleListModel extends FlutterFlowModel<CScheduleListWidget> {
  ///  Local state fields for this component.

  List<ScheduleStruct> scheduleModel = [];
  void addToScheduleModel(ScheduleStruct item) => scheduleModel.add(item);
  void removeFromScheduleModel(ScheduleStruct item) =>
      scheduleModel.remove(item);
  void removeAtIndexFromScheduleModel(int index) =>
      scheduleModel.removeAt(index);
  void insertAtIndexInScheduleModel(int index, ScheduleStruct item) =>
      scheduleModel.insert(index, item);
  void updateScheduleModelAtIndex(
          int index, Function(ScheduleStruct) updateFn) =>
      scheduleModel[index] = updateFn(scheduleModel[index]);

  int currentPage = 1;

  int offset = 0;

  int totalPageCount = 0;

  bool isLoading = false;

  String? search;

  DateTime? startDate;

  DateTime? endDate;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All Schedule)] action in cScheduleList widget.
  ApiCallResponse? apiTriggerSchedule;
  // State field(s) for searchSchedule widget.
  FocusNode? searchScheduleFocusNode;
  TextEditingController? searchScheduleTextController;
  String? Function(BuildContext, String?)?
      searchScheduleTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Schedule)] action in searchSchedule widget.
  ApiCallResponse? scheduleSearch;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;
  // State field(s) for limitPage widget.
  int? limitPageValue;
  FormFieldController<int>? limitPageValueController;
  // Stores action output result for [Backend Call - API (Read All Schedule)] action in limitPage widget.
  ApiCallResponse? apiLimitPage;
  // Stores action output result for [Backend Call - API (Read All Schedule)] action in ButtonPrevious widget.
  ApiCallResponse? apiButtonPrevious;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Schedule)] action in CurrentPage widget.
  ApiCallResponse? apiCurrentPage;
  // Stores action output result for [Backend Call - API (Read All Schedule)] action in ButtonNext widget.
  ApiCallResponse? apiButtonNext;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel1 =
        createModel(context, () => PrimaryButtonWithIconModel());
    primaryButtonWithIconModel2 =
        createModel(context, () => PrimaryButtonWithIconModel());
  }

  @override
  void dispose() {
    searchScheduleFocusNode?.dispose();
    searchScheduleTextController?.dispose();

    primaryButtonWithIconModel1.dispose();
    primaryButtonWithIconModel2.dispose();
    currentPageFocusNode?.dispose();
    currentPageTextController?.dispose();
  }
}
