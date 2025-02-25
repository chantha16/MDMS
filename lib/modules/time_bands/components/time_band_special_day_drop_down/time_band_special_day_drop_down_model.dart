import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_band_special_day_drop_down_widget.dart'
    show TimeBandSpecialDayDropDownWidget;
import 'package:flutter/material.dart';

class TimeBandSpecialDayDropDownModel
    extends FlutterFlowModel<TimeBandSpecialDayDropDownWidget> {
  ///  Local state fields for this component.

  int loopIndex = 0;

  List<SpecialDayModelStruct> specialDayModel = [];
  void addToSpecialDayModel(SpecialDayModelStruct item) =>
      specialDayModel.add(item);
  void removeFromSpecialDayModel(SpecialDayModelStruct item) =>
      specialDayModel.remove(item);
  void removeAtIndexFromSpecialDayModel(int index) =>
      specialDayModel.removeAt(index);
  void insertAtIndexInSpecialDayModel(int index, SpecialDayModelStruct item) =>
      specialDayModel.insert(index, item);
  void updateSpecialDayModelAtIndex(
          int index, Function(SpecialDayModelStruct) updateFn) =>
      specialDayModel[index] = updateFn(specialDayModel[index]);

  List<SpecialDayModelStruct> specialModelFromAppState = [];
  void addToSpecialModelFromAppState(SpecialDayModelStruct item) =>
      specialModelFromAppState.add(item);
  void removeFromSpecialModelFromAppState(SpecialDayModelStruct item) =>
      specialModelFromAppState.remove(item);
  void removeAtIndexFromSpecialModelFromAppState(int index) =>
      specialModelFromAppState.removeAt(index);
  void insertAtIndexInSpecialModelFromAppState(
          int index, SpecialDayModelStruct item) =>
      specialModelFromAppState.insert(index, item);
  void updateSpecialModelFromAppStateAtIndex(
          int index, Function(SpecialDayModelStruct) updateFn) =>
      specialModelFromAppState[index] =
          updateFn(specialModelFromAppState[index]);

  bool loading = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchText widget.
  FocusNode? searchTextFocusNode;
  TextEditingController? searchTextTextController;
  String? Function(BuildContext, String?)? searchTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();
  }

  /// Action blocks.
  Future search(BuildContext context) async {
    ApiCallResponse? apiResultv2;

    loading = false;
    apiResultv2 = await SpecialDayGroup.readAllSpecialDaysCall.call(
      search: '%${searchTextTextController.text}%',
      limit: 25,
      offset: 0,
    );

    if ((apiResultv2.succeeded ?? true)) {
      specialDayModel = (getJsonField(
        (apiResultv2.jsonBody ?? ''),
        r'''$.SpecialDay''',
        true,
      )!
              .toList()
              .map<SpecialDayModelStruct?>(SpecialDayModelStruct.maybeFromMap)
              .toList() as Iterable<SpecialDayModelStruct?>)
          .withoutNulls
          .toList()
          .cast<SpecialDayModelStruct>();
      specialModelFromAppState = [];
      // Loop on season state to find the item of each existing season to add to seasonModelFromState list.
      //
      while (loopIndex < FFAppState().specialDayState.length) {
        addToSpecialModelFromAppState(specialDayModel
            .where((e) =>
                FFAppState().specialDayState.elementAtOrNull(loopIndex)?.id ==
                e.id)
            .toList()
            .firstOrNull!);
        loopIndex = loopIndex + 1;
      }
      // Set loop index to 0
      loopIndex = 0;
      while (loopIndex < specialModelFromAppState.length) {
        removeFromSpecialDayModel(
            FFAppState().specialDayState.elementAtOrNull(loopIndex)!);
        loopIndex = loopIndex + 1;
      }
    }
    loading = true;
  }
}
