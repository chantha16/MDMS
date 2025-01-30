import '/components/system_logic/body_header/body_header_widget.dart';
import '/components/system_logic/pagenation_component/pagenation_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_action/c_action_widget.dart';
import '/modules/deviecs/components/c_custom_columns/c_custom_columns_widget.dart';
import '/modules/deviecs/components/c_sidebar/c_sidebar_widget.dart';
import 'dart:ui';
import 'device_view_widget.dart' show DeviceViewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceViewModel extends FlutterFlowModel<DeviceViewWidget> {
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
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
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
