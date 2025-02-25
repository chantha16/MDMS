import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'special_day_view_widget.dart' show SpecialDayViewWidget;
import 'package:flutter/material.dart';

class SpecialDayViewModel extends FlutterFlowModel<SpecialDayViewWidget> {
  ///  Local state fields for this component.

  bool? isPickStartDate;

  bool? isPickEndDate;

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

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (SpecialDayDetailId)] action in SpecialDayView widget.
  ApiCallResponse? apiResultAddSpecialDay;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '778t2g6k' /* Please input Name */,
      );
    }

    if (val.length > 200) {
      return FFLocalizations.of(context).getText(
        'z1b0wxfu' /* Input exceeds the maximum allo... */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for startdate widget.
  FocusNode? startdateFocusNode;
  TextEditingController? startdateTextController;
  String? Function(BuildContext, String?)? startdateTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for Endate widget.
  FocusNode? endateFocusNode;
  TextEditingController? endateTextController;
  String? Function(BuildContext, String?)? endateTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Stores action output result for [Backend Call - API (UpdateSpecialDayDetails)] action in PrimaryButton widget.
  ApiCallResponse? apiResult68v;
  // Stores action output result for [Backend Call - API (DeletespecialDay)] action in PrimaryButton widget.
  ApiCallResponse? apiResult7ag;
  // Stores action output result for [Backend Call - API (CreateSpecialDayDetails)] action in PrimaryButton widget.
  ApiCallResponse? apiResultCreate;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    startdateFocusNode?.dispose();
    startdateTextController?.dispose();

    endateFocusNode?.dispose();
    endateTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    secoundaryButtonModel.dispose();
    primaryButtonModel1.dispose();
    primaryButtonModel2.dispose();
  }
}
