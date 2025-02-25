import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_band_widget.dart' show TimeBandWidget;
import 'package:flutter/material.dart';

class TimeBandModel extends FlutterFlowModel<TimeBandWidget> {
  ///  Local state fields for this component.

  List<TimeBandModelStruct> timeBandModel = [];
  void addToTimeBandModel(TimeBandModelStruct item) => timeBandModel.add(item);
  void removeFromTimeBandModel(TimeBandModelStruct item) =>
      timeBandModel.remove(item);
  void removeAtIndexFromTimeBandModel(int index) =>
      timeBandModel.removeAt(index);
  void insertAtIndexInTimeBandModel(int index, TimeBandModelStruct item) =>
      timeBandModel.insert(index, item);
  void updateTimeBandModelAtIndex(
          int index, Function(TimeBandModelStruct) updateFn) =>
      timeBandModel[index] = updateFn(timeBandModel[index]);

  int offset = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All TimeBand)] action in TimeBand widget.
  ApiCallResponse? timeBand;
  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Stores action output result for [Backend Call - API (Read All TimeBand)] action in Search widget.
  ApiCallResponse? searchTimeBand;
  // Stores action output result for [Backend Call - API (Read TimeBand by Id)] action in Row widget.
  ApiCallResponse? findID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }

  /// Action blocks.
  Future search(BuildContext context) async {
    ApiCallResponse? apiResultg4d;

    apiResultg4d = await TimeBandGroup.readAllTimeBandCall.call(
      search: '%${FFAppState().searchtext}%',
      limit: 25,
      offset: 0,
      includeTimeBandAttributes: true,
    );

    if ((apiResultg4d.succeeded ?? true)) {
      timeBandModel = (getJsonField(
        (apiResultg4d.jsonBody ?? ''),
        r'''$.TimeBand''',
        true,
      )!
              .toList()
              .map<TimeBandModelStruct?>(TimeBandModelStruct.maybeFromMap)
              .toList() as Iterable<TimeBandModelStruct?>)
          .withoutNulls
          .toList()
          .cast<TimeBandModelStruct>();
    } else {
      return;
    }
  }
}
