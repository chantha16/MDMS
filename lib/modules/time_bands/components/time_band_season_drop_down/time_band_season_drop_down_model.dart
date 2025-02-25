import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_band_season_drop_down_widget.dart'
    show TimeBandSeasonDropDownWidget;
import 'package:flutter/material.dart';

class TimeBandSeasonDropDownModel
    extends FlutterFlowModel<TimeBandSeasonDropDownWidget> {
  ///  Local state fields for this component.

  List<SeasonModelStruct> seasonModel = [];
  void addToSeasonModel(SeasonModelStruct item) => seasonModel.add(item);
  void removeFromSeasonModel(SeasonModelStruct item) =>
      seasonModel.remove(item);
  void removeAtIndexFromSeasonModel(int index) => seasonModel.removeAt(index);
  void insertAtIndexInSeasonModel(int index, SeasonModelStruct item) =>
      seasonModel.insert(index, item);
  void updateSeasonModelAtIndex(
          int index, Function(SeasonModelStruct) updateFn) =>
      seasonModel[index] = updateFn(seasonModel[index]);

  List<SeasonModelStruct> seasonModelFromAppState = [];
  void addToSeasonModelFromAppState(SeasonModelStruct item) =>
      seasonModelFromAppState.add(item);
  void removeFromSeasonModelFromAppState(SeasonModelStruct item) =>
      seasonModelFromAppState.remove(item);
  void removeAtIndexFromSeasonModelFromAppState(int index) =>
      seasonModelFromAppState.removeAt(index);
  void insertAtIndexInSeasonModelFromAppState(
          int index, SeasonModelStruct item) =>
      seasonModelFromAppState.insert(index, item);
  void updateSeasonModelFromAppStateAtIndex(
          int index, Function(SeasonModelStruct) updateFn) =>
      seasonModelFromAppState[index] = updateFn(seasonModelFromAppState[index]);

  int loopIndex = 0;

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
    ApiCallResponse? apiResultvw2;

    loading = false;
    apiResultvw2 = await SeasonGroup.readAllSeasonsCall.call(
      search: '%${searchTextTextController.text}%',
      limit: 25,
      offset: 0,
    );

    if ((apiResultvw2.succeeded ?? true)) {
      seasonModel = (getJsonField(
        (apiResultvw2.jsonBody ?? ''),
        r'''$.Season''',
        true,
      )!
              .toList()
              .map<SeasonModelStruct?>(SeasonModelStruct.maybeFromMap)
              .toList() as Iterable<SeasonModelStruct?>)
          .withoutNulls
          .toList()
          .cast<SeasonModelStruct>();
      seasonModelFromAppState = [];
      // Loop on season state to find the item of each existing season to add to seasonModelFromState list.
      //
      while (loopIndex < FFAppState().seasonState.length) {
        addToSeasonModelFromAppState(seasonModel
            .where((e) =>
                FFAppState().seasonState.elementAtOrNull(loopIndex)?.id == e.id)
            .toList()
            .firstOrNull!);
        loopIndex = loopIndex + 1;
      }
      // Set loop index to 0
      loopIndex = 0;
      while (loopIndex < seasonModelFromAppState.length) {
        removeFromSeasonModel(
            seasonModelFromAppState.elementAtOrNull(loopIndex)!);
        loopIndex = loopIndex + 1;
      }
    }
    loading = true;
  }
}
