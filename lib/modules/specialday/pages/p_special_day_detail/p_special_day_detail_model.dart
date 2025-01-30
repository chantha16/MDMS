import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/specialday/components/c_special_day_detail/c_special_day_detail_widget.dart';
import 'p_special_day_detail_widget.dart' show PSpecialDayDetailWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PSpecialDayDetailModel extends FlutterFlowModel<PSpecialDayDetailWidget> {
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
