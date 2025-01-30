import '/components/system_logic/c_pagination/c_pagination_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_special_day_detail_list_widget.dart' show CSpecialDayDetailListWidget;
import 'package:flutter/material.dart';

class CSpecialDayDetailListModel
    extends FlutterFlowModel<CSpecialDayDetailListWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Model for cPagination component.
  late CPaginationModel cPaginationModel;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
    cPaginationModel = createModel(context, () => CPaginationModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    primaryButtonWithIconModel.dispose();
    cPaginationModel.dispose();
  }
}
