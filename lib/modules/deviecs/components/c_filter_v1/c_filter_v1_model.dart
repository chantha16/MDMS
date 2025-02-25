import '/backend/api_requests/api_calls.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_filter_v1_widget.dart' show CFilterV1Widget;
import 'package:flutter/material.dart';

class CFilterV1Model extends FlutterFlowModel<CFilterV1Widget> {
  ///  Local state fields for this component.

  List<String> phase = ['TOTAL'];
  void addToPhase(String item) => phase.add(item);
  void removeFromPhase(String item) => phase.remove(item);
  void removeAtIndexFromPhase(int index) => phase.removeAt(index);
  void insertAtIndexInPhase(int index, String item) =>
      phase.insert(index, item);
  void updatePhaseAtIndex(int index, Function(String) updateFn) =>
      phase[index] = updateFn(phase[index]);

  List<String> units = ['WH', 'VARH'];
  void addToUnits(String item) => units.add(item);
  void removeFromUnits(String item) => units.remove(item);
  void removeAtIndexFromUnits(int index) => units.removeAt(index);
  void insertAtIndexInUnits(int index, String item) =>
      units.insert(index, item);
  void updateUnitsAtIndex(int index, Function(String) updateFn) =>
      units[index] = updateFn(units[index]);

  List<String> apportionPolicy = ['SUM'];
  void addToApportionPolicy(String item) => apportionPolicy.add(item);
  void removeFromApportionPolicy(String item) => apportionPolicy.remove(item);
  void removeAtIndexFromApportionPolicy(int index) =>
      apportionPolicy.removeAt(index);
  void insertAtIndexInApportionPolicy(int index, String item) =>
      apportionPolicy.insert(index, item);
  void updateApportionPolicyAtIndex(int index, Function(String) updateFn) =>
      apportionPolicy[index] = updateFn(apportionPolicy[index]);

  List<String> flowDirection = ['RECEIVED', 'DELIVERED'];
  void addToFlowDirection(String item) => flowDirection.add(item);
  void removeFromFlowDirection(String item) => flowDirection.remove(item);
  void removeAtIndexFromFlowDirection(int index) =>
      flowDirection.removeAt(index);
  void insertAtIndexInFlowDirection(int index, String item) =>
      flowDirection.insert(index, item);
  void updateFlowDirectionAtIndex(int index, Function(String) updateFn) =>
      flowDirection[index] = updateFn(flowDirection[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read Device by Id)] action in cFilterV1 widget.
  ApiCallResponse? apiResultkuv;
  // State field(s) for Phase widget.
  List<String>? phaseValue;
  FormFieldController<List<String>>? phaseValueController;
  // State field(s) for Units widget.
  List<String>? unitsValue;
  FormFieldController<List<String>>? unitsValueController;
  // State field(s) for FlowDirection widget.
  List<String>? flowDirectionValue;
  FormFieldController<List<String>>? flowDirectionValueController;
  // State field(s) for ApportionPolicy widget.
  List<String>? apportionPolicyValue;
  FormFieldController<List<String>>? apportionPolicyValueController;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (Read Device Metrics by IdVTow)] action in PrimaryButton widget.
  ApiCallResponse? apiReadMetricsIdv1;

  @override
  void initState(BuildContext context) {
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    primaryButtonModel.dispose();
  }
}
