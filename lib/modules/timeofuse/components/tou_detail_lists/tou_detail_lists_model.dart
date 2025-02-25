import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button_with_icon/secoundary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tou_detail_lists_widget.dart' show TouDetailListsWidget;
import 'package:flutter/material.dart';

class TouDetailListsModel extends FlutterFlowModel<TouDetailListsWidget> {
  ///  Local state fields for this component.

  List<TimeOfUseStruct> timeOfUse = [];
  void addToTimeOfUse(TimeOfUseStruct item) => timeOfUse.add(item);
  void removeFromTimeOfUse(TimeOfUseStruct item) => timeOfUse.remove(item);
  void removeAtIndexFromTimeOfUse(int index) => timeOfUse.removeAt(index);
  void insertAtIndexInTimeOfUse(int index, TimeOfUseStruct item) =>
      timeOfUse.insert(index, item);
  void updateTimeOfUseAtIndex(int index, Function(TimeOfUseStruct) updateFn) =>
      timeOfUse[index] = updateFn(timeOfUse[index]);

  int offset = 0;

  int? currentPage = 1;

  int timeOfUsePagingTotalItem = 0;

  String? searchField;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All Time Of Use)] action in TouDetailLists widget.
  ApiCallResponse? touResponse;
  // State field(s) for Textsearch widget.
  FocusNode? textsearchFocusNode;
  TextEditingController? textsearchTextController;
  String? Function(BuildContext, String?)? textsearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Time Of Use)] action in Textsearch widget.
  ApiCallResponse? apiRequestSearch;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Model for SecoundaryButtonWithIcon component.
  late SecoundaryButtonWithIconModel secoundaryButtonWithIconModel;
  // State field(s) for limit widget.
  int? limitValue;
  FormFieldController<int>? limitValueController;
  // Stores action output result for [Backend Call - API (Read All Time Of Use)] action in limit widget.
  ApiCallResponse? pagination;
  // Stores action output result for [Backend Call - API (Read All Time Of Use)] action in IconButton widget.
  ApiCallResponse? decresePaging;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in CurrentPage widget.
  ApiCallResponse? apiResultPageValidate;
  // Stores action output result for [Backend Call - API (Read All Time Of Use)] action in IconButton widget.
  ApiCallResponse? incresePaging;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
    secoundaryButtonWithIconModel =
        createModel(context, () => SecoundaryButtonWithIconModel());
  }

  @override
  void dispose() {
    textsearchFocusNode?.dispose();
    textsearchTextController?.dispose();

    primaryButtonWithIconModel.dispose();
    secoundaryButtonWithIconModel.dispose();
    currentPageFocusNode?.dispose();
    currentPageTextController?.dispose();
  }
}
