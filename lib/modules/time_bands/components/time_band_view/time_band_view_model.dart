import '/components/system_logic/body_header/body_header_widget.dart';
import '/components/system_logic/pagenation_component/pagenation_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'time_band_view_widget.dart' show TimeBandViewWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeBandViewModel extends FlutterFlowModel<TimeBandViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BodyHeader component.
  late BodyHeaderModel bodyHeaderModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Model for PagenationComponent component.
  late PagenationComponentModel pagenationComponentModel;

  @override
  void initState(BuildContext context) {
    bodyHeaderModel = createModel(context, () => BodyHeaderModel());
    pagenationComponentModel =
        createModel(context, () => PagenationComponentModel());
  }

  @override
  void dispose() {
    bodyHeaderModel.dispose();
    pagenationComponentModel.dispose();
  }
}
