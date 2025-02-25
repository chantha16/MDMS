import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'site_list_view_widget.dart' show SiteListViewWidget;
import 'package:flutter/material.dart';

class SiteListViewModel extends FlutterFlowModel<SiteListViewWidget> {
  ///  Local state fields for this component.

  List<SiteModelStruct> sitemodel = [];
  void addToSitemodel(SiteModelStruct item) => sitemodel.add(item);
  void removeFromSitemodel(SiteModelStruct item) => sitemodel.remove(item);
  void removeAtIndexFromSitemodel(int index) => sitemodel.removeAt(index);
  void insertAtIndexInSitemodel(int index, SiteModelStruct item) =>
      sitemodel.insert(index, item);
  void updateSitemodelAtIndex(int index, Function(SiteModelStruct) updateFn) =>
      sitemodel[index] = updateFn(sitemodel[index]);

  int currentpage = 1;

  int offset = 0;

  String? searchfield;

  int sitetotalpaginationcount = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get All SitesVTwo)] action in SiteListView widget.
  ApiCallResponse? apiResultdim;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (Get All SitesVTwo)] action in TextField widget.
  ApiCallResponse? getapiresultsearch;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;
  // State field(s) for limit widget.
  int? limitValue;
  FormFieldController<int>? limitValueController;
  // Stores action output result for [Backend Call - API (Get All SitesVTwo)] action in limit widget.
  ApiCallResponse? apiResultPagination;
  // Stores action output result for [Backend Call - API (Get All SitesVTwo)] action in IconButton widget.
  ApiCallResponse? apiResultPrevious;
  // State field(s) for CurrentPage widget.
  FocusNode? currentPageFocusNode;
  TextEditingController? currentPageTextController;
  String? Function(BuildContext, String?)? currentPageTextControllerValidator;
  // Stores action output result for [Backend Call - API (Get All SitesVTwo)] action in CurrentPage widget.
  ApiCallResponse? apiResultInput;
  // Stores action output result for [Backend Call - API (Get All SitesVTwo)] action in IconButton widget.
  ApiCallResponse? apiResultNext;

  @override
  void initState(BuildContext context) {
    primaryButtonWithIconModel1 =
        createModel(context, () => PrimaryButtonWithIconModel());
    primaryButtonWithIconModel2 =
        createModel(context, () => PrimaryButtonWithIconModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    primaryButtonWithIconModel1.dispose();
    primaryButtonWithIconModel2.dispose();
    currentPageFocusNode?.dispose();
    currentPageTextController?.dispose();
  }
}
