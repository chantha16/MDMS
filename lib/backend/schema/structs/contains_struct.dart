// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContainsStruct extends BaseStruct {
  ContainsStruct({
    String? units,
    String? flowDirection,
    String? apportionPolicy,
    String? phase,
  })  : _units = units,
        _flowDirection = flowDirection,
        _apportionPolicy = apportionPolicy,
        _phase = phase;

  // "Units" field.
  String? _units;
  String get units => _units ?? '';
  set units(String? val) => _units = val;

  bool hasUnits() => _units != null;

  // "FlowDirection" field.
  String? _flowDirection;
  String get flowDirection => _flowDirection ?? '';
  set flowDirection(String? val) => _flowDirection = val;

  bool hasFlowDirection() => _flowDirection != null;

  // "ApportionPolicy" field.
  String? _apportionPolicy;
  String get apportionPolicy => _apportionPolicy ?? '';
  set apportionPolicy(String? val) => _apportionPolicy = val;

  bool hasApportionPolicy() => _apportionPolicy != null;

  // "Phase" field.
  String? _phase;
  String get phase => _phase ?? '';
  set phase(String? val) => _phase = val;

  bool hasPhase() => _phase != null;

  static ContainsStruct fromMap(Map<String, dynamic> data) => ContainsStruct(
        units: data['Units'] as String?,
        flowDirection: data['FlowDirection'] as String?,
        apportionPolicy: data['ApportionPolicy'] as String?,
        phase: data['Phase'] as String?,
      );

  static ContainsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContainsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Units': _units,
        'FlowDirection': _flowDirection,
        'ApportionPolicy': _apportionPolicy,
        'Phase': _phase,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Units': serializeParam(
          _units,
          ParamType.String,
        ),
        'FlowDirection': serializeParam(
          _flowDirection,
          ParamType.String,
        ),
        'ApportionPolicy': serializeParam(
          _apportionPolicy,
          ParamType.String,
        ),
        'Phase': serializeParam(
          _phase,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContainsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContainsStruct(
        units: deserializeParam(
          data['Units'],
          ParamType.String,
          false,
        ),
        flowDirection: deserializeParam(
          data['FlowDirection'],
          ParamType.String,
          false,
        ),
        apportionPolicy: deserializeParam(
          data['ApportionPolicy'],
          ParamType.String,
          false,
        ),
        phase: deserializeParam(
          data['Phase'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContainsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContainsStruct &&
        units == other.units &&
        flowDirection == other.flowDirection &&
        apportionPolicy == other.apportionPolicy &&
        phase == other.phase;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([units, flowDirection, apportionPolicy, phase]);
}

ContainsStruct createContainsStruct({
  String? units,
  String? flowDirection,
  String? apportionPolicy,
  String? phase,
}) =>
    ContainsStruct(
      units: units,
      flowDirection: flowDirection,
      apportionPolicy: apportionPolicy,
      phase: phase,
    );
