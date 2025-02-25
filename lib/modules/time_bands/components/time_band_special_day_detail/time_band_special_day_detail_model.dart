import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_band_special_day_detail_widget.dart'
    show TimeBandSpecialDayDetailWidget;
import 'package:flutter/material.dart';

class TimeBandSpecialDayDetailModel
    extends FlutterFlowModel<TimeBandSpecialDayDetailWidget> {
  ///  Local state fields for this component.

  SpecialDayModelStruct? specialDay;
  void updateSpecialDayStruct(Function(SpecialDayModelStruct) updateFn) {
    updateFn(specialDay ??= SpecialDayModelStruct());
  }

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

  bool loading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (SepcialDayId)] action in TimeBandSpecialDayDetail widget.
  ApiCallResponse? seasonRes;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
