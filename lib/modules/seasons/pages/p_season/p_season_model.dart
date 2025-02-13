import '/components/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p_season_widget.dart' show PSeasonWidget;
import 'package:flutter/material.dart';

class PSeasonModel extends FlutterFlowModel<PSeasonWidget> {
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
