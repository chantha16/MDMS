import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_band_season_detail_widget.dart' show TimeBandSeasonDetailWidget;
import 'package:flutter/material.dart';

class TimeBandSeasonDetailModel
    extends FlutterFlowModel<TimeBandSeasonDetailWidget> {
  ///  Local state fields for this component.

  SeasonModelStruct? season;
  void updateSeasonStruct(Function(SeasonModelStruct) updateFn) {
    updateFn(season ??= SeasonModelStruct());
  }

  bool loading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read Season by Id)] action in TimeBandSeasonDetail widget.
  ApiCallResponse? seasonRes;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
