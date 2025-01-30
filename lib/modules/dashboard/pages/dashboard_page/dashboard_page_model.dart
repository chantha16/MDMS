import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/dashboard/components/dashboard_view/dashboard_view_widget.dart';
import 'dashboard_page_widget.dart' show DashboardPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardPageModel extends FlutterFlowModel<DashboardPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainLayoutV2 component.
  late MainLayoutV2Model mainLayoutV2Model;

  @override
  void initState(BuildContext context) {
    mainLayoutV2Model = createModel(context, () => MainLayoutV2Model());
  }

  @override
  void dispose() {
    mainLayoutV2Model.dispose();
  }
}
