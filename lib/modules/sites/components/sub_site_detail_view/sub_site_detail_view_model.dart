import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sub_site_detail_view_widget.dart' show SubSiteDetailViewWidget;
import 'package:flutter/material.dart';

class SubSiteDetailViewModel extends FlutterFlowModel<SubSiteDetailViewWidget> {
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

  List<SubSiteModelStruct> maindropdown = [];
  void addToMaindropdown(SubSiteModelStruct item) => maindropdown.add(item);
  void removeFromMaindropdown(SubSiteModelStruct item) =>
      maindropdown.remove(item);
  void removeAtIndexFromMaindropdown(int index) => maindropdown.removeAt(index);
  void insertAtIndexInMaindropdown(int index, SubSiteModelStruct item) =>
      maindropdown.insert(index, item);
  void updateMaindropdownAtIndex(
          int index, Function(SubSiteModelStruct) updateFn) =>
      maindropdown[index] = updateFn(maindropdown[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get All SitesVTwo)] action in SubSiteDetailView widget.
  ApiCallResponse? allSite;
  // Stores action output result for [Backend Call - API (Get Site by ID)] action in SubSiteDetailView widget.
  ApiCallResponse? main;
  // Stores action output result for [Backend Call - API (Get Site by ID)] action in SubSiteDetailView widget.
  ApiCallResponse? apiResultbyId;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cyvsm3s7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (Create site)] action in PrimaryButton widget.
  ApiCallResponse? apiResultxsd;
  // Stores action output result for [Backend Call - API (Update Site)] action in PrimaryButton widget.
  ApiCallResponse? apiResult68v;
  // Stores action output result for [Backend Call - API (Delete Site)] action in PrimaryButton widget.
  ApiCallResponse? apiResultxsds;
  // Stores action output result for [Backend Call - API (Get Site by ID)] action in PrimaryButton widget.
  ApiCallResponse? allSiteRepsonse;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }
}
