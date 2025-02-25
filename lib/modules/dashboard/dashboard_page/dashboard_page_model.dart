import '/backend/api_requests/api_calls.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dashboard_page_widget.dart' show DashboardPageWidget;
import 'package:flutter/material.dart';

class DashboardPageModel extends FlutterFlowModel<DashboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Introspect)] action in DashboardPage widget.
  ApiCallResponse? introspectResponse;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in DashboardPage widget.
  ApiCallResponse? refreshTokenResponse;
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
