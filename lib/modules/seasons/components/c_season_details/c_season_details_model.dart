import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_season_details_widget.dart' show CSeasonDetailsWidget;
import 'package:flutter/material.dart';

class CSeasonDetailsModel extends FlutterFlowModel<CSeasonDetailsWidget> {
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

  SeasonModelStruct? seasonModel;
  void updateSeasonModelStruct(Function(SeasonModelStruct) updateFn) {
    updateFn(seasonModel ??= SeasonModelStruct());
  }

  bool chipchoice = true;

  HandleErrorStruct? handleError;
  void updateHandleErrorStruct(Function(HandleErrorStruct) updateFn) {
    updateFn(handleError ??= HandleErrorStruct());
  }

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Read Season by Id)] action in cSeasonDetails widget.
  ApiCallResponse? seasonRes;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0vl2nbpm' /* Please input name! */,
      );
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (Create Season)] action in PrimaryButton widget.
  ApiCallResponse? apiResultxsd;
  // Stores action output result for [Backend Call - API (Update Season)] action in PrimaryButton widget.
  ApiCallResponse? apiResult68v;
  // Stores action output result for [Backend Call - API (Delete Season)] action in PrimaryButton widget.
  ApiCallResponse? apiResultxsds;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }
}
