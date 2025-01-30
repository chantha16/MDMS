import '/components/system_logic/com_map/com_map_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_action_log/c_action_log_widget.dart';
import '/modules/deviecs/components/c_cos_info/c_cos_info_widget.dart';
import '/modules/deviecs/components/c_tou_info/c_tou_info_widget.dart';
import '/modules/deviecs/components/cloadprofile/cloadprofile_widget.dart';
import 'c_sidebar_widget.dart' show CSidebarWidget;
import 'package:flutter/material.dart';

class CSidebarModel extends FlutterFlowModel<CSidebarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for cTouInfo component.
  late CTouInfoModel cTouInfoModel;
  // Model for cCosInfo component.
  late CCosInfoModel cCosInfoModel;
  // Model for ComMap component.
  late ComMapModel comMapModel;
  // Model for cloadprofile component.
  late CloadprofileModel cloadprofileModel;
  // Model for cActionLog component.
  late CActionLogModel cActionLogModel;

  @override
  void initState(BuildContext context) {
    cTouInfoModel = createModel(context, () => CTouInfoModel());
    cCosInfoModel = createModel(context, () => CCosInfoModel());
    comMapModel = createModel(context, () => ComMapModel());
    cloadprofileModel = createModel(context, () => CloadprofileModel());
    cActionLogModel = createModel(context, () => CActionLogModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    cTouInfoModel.dispose();
    cCosInfoModel.dispose();
    comMapModel.dispose();
    cloadprofileModel.dispose();
    cActionLogModel.dispose();
  }
}
