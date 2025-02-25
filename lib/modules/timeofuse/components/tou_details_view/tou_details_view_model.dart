import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tou_details_view_widget.dart' show TouDetailsViewWidget;
import 'package:flutter/material.dart';

class TouDetailsViewModel extends FlutterFlowModel<TouDetailsViewWidget> {
  ///  Local state fields for this component.

  bool view = false;

  TimeOfUseStruct? timeOfUse;
  void updateTimeOfUseStruct(Function(TimeOfUseStruct) updateFn) {
    updateFn(timeOfUse ??= TimeOfUseStruct());
  }

  List<TimeOfUseDetailsStruct> timeOfUseDetail = [];
  void addToTimeOfUseDetail(TimeOfUseDetailsStruct item) =>
      timeOfUseDetail.add(item);
  void removeFromTimeOfUseDetail(TimeOfUseDetailsStruct item) =>
      timeOfUseDetail.remove(item);
  void removeAtIndexFromTimeOfUseDetail(int index) =>
      timeOfUseDetail.removeAt(index);
  void insertAtIndexInTimeOfUseDetail(int index, TimeOfUseDetailsStruct item) =>
      timeOfUseDetail.insert(index, item);
  void updateTimeOfUseDetailAtIndex(
          int index, Function(TimeOfUseDetailsStruct) updateFn) =>
      timeOfUseDetail[index] = updateFn(timeOfUseDetail[index]);

  int? indexColor;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Read Time Of Use Id)] action in TouDetailsView widget.
  ApiCallResponse? tou;
  // State field(s) for Code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
  String? _codeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xdxzrr7u' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'um9qbdjj' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;
  // Stores action output result for [Backend Call - API (Create TimeOfUse)] action in PrimaryButton widget.
  ApiCallResponse? add;
  // Stores action output result for [Backend Call - API (Update TimeOfUse)] action in PrimaryButton widget.
  ApiCallResponse? update;
  // Stores action output result for [Backend Call - API (Delete Time Of Use)] action in PrimaryButton widget.
  ApiCallResponse? delete;

  @override
  void initState(BuildContext context) {
    codeTextControllerValidator = _codeTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    codeFocusNode?.dispose();
    codeTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    primaryButtonModel1.dispose();
    secoundaryButtonModel.dispose();
    primaryButtonModel2.dispose();
  }
}
