import '/components/system_logic/body_header/body_header_widget.dart';
import '/components/system_logic/c_pagination/c_pagination_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_special_day_list_widget.dart' show CSpecialDayListWidget;
import 'package:flutter/material.dart';

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
