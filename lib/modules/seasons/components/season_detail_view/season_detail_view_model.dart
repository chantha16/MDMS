import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'season_detail_view_widget.dart' show SeasonDetailViewWidget;
import 'package:flutter/material.dart';

class SeasonDetailViewModel extends FlutterFlowModel<SeasonDetailViewWidget> {
  ///  Local state fields for this component.

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
  // Stores action output result for [Backend Call - API (Read Season by Id)] action in SeasonDetailView widget.
  ApiCallResponse? seasonRes;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3zalvfgk' /* Field is required. */,
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
