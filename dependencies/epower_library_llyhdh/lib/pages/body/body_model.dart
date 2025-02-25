import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/cutomization/body_header/body_header_widget.dart';
import '/cutomization/pagination_panel/pagination_panel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'body_widget.dart' show BodyWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BodyModel extends FlutterFlowModel<BodyWidget> {
  ///  Local state fields for this component.

  bool onSearch = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetSeasons)] action in Body widget.
  ApiCallResponse? apiResultwhh;
  // Model for BodyHeader component.
  late BodyHeaderModel bodyHeaderModel;
  // Stores action output result for [Backend Call - API (GetSeasons)] action in BodyHeader widget.
  ApiCallResponse? searchResponse;
  // Model for PaginationPanel component.
  late PaginationPanelModel paginationPanelModel;
  // Stores action output result for [Backend Call - API (GetSeasons)] action in PaginationPanel widget.
  ApiCallResponse? pagingResponse;
  // Stores action output result for [Backend Call - API (GetSeasons)] action in PaginationPanel widget.
  ApiCallResponse? searchPagingResponse;
  // Stores action output result for [Backend Call - API (GetSeasons)] action in PaginationPanel widget.
  ApiCallResponse? prevouisPageResponse;
  // Stores action output result for [Backend Call - API (GetSeasons)] action in PaginationPanel widget.
  ApiCallResponse? nextPageResponse;

  @override
  void initState(BuildContext context) {
    bodyHeaderModel = createModel(context, () => BodyHeaderModel());
    paginationPanelModel = createModel(context, () => PaginationPanelModel());
  }

  @override
  void dispose() {
    bodyHeaderModel.dispose();
    paginationPanelModel.dispose();
  }
}
