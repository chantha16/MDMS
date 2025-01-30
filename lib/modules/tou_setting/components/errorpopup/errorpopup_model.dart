import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'errorpopup_widget.dart' show ErrorpopupWidget;
import 'package:flutter/material.dart';

class ErrorpopupModel extends FlutterFlowModel<ErrorpopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  @override
  void initState(BuildContext context) {
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    primaryButtonModel.dispose();
  }
}
