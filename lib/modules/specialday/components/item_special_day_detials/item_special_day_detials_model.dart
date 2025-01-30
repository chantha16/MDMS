import '/flutter_flow/flutter_flow_util.dart';
import 'item_special_day_detials_widget.dart' show ItemSpecialDayDetialsWidget;
import 'package:flutter/material.dart';

class ItemSpecialDayDetialsModel
    extends FlutterFlowModel<ItemSpecialDayDetialsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for addate widget.
  FocusNode? addateFocusNode1;
  TextEditingController? addateTextController1;
  String? Function(BuildContext, String?)? addateTextController1Validator;
  DateTime? datePicked1;
  // State field(s) for addate widget.
  FocusNode? addateFocusNode2;
  TextEditingController? addateTextController2;
  String? Function(BuildContext, String?)? addateTextController2Validator;
  DateTime? datePicked2;
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

    addateFocusNode1?.dispose();
    addateTextController1?.dispose();

    addateFocusNode2?.dispose();
    addateTextController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
