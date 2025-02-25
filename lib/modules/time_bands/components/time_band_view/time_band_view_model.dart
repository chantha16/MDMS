import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'time_band_view_widget.dart' show TimeBandViewWidget;
import 'package:flutter/material.dart';

class TimeBandViewModel extends FlutterFlowModel<TimeBandViewWidget> {
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

  int currentPage = 1;

  int timeBandPagingItemTotal = 0;

  int totalPage = 0;

  HandleErrorStruct? handleError;
  void updateHandleErrorStruct(Function(HandleErrorStruct) updateFn) {
    updateFn(handleError ??= HandleErrorStruct());
  }

  bool loading = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txtSearch widget.
  FocusNode? txtSearchFocusNode;
  TextEditingController? txtSearchTextController;
  String? Function(BuildContext, String?)? txtSearchTextControllerValidator;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;
  // State field(s) for limit widget.
  int? limitValue;
  FormFieldController<int>? limitValueController;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel1 =
        createModel(context, () => PrimaryButtonWithIconModel());
    primaryButtonWithIconModel2 =
        createModel(context, () => PrimaryButtonWithIconModel());
  }

  @override
  void dispose() {
    txtSearchFocusNode?.dispose();
    txtSearchTextController?.dispose();

    primaryButtonWithIconModel1.dispose();
    primaryButtonWithIconModel2.dispose();
    currentPageFocusNode?.dispose();
    currentPageTextController?.dispose();
  }

  /// Action blocks.
  Future search(
    BuildContext context, {
    String? searchs,
  }) async {
    ApiCallResponse? apiResultg4d;

    loading = false;
    apiResultg4d = await TimeBandGroup.readAllTimeBandCall.call(
      search: '%${txtSearchTextController.text}%',
      limit: limitValue,
      offset: offset,
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
      timeBandPagingItemTotal = getJsonField(
        (apiResultg4d.jsonBody ?? ''),
        r'''$.Paging.Item.Total''',
      );
      totalPage =
          functions.calculateTotalPages(timeBandPagingItemTotal, limitValue!);
    } else {
      return;
    }

    loading = true;
  }

  Future calculateOffset(BuildContext context) async {
    offset = functions.calculateOffset(currentPage, limitValue!);
  }
}
