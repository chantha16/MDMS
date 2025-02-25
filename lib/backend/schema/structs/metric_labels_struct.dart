// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetricLabelsStruct extends BaseStruct {
  MetricLabelsStruct({
    String? phase,
    String? units,
    int? channelId,
    String? flowDirection,
    String? apportionPolicy,
    String? deviceChannelId,
  })  : _phase = phase,
        _units = units,
        _channelId = channelId,
        _flowDirection = flowDirection,
        _apportionPolicy = apportionPolicy,
        _deviceChannelId = deviceChannelId;

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

  // "ChannelId" field.
  int? _channelId;
  int get channelId => _channelId ?? 0;
  set channelId(int? val) => _channelId = val;

  void incrementChannelId(int amount) => channelId = channelId + amount;

  bool hasChannelId() => _channelId != null;

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

  // "DeviceChannelId" field.
  String? _deviceChannelId;
  String get deviceChannelId => _deviceChannelId ?? '';
  set deviceChannelId(String? val) => _deviceChannelId = val;

  bool hasDeviceChannelId() => _deviceChannelId != null;

  static MetricLabelsStruct fromMap(Map<String, dynamic> data) =>
      MetricLabelsStruct(
        phase: data['Phase'] as String?,
        units: data['Units'] as String?,
        channelId: castToType<int>(data['ChannelId']),
        flowDirection: data['FlowDirection'] as String?,
        apportionPolicy: data['ApportionPolicy'] as String?,
        deviceChannelId: data['DeviceChannelId'] as String?,
      );

  static MetricLabelsStruct? maybeFromMap(dynamic data) => data is Map
      ? MetricLabelsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Phase': _phase,
        'Units': _units,
        'ChannelId': _channelId,
        'FlowDirection': _flowDirection,
        'ApportionPolicy': _apportionPolicy,
        'DeviceChannelId': _deviceChannelId,
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
        'ChannelId': serializeParam(
          _channelId,
          ParamType.int,
        ),
        'FlowDirection': serializeParam(
          _flowDirection,
          ParamType.String,
        ),
        'ApportionPolicy': serializeParam(
          _apportionPolicy,
          ParamType.String,
        ),
        'DeviceChannelId': serializeParam(
          _deviceChannelId,
          ParamType.String,
        ),
      }.withoutNulls;

  static MetricLabelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetricLabelsStruct(
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
        channelId: deserializeParam(
          data['ChannelId'],
          ParamType.int,
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
        deviceChannelId: deserializeParam(
          data['DeviceChannelId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MetricLabelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetricLabelsStruct &&
        phase == other.phase &&
        units == other.units &&
        channelId == other.channelId &&
        flowDirection == other.flowDirection &&
        apportionPolicy == other.apportionPolicy &&
        deviceChannelId == other.deviceChannelId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        phase,
        units,
        channelId,
        flowDirection,
        apportionPolicy,
        deviceChannelId
      ]);
}

MetricLabelsStruct createMetricLabelsStruct({
  String? phase,
  String? units,
  int? channelId,
  String? flowDirection,
  String? apportionPolicy,
  String? deviceChannelId,
}) =>
    MetricLabelsStruct(
      phase: phase,
      units: units,
      channelId: channelId,
      flowDirection: flowDirection,
      apportionPolicy: apportionPolicy,
      deviceChannelId: deviceChannelId,
    );
