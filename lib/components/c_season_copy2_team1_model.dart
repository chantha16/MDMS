import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/seasons/components/menuoption/menuoption_widget.dart';
import '/modules/seasons/components/search_not_found/search_not_found_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_season_copy2_team1_widget.dart' show CSeasonCopy2Team1Widget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CSeasonCopy2Team1Model extends FlutterFlowModel<CSeasonCopy2Team1Widget> {
  ///  Local state fields for this component.

  List<String> moths = [];
  void addToMoths(String item) => moths.add(item);
  void removeFromMoths(String item) => moths.remove(item);
  void removeAtIndexFromMoths(int index) => moths.removeAt(index);
  void insertAtIndexInMoths(int index, String item) =>
      moths.insert(index, item);
  void updateMothsAtIndex(int index, Function(String) updateFn) =>
      moths[index] = updateFn(moths[index]);

  int currentPage = 1;

  List<SeasonModelStruct> modelSeason = [];
  void addToModelSeason(SeasonModelStruct item) => modelSeason.add(item);
  void removeFromModelSeason(SeasonModelStruct item) =>
      modelSeason.remove(item);
  void removeAtIndexFromModelSeason(int index) => modelSeason.removeAt(index);
  void insertAtIndexInModelSeason(int index, SeasonModelStruct item) =>
      modelSeason.insert(index, item);
  void updateModelSeasonAtIndex(
          int index, Function(SeasonModelStruct) updateFn) =>
      modelSeason[index] = updateFn(modelSeason[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All Seasons)] action in cSeasonCopy2Team1 widget.
  ApiCallResponse? apiResultlbp;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Seasons)] action in TextField widget.
  ApiCallResponse? apiResult64i;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel1;
  // Model for PrimaryButtonWithIcon component.
  late PrimaryButtonWithIconModel primaryButtonWithIconModel2;

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
    textController?.dispose();

    primaryButtonWithIconModel1.dispose();
    primaryButtonWithIconModel2.dispose();
  }
}
