import '/components/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_band_details_widget.dart' show TimeBandDetailsWidget;
import 'package:flutter/material.dart';

class TimeBandDetailsModel extends FlutterFlowModel<TimeBandDetailsWidget> {
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
