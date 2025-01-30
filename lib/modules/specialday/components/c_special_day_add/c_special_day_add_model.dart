import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/specialday/components/item_special_day_detials/item_special_day_detials_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'c_special_day_add_widget.dart' show CSpecialDayAddWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CSpecialDayAddModel extends FlutterFlowModel<CSpecialDayAddWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NameMain widget.
  FocusNode? nameMainFocusNode;
  TextEditingController? nameMainTextController;
  String? Function(BuildContext, String?)? nameMainTextControllerValidator;
  String? _nameMainTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8v3pe8u7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DescriptionMain widget.
  FocusNode? descriptionMainFocusNode;
  TextEditingController? descriptionMainTextController;
  String? Function(BuildContext, String?)?
      descriptionMainTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (CreateSpecialDayList)] action in PrimaryButton widget.
  ApiCallResponse? apiResultCreateMain;

  @override
  void initState(BuildContext context) {
    nameMainTextControllerValidator = _nameMainTextControllerValidator;
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameMainFocusNode?.dispose();
    nameMainTextController?.dispose();

    descriptionMainFocusNode?.dispose();
    descriptionMainTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }
}
