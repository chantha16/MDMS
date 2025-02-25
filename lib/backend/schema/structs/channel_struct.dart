// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChannelStruct extends BaseStruct {
  ChannelStruct({
    int? id,
    String? code,
    String? name,
    String? units,
    String? flowDirection,
    String? apportionPolicy,
    String? phase,
    bool? active,
  })  : _id = id,
        _code = code,
        _name = name,
        _units = units,
        _flowDirection = flowDirection,
        _apportionPolicy = apportionPolicy,
        _phase = phase,
        _active = active;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

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

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static ChannelStruct fromMap(Map<String, dynamic> data) => ChannelStruct(
        id: castToType<int>(data['Id']),
        code: data['Code'] as String?,
        name: data['Name'] as String?,
        units: data['Units'] as String?,
        flowDirection: data['FlowDirection'] as String?,
        apportionPolicy: data['ApportionPolicy'] as String?,
        phase: data['Phase'] as String?,
        active: data['Active'] as bool?,
      );

  static ChannelStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChannelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Code': _code,
        'Name': _name,
        'Units': _units,
        'FlowDirection': _flowDirection,
        'ApportionPolicy': _apportionPolicy,
        'Phase': _phase,
        'Active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Code': serializeParam(
          _code,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
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
        'Phase': serializeParam(
          _phase,
          ParamType.String,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChannelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChannelStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        code: deserializeParam(
          data['Code'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
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
        phase: deserializeParam(
          data['Phase'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChannelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChannelStruct &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        units == other.units &&
        flowDirection == other.flowDirection &&
        apportionPolicy == other.apportionPolicy &&
        phase == other.phase &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, code, name, units, flowDirection, apportionPolicy, phase, active]);
}

ChannelStruct createChannelStruct({
  int? id,
  String? code,
  String? name,
  String? units,
  String? flowDirection,
  String? apportionPolicy,
  String? phase,
  bool? active,
}) =>
    ChannelStruct(
      id: id,
      code: code,
      name: name,
      units: units,
      flowDirection: flowDirection,
      apportionPolicy: apportionPolicy,
      phase: phase,
      active: active,
    );
