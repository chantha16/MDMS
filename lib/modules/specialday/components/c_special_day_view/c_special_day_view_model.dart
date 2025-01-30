import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/specialday/components/c_special_day_action/c_special_day_action_widget.dart';
import 'dart:convert';
import 'dart:ui';
import 'c_special_day_view_widget.dart' show CSpecialDayViewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CSpecialDayViewModel extends FlutterFlowModel<CSpecialDayViewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l75gjby1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (CreateSpecialDay)] action in PrimaryButton widget.
  ApiCallResponse? apiResultqcm;
  // Stores action output result for [Backend Call - API (DeleteSpecialDay)] action in PrimaryButton widget.
  ApiCallResponse? apiResultgvd;
  // Stores action output result for [Backend Call - API (UpdateSpecialDay)] action in PrimaryButton widget.
  ApiCallResponse? apiResultmm6;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel2;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
    secoundaryButtonModel1 =
        createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    secoundaryButtonModel2 =
        createModel(context, () => SecoundaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    primaryButtonWithIconModel.dispose();
    secoundaryButtonModel1.dispose();
    primaryButtonModel.dispose();
    secoundaryButtonModel2.dispose();
  }
}
