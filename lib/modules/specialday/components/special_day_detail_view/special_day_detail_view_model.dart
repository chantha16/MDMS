import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'special_day_detail_view_widget.dart' show SpecialDayDetailViewWidget;
import 'package:flutter/material.dart';

class SpecialDayDetailViewModel
    extends FlutterFlowModel<SpecialDayDetailViewWidget> {
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

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (SepcialDayId)] action in SpecialDayDetailView widget.
  ApiCallResponse? apiResultSpecialDayView;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l75gjby1' /* Field is required. */,
      );
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - API (SepcialDayId)] action in TextField widget.
  ApiCallResponse? search;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (CreateSpecialDay)] action in PrimaryButton widget.
  ApiCallResponse? add;
  // Stores action output result for [Backend Call - API (DeleteSpecialDay)] action in PrimaryButton widget.
  ApiCallResponse? delete;
  // Stores action output result for [Backend Call - API (UpdateSpecialDay)] action in PrimaryButton widget.
  ApiCallResponse? update;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel2;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
    secoundaryButtonModel1 =
        createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    secoundaryButtonModel2 =
        createModel(context, () => SecoundaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    primaryButtonWithIconModel.dispose();
    secoundaryButtonModel1.dispose();
    primaryButtonModel.dispose();
    secoundaryButtonModel2.dispose();
  }
}
