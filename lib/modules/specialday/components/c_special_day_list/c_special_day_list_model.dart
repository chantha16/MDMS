import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/body_header/body_header_widget.dart';
import '/components/system_logic/c_pagination/c_pagination_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/c_activity_log_special_day/c_activity_log_special_day_widget.dart';
import '/modules/specialday/components/c_special_day_action/c_special_day_action_widget.dart';
import '/modules/specialday/components/c_special_day_detail_list/c_special_day_detail_list_widget.dart';
import 'dart:ui';
import 'c_special_day_list_widget.dart' show CSpecialDayListWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CSpecialDayListModel extends FlutterFlowModel<CSpecialDayListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BodyHeader component.
  late BodyHeaderModel bodyHeaderModel;
  // Model for cPagination component.
  late CPaginationModel cPaginationModel;

  @override
  void initState(BuildContext context) {
    bodyHeaderModel = createModel(context, () => BodyHeaderModel());
    cPaginationModel = createModel(context, () => CPaginationModel());
  }

  @override
  void dispose() {
    bodyHeaderModel.dispose();
    cPaginationModel.dispose();
  }
}
