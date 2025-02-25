import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_detail_page_widget.dart' show EventDetailPageWidget;
import 'package:flutter/material.dart';

class EventDetailPageModel extends FlutterFlowModel<EventDetailPageWidget> {
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
