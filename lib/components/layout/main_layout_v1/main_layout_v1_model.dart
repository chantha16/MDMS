import '/components/system_logic/logo_component/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_layout_v1_widget.dart' show MainLayoutV1Widget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MainLayoutV1Model extends FlutterFlowModel<MainLayoutV1Widget> {
  ///  Local state fields for this component.

  bool isDrawer = true;

  ///  State fields for stateful widgets in this component.

  // Model for LogoComponent component.
  late LogoComponentModel logoComponentModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  @override
  void initState(BuildContext context) {
    logoComponentModel = createModel(context, () => LogoComponentModel());
  }

  @override
  void dispose() {
    logoComponentModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }
}
