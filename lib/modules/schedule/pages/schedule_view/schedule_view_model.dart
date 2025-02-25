import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedule_view_widget.dart' show ScheduleViewWidget;
import 'package:flutter/material.dart';

class ScheduleViewModel extends FlutterFlowModel<ScheduleViewWidget> {
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
