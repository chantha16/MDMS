import '/components/system_logic/logo_component/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'menu_web_widget.dart' show MenuWebWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuWebModel extends FlutterFlowModel<MenuWebWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for LogoComponent component.
  late LogoComponentModel logoComponentModel;

  @override
  void initState(BuildContext context) {
    logoComponentModel = createModel(context, () => LogoComponentModel());
  }

  @override
  void dispose() {
    logoComponentModel.dispose();
  }
}
