import '/components/system_logic/logo_component/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_web_widget.dart' show MenuWebWidget;
import 'package:flutter/material.dart';

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
