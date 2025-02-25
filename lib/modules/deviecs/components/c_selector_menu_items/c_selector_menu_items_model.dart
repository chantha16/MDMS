import '/flutter_flow/flutter_flow_util.dart';
import 'c_selector_menu_items_widget.dart' show CSelectorMenuItemsWidget;
import 'package:flutter/material.dart';

class CSelectorMenuItemsModel
    extends FlutterFlowModel<CSelectorMenuItemsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchText widget.
  FocusNode? searchTextFocusNode;
  TextEditingController? searchTextTextController;
  String? Function(BuildContext, String?)? searchTextTextControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();
  }
}
