import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'product_setting_view_widget.dart' show ProductSettingViewWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductSettingViewModel
    extends FlutterFlowModel<ProductSettingViewWidget> {
  ///  Local state fields for this component.

  String searchQuery = '';

  List<SpecialDayModelStruct> specialDayState = [];
  void addToSpecialDayState(SpecialDayModelStruct item) =>
      specialDayState.add(item);
  void removeFromSpecialDayState(SpecialDayModelStruct item) =>
      specialDayState.remove(item);
  void removeAtIndexFromSpecialDayState(int index) =>
      specialDayState.removeAt(index);
  void insertAtIndexInSpecialDayState(int index, SpecialDayModelStruct item) =>
      specialDayState.insert(index, item);
  void updateSpecialDayStateAtIndex(
          int index, Function(SpecialDayModelStruct) updateFn) =>
      specialDayState[index] = updateFn(specialDayState[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in ProductSettingView widget.
  ApiCallResponse? apiResultv1n;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in TextField widget.
  ApiCallResponse? apiResult3b4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
