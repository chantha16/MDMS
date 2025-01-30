import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/c_pagination/c_pagination_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/c_special_day_action/c_special_day_action_widget.dart';
import 'dart:ui';
import 'c_special_day_detail_list_widget.dart' show CSpecialDayDetailListWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
