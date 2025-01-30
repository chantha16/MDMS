import '/components/custom_columns_alert/custom_columns_alert_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/deviecs/components/c_custom_columns/c_custom_columns_widget.dart';
import '/modules/events/components/more_detail_alert/more_detail_alert_widget.dart';
import '/modules/reports/components/exportoption/exportoption_widget.dart';
import 'dart:ui';
import 'event_view_widget.dart' show EventViewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventViewModel extends FlutterFlowModel<EventViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for tpMainTap widget.
  TabController? tpMainTapController;
  int get tpMainTapCurrentIndex =>
      tpMainTapController != null ? tpMainTapController!.index : 0;

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tpMainTapController?.dispose();
  }
}
