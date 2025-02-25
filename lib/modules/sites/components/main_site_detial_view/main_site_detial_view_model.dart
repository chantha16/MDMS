import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_site_detial_view_widget.dart' show MainSiteDetialViewWidget;
import 'package:flutter/material.dart';

class MainSiteDetialViewModel
    extends FlutterFlowModel<MainSiteDetialViewWidget> {
  ///  Local state fields for this component.

  List<SubSiteModelStruct> sitemodel = [];
  void addToSitemodel(SubSiteModelStruct item) => sitemodel.add(item);
  void removeFromSitemodel(SubSiteModelStruct item) => sitemodel.remove(item);
  void removeAtIndexFromSitemodel(int index) => sitemodel.removeAt(index);
  void insertAtIndexInSitemodel(int index, SubSiteModelStruct item) =>
      sitemodel.insert(index, item);
  void updateSitemodelAtIndex(
          int index, Function(SubSiteModelStruct) updateFn) =>
      sitemodel[index] = updateFn(sitemodel[index]);

  List<SubSiteModelStruct> subsitemodel = [];
  void addToSubsitemodel(SubSiteModelStruct item) => subsitemodel.add(item);
  void removeFromSubsitemodel(SubSiteModelStruct item) =>
      subsitemodel.remove(item);
  void removeAtIndexFromSubsitemodel(int index) => subsitemodel.removeAt(index);
  void insertAtIndexInSubsitemodel(int index, SubSiteModelStruct item) =>
      subsitemodel.insert(index, item);
  void updateSubsitemodelAtIndex(
          int index, Function(SubSiteModelStruct) updateFn) =>
      subsitemodel[index] = updateFn(subsitemodel[index]);

  bool flaghideshow = false;

  int? sitId;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Site by ID)] action in MainSiteDetialView widget.
  ApiCallResponse? apiResultSite;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'djqquj4m' /* Field is required */,
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
  // Stores action output result for [Backend Call - API (Get Site by ID)] action in TextField widget.
  ApiCallResponse? apiResultsSearch;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (Create site)] action in PrimaryButton widget.
  ApiCallResponse? apicreatesite;
  // Stores action output result for [Backend Call - API (Update Site)] action in PrimaryButton widget.
  ApiCallResponse? apiupdatesite;
  // Stores action output result for [Backend Call - API (Delete Site)] action in PrimaryButton widget.
  ApiCallResponse? apideletesite;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    primaryButtonWithIconModel =
        createModel(context, () => PrimaryButtonWithIconModel());
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
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
    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }
}
