import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'tou_details_view_widget.dart' show TouDetailsViewWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TouDetailsViewModel extends FlutterFlowModel<TouDetailsViewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameTextController1;
  String? Function(BuildContext, String?)? nameTextController1Validator;
  String? _nameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8arw5ue0' /* Input code is required! */,
      );
    }

    return null;
  }

  // State field(s) for Name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameTextController2;
  String? Function(BuildContext, String?)? nameTextController2Validator;
  String? _nameTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gtsaoxw0' /* Input name is required */,
      );
    }

    return null;
  }

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode3;
  TextEditingController? nameTextController3;
  String? Function(BuildContext, String?)? nameTextController3Validator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  @override
  void initState(BuildContext context) {
    nameTextController1Validator = _nameTextController1Validator;
    nameTextController2Validator = _nameTextController2Validator;
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode1?.dispose();
    nameTextController1?.dispose();

    nameFocusNode2?.dispose();
    nameTextController2?.dispose();

    nameFocusNode3?.dispose();
    nameTextController3?.dispose();

    primaryButtonWithIconModel.dispose();
    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }
}
