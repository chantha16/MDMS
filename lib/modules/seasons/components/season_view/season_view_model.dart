import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'season_view_widget.dart' show SeasonViewWidget;
import 'package:flutter/material.dart';

class SeasonViewModel extends FlutterFlowModel<SeasonViewWidget> {
  ///  Local state fields for this component.

  List<String> moths = [];
  void addToMoths(String item) => moths.add(item);
  void removeFromMoths(String item) => moths.remove(item);
  void removeAtIndexFromMoths(int index) => moths.removeAt(index);
  void insertAtIndexInMoths(int index, String item) =>
      moths.insert(index, item);
  void updateMothsAtIndex(int index, Function(String) updateFn) =>
      moths[index] = updateFn(moths[index]);

  int currentPage = 1;

  List<SeasonModelStruct> seasonModel = [];
  void addToSeasonModel(SeasonModelStruct item) => seasonModel.add(item);
  void removeFromSeasonModel(SeasonModelStruct item) =>
      seasonModel.remove(item);
  void removeAtIndexFromSeasonModel(int index) => seasonModel.removeAt(index);
  void insertAtIndexInSeasonModel(int index, SeasonModelStruct item) =>
      seasonModel.insert(index, item);
  void updateSeasonModelAtIndex(
          int index, Function(SeasonModelStruct) updateFn) =>
      seasonModel[index] = updateFn(seasonModel[index]);

  int seasonPagingItemTotal = 0;

  int offset = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All Seasons)] action in SeasonView widget.
  ApiCallResponse? seasonRes1;
  // State field(s) for txtSearch widget.
  FocusNode? txtSearchFocusNode;
  TextEditingController? txtSearchTextController;
  String? Function(BuildContext, String?)? txtSearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Seasons)] action in txtSearch widget.
  ApiCallResponse? seasonResCopy;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;
  // State field(s) for limit widget.
  int? limitValue;
  FormFieldController<int>? limitValueController;
  // Stores action output result for [Backend Call - API (Read All Seasons)] action in limit widget.
  ApiCallResponse? seasonRes6;
  // Stores action output result for [Backend Call - API (Read All Seasons)] action in IconButton widget.
  ApiCallResponse? seasonRes4;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Seasons)] action in CurrentPage widget.
  ApiCallResponse? seasonRes3;
  // Stores action output result for [Backend Call - API (Read All Seasons)] action in IconButton widget.
  ApiCallResponse? seasonRes5;

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
}
