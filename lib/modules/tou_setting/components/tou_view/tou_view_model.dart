import '/components/system_logic/body_header/body_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/tou_setting/components/c_status/c_status_widget.dart';
import '/modules/tou_setting/components/t_o_u_sidebar/t_o_u_sidebar_widget.dart';
import 'dart:ui';
import 'tou_view_widget.dart' show TouViewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TouViewModel extends FlutterFlowModel<TouViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BodyHeader component.
  late BodyHeaderModel bodyHeaderModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  DateTime? datePicked;
  // Model for cStatus component.
  late CStatusModel cStatusModel1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Model for cStatus component.
  late CStatusModel cStatusModel2;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // Model for cStatus component.
  late CStatusModel cStatusModel3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    bodyHeaderModel = createModel(context, () => BodyHeaderModel());
    cStatusModel1 = createModel(context, () => CStatusModel());
    cStatusModel2 = createModel(context, () => CStatusModel());
    cStatusModel3 = createModel(context, () => CStatusModel());
  }

  @override
  void dispose() {
    bodyHeaderModel.dispose();
    cStatusModel1.dispose();
    cStatusModel2.dispose();
    cStatusModel3.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
