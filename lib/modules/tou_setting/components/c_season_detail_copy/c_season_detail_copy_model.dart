import '/backend/api_requests/api_calls.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_season_detail_copy_widget.dart' show CSeasonDetailCopyWidget;
import 'package:flutter/material.dart';

class CSeasonDetailCopyModel extends FlutterFlowModel<CSeasonDetailCopyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jzj13bka' /* Please input name! */,
      );
    }

    return null;
  }

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Stores action output result for [Backend Call - API (Create Season)] action in PrimaryButton widget.
  ApiCallResponse? apiResultp7h;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel2;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;
  // Stores action output result for [Backend Call - API (Update Season)] action in PrimaryButton widget.
  ApiCallResponse? apiResultrn9;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel3;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    secoundaryButtonModel1 =
        createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    secoundaryButtonModel2 =
        createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel3 = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    secoundaryButtonModel1.dispose();
    primaryButtonModel1.dispose();
    secoundaryButtonModel2.dispose();
    primaryButtonModel2.dispose();
    primaryButtonModel3.dispose();
  }
}
