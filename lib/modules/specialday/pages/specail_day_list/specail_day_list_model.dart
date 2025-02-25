import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'specail_day_list_widget.dart' show SpecailDayListWidget;
import 'package:flutter/material.dart';

class SpecailDayListModel extends FlutterFlowModel<SpecailDayListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainLayout component.
  late MainLayoutModel mainLayoutModel;

  @override
  void initState(BuildContext context) {
    mainLayoutModel = createModel(context, () => MainLayoutModel());
  }

  @override
  void dispose() {
    mainLayoutModel.dispose();
  }
}
