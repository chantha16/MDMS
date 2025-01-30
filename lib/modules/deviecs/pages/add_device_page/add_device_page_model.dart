import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/deviecs/components/c_add_device/c_add_device_widget.dart';
import 'add_device_page_widget.dart' show AddDevicePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDevicePageModel extends FlutterFlowModel<AddDevicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainLayoutV1 component.
  late MainLayoutV1Model mainLayoutV1Model;

  @override
  void initState(BuildContext context) {
    mainLayoutV1Model = createModel(context, () => MainLayoutV1Model());
  }

  @override
  void dispose() {
    mainLayoutV1Model.dispose();
  }
}
