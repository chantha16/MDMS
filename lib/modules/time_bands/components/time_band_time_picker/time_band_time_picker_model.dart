import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'time_band_time_picker_widget.dart' show TimeBandTimePickerWidget;
import 'package:flutter/material.dart';

class TimeBandTimePickerModel
    extends FlutterFlowModel<TimeBandTimePickerWidget> {
  ///  Local state fields for this component.

  int? hour = 0;

  int? minute = 0;

  int? selectedTime = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Hour widget.
  FocusNode? hourFocusNode;
  TextEditingController? hourTextController;
  String? Function(BuildContext, String?)? hourTextControllerValidator;
  // State field(s) for Minute widget.
  FocusNode? minuteFocusNode;
  TextEditingController? minuteTextController;
  String? Function(BuildContext, String?)? minuteTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    hourFocusNode?.dispose();
    hourTextController?.dispose();

    minuteFocusNode?.dispose();
    minuteTextController?.dispose();
  }
}
