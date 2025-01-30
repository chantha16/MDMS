import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_custom_columns_widget.dart' show CCustomColumnsWidget;
import 'package:flutter/material.dart';

class CCustomColumnsModel extends FlutterFlowModel<CCustomColumnsWidget> {
  ///  Local state fields for this component.

  String? customCoumns;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<HeaderModelStruct, bool> checkboxValueMap = {};
  List<HeaderModelStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
