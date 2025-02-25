import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'special_day_side_bar_widget.dart' show SpecialDaySideBarWidget;
import 'package:flutter/material.dart';

class SpecialDaySideBarModel extends FlutterFlowModel<SpecialDaySideBarWidget> {
  ///  Local state fields for this component.

  List<SpecialDayDetailsModelStruct> specialDayDetail = [];
  void addToSpecialDayDetail(SpecialDayDetailsModelStruct item) =>
      specialDayDetail.add(item);
  void removeFromSpecialDayDetail(SpecialDayDetailsModelStruct item) =>
      specialDayDetail.remove(item);
  void removeAtIndexFromSpecialDayDetail(int index) =>
      specialDayDetail.removeAt(index);
  void insertAtIndexInSpecialDayDetail(
          int index, SpecialDayDetailsModelStruct item) =>
      specialDayDetail.insert(index, item);
  void updateSpecialDayDetailAtIndex(
          int index, Function(SpecialDayDetailsModelStruct) updateFn) =>
      specialDayDetail[index] = updateFn(specialDayDetail[index]);

  SpecialDayModelStruct? specailDay;
  void updateSpecailDayStruct(Function(SpecialDayModelStruct) updateFn) {
    updateFn(specailDay ??= SpecialDayModelStruct());
  }

  bool? isLoading;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (SepcialDayId)] action in SpecialDaySideBar widget.
  ApiCallResponse? apiResultSpecialDaySideBarView;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (SepcialDayId)] action in TextField widget.
  ApiCallResponse? searchTabar;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    primaryButtonWithIconModel.dispose();
  }
}
