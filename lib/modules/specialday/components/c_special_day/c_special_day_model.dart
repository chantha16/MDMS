import '/backend/api_requests/api_calls.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_special_day_widget.dart' show CSpecialDayWidget;
import 'package:flutter/material.dart';

class CSpecialDayModel extends FlutterFlowModel<CSpecialDayWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameTextController1;
  String? Function(BuildContext, String?)? nameTextController1Validator;
  String? _nameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ybq807tb' /* Please input name! */,
      );
    }

    return null;
  }

  // State field(s) for Name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameTextController2;
  String? Function(BuildContext, String?)? nameTextController2Validator;
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
    nameTextController1Validator = _nameTextController1Validator;
    secoundaryButtonModel1 =
        createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    secoundaryButtonModel2 =
        createModel(context, () => SecoundaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode1?.dispose();
    nameTextController1?.dispose();

    nameFocusNode2?.dispose();
    nameTextController2?.dispose();

    secoundaryButtonModel1.dispose();
    primaryButtonModel.dispose();
    secoundaryButtonModel2.dispose();
  }
}
