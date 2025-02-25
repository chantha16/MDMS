// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JsonLabelStruct extends BaseStruct {
  JsonLabelStruct({
    String? phase,
    String? units,
    String? flowDirection,
    String? apportionPolicy,
  })  : _phase = phase,
        _units = units,
        _flowDirection = flowDirection,
        _apportionPolicy = apportionPolicy;

  // "Phase" field.
  String? _phase;
  String get phase => _phase ?? '';
  set phase(String? val) => _phase = val;

  bool hasPhase() => _phase != null;

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

  static JsonLabelStruct fromMap(Map<String, dynamic> data) => JsonLabelStruct(
        phase: data['Phase'] as String?,
        units: data['Units'] as String?,
        flowDirection: data['FlowDirection'] as String?,
        apportionPolicy: data['ApportionPolicy'] as String?,
      );

  static JsonLabelStruct? maybeFromMap(dynamic data) => data is Map
      ? JsonLabelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Phase': _phase,
        'Units': _units,
        'FlowDirection': _flowDirection,
        'ApportionPolicy': _apportionPolicy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Phase': serializeParam(
          _phase,
          ParamType.String,
        ),
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
      }.withoutNulls;

  static JsonLabelStruct fromSerializableMap(Map<String, dynamic> data) =>
      JsonLabelStruct(
        phase: deserializeParam(
          data['Phase'],
          ParamType.String,
          false,
        ),
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
      );

  @override
  String toString() => 'JsonLabelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JsonLabelStruct &&
        phase == other.phase &&
        units == other.units &&
        flowDirection == other.flowDirection &&
        apportionPolicy == other.apportionPolicy;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([phase, units, flowDirection, apportionPolicy]);
}

JsonLabelStruct createJsonLabelStruct({
  String? phase,
  String? units,
  String? flowDirection,
  String? apportionPolicy,
}) =>
    JsonLabelStruct(
      phase: phase,
      units: units,
      flowDirection: flowDirection,
      apportionPolicy: apportionPolicy,
    );
