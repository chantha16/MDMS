import '/components/system_logic/barchat_comsumption/barchat_comsumption_widget.dart';
import '/components/system_logic/com_map/com_map_widget.dart';
import '/components/system_logic/linechart_voltage/linechart_voltage_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_cos_info/c_cos_info_widget.dart';
import '/modules/deviecs/components/c_tou_info/c_tou_info_widget.dart';
import '/modules/deviecs/components/cloadprofile/cloadprofile_widget.dart';
import 'c_deviced_detail_widget.dart' show CDevicedDetailWidget;
import 'package:flutter/material.dart';

class CDevicedDetailModel extends FlutterFlowModel<CDevicedDetailWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for cCosInfo component.
  late CCosInfoModel cCosInfoModel;
  // Model for cTouInfo component.
  late CTouInfoModel cTouInfoModel;
  // Model for cloadprofile component.
  late CloadprofileModel cloadprofileModel;
  // Model for ComMap component.
  late ComMapModel comMapModel;
  // Model for BarchatComsumption component.
  late BarchatComsumptionModel barchatComsumptionModel;
  // Model for LinechartVoltage component.
  late LinechartVoltageModel linechartVoltageModel;

  @override
  void initState(BuildContext context) {
    cCosInfoModel = createModel(context, () => CCosInfoModel());
    cTouInfoModel = createModel(context, () => CTouInfoModel());
    cloadprofileModel = createModel(context, () => CloadprofileModel());
    comMapModel = createModel(context, () => ComMapModel());
    barchatComsumptionModel =
        createModel(context, () => BarchatComsumptionModel());
    linechartVoltageModel = createModel(context, () => LinechartVoltageModel());
  }

  @override
  void dispose() {
    cCosInfoModel.dispose();
    cTouInfoModel.dispose();
    cloadprofileModel.dispose();
    comMapModel.dispose();
    barchatComsumptionModel.dispose();
    linechartVoltageModel.dispose();
  }
}
