import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/tou_setting/components/daterange/daterange_widget.dart';
import 'c_action_log_widget.dart' show CActionLogWidget;
import 'package:flutter/material.dart';

class CActionLogModel extends FlutterFlowModel<CActionLogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for daterange component.
  late DaterangeModel daterangeModel;

  @override
  void initState(BuildContext context) {
    daterangeModel = createModel(context, () => DaterangeModel());
  }

  @override
  void dispose() {
    daterangeModel.dispose();
  }
}
