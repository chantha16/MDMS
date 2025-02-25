import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button_with_icon/secoundary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'special_day_list_view_widget.dart' show SpecialDayListViewWidget;
import 'package:flutter/material.dart';

class SpecialDayListViewModel
    extends FlutterFlowModel<SpecialDayListViewWidget> {
  ///  Local state fields for this component.

  List<SpecialDayModelStruct> specialDay = [];
  void addToSpecialDay(SpecialDayModelStruct item) => specialDay.add(item);
  void removeFromSpecialDay(SpecialDayModelStruct item) =>
      specialDay.remove(item);
  void removeAtIndexFromSpecialDay(int index) => specialDay.removeAt(index);
  void insertAtIndexInSpecialDay(int index, SpecialDayModelStruct item) =>
      specialDay.insert(index, item);
  void updateSpecialDayAtIndex(
          int index, Function(SpecialDayModelStruct) updateFn) =>
      specialDay[index] = updateFn(specialDay[index]);

  String searchField = ' ';

  int offset = 0;

  int? currentPage = 1;

  int specialDayPagingTotalItem = 25;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in SpecialDayListView widget.
  ApiCallResponse? apiResultlkf;
  // State field(s) for SearchspecialDayStore widget.
  FocusNode? searchspecialDayStoreFocusNode;
  TextEditingController? searchspecialDayStoreTextController;
  String? Function(BuildContext, String?)?
      searchspecialDayStoreTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in SearchspecialDayStore widget.
  ApiCallResponse? apiRequestSearch;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Model for SecoundaryButtonWithIcon component.
  late SecoundaryButtonWithIconModel secoundaryButtonWithIconModel;
  // State field(s) for limit widget.
  int? limitValue;
  FormFieldController<int>? limitValueController;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in limit widget.
  ApiCallResponse? pagination;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in IconButton widget.
  ApiCallResponse? decresePaging;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in CurrentPage widget.
  ApiCallResponse? apiResultPageValidate;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in IconButton widget.
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
    searchspecialDayStoreFocusNode?.dispose();
    searchspecialDayStoreTextController?.dispose();

    primaryButtonWithIconModel.dispose();
    secoundaryButtonWithIconModel.dispose();
    currentPageFocusNode?.dispose();
    currentPageTextController?.dispose();
  }
}
