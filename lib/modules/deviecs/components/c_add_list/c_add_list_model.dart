import '/flutter_flow/flutter_flow_util.dart';
import 'c_add_list_widget.dart' show CAddListWidget;
import 'package:flutter/material.dart';

class CAddListModel extends FlutterFlowModel<CAddListWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Validate Form] action in cAddList widget.
  bool? validateSpecialDayDetail;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a88r2mvv' /* Name is required */,
      );
    }

    return null;
  }

  // State field(s) for addate widget.
  FocusNode? addateFocusNode1;
  TextEditingController? addateTextController1;
  String? Function(BuildContext, String?)? addateTextController1Validator;
  String? _addateTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8jxoutpg' /* StartDate is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for addate widget.
  FocusNode? addateFocusNode2;
  TextEditingController? addateTextController2;
  String? Function(BuildContext, String?)? addateTextController2Validator;
  String? _addateTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tdmqx1ce' /* EndDate is required */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    addateTextController1Validator = _addateTextController1Validator;
    addateTextController2Validator = _addateTextController2Validator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    addateFocusNode1?.dispose();
    addateTextController1?.dispose();

    addateFocusNode2?.dispose();
    addateTextController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
