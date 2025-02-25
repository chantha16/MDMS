import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/row_header/row_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'product_setting_view_widget.dart' show ProductSettingViewWidget;
import 'package:flutter/material.dart';

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

  int currentPage = 1;

  int totalPage = 1;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in ProductSettingView widget.
  ApiCallResponse? apiResultv1n;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in TextField widget.
  ApiCallResponse? apiResult3b4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in TextField widget.
  ApiCallResponse? specialDayRes;
  // Model for RowHeader component.
  late RowHeaderModel rowHeaderModel;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Read All SpecialDays)] action in DropDown widget.
  ApiCallResponse? specialDayResPageSize;
  // State field(s) for PageNumTF widget.
  FocusNode? pageNumTFFocusNode;
  TextEditingController? pageNumTFTextController;
  String? Function(BuildContext, String?)? pageNumTFTextControllerValidator;

  @override
  void initState(BuildContext context) {
    rowHeaderModel = createModel(context, () => RowHeaderModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    rowHeaderModel.dispose();
    pageNumTFFocusNode?.dispose();
    pageNumTFTextController?.dispose();
  }
}
