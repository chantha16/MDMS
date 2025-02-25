// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeOfUseDetailsStruct extends BaseStruct {
  TimeOfUseDetailsStruct({
    int? id,
    int? timeBandId,
    int? channelId,
    ChannelStruct? channel,
    TimeBandModelStruct? timeBand,
    String? registerDisplayCode,
    int? priorityOrder,
    bool? active,
  })  : _id = id,
        _timeBandId = timeBandId,
        _channelId = channelId,
        _channel = channel,
        _timeBand = timeBand,
        _registerDisplayCode = registerDisplayCode,
        _priorityOrder = priorityOrder,
        _active = active;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "TimeBandId" field.
  int? _timeBandId;
  int get timeBandId => _timeBandId ?? 0;
  set timeBandId(int? val) => _timeBandId = val;

  void incrementTimeBandId(int amount) => timeBandId = timeBandId + amount;

  bool hasTimeBandId() => _timeBandId != null;

  // "ChannelId" field.
  int? _channelId;
  int get channelId => _channelId ?? 0;
  set channelId(int? val) => _channelId = val;

  void incrementChannelId(int amount) => channelId = channelId + amount;

  bool hasChannelId() => _channelId != null;

  // "Channel" field.
  ChannelStruct? _channel;
  ChannelStruct get channel => _channel ?? ChannelStruct();
  set channel(ChannelStruct? val) => _channel = val;

  void updateChannel(Function(ChannelStruct) updateFn) {
    updateFn(_channel ??= ChannelStruct());
  }

  bool hasChannel() => _channel != null;

  // "TimeBand" field.
  TimeBandModelStruct? _timeBand;
  TimeBandModelStruct get timeBand => _timeBand ?? TimeBandModelStruct();
  set timeBand(TimeBandModelStruct? val) => _timeBand = val;

  void updateTimeBand(Function(TimeBandModelStruct) updateFn) {
    updateFn(_timeBand ??= TimeBandModelStruct());
  }

  bool hasTimeBand() => _timeBand != null;

  // "RegisterDisplayCode" field.
  String? _registerDisplayCode;
  String get registerDisplayCode => _registerDisplayCode ?? '';
  set registerDisplayCode(String? val) => _registerDisplayCode = val;

  bool hasRegisterDisplayCode() => _registerDisplayCode != null;

  // "PriorityOrder" field.
  int? _priorityOrder;
  int get priorityOrder => _priorityOrder ?? 0;
  set priorityOrder(int? val) => _priorityOrder = val;

  void incrementPriorityOrder(int amount) =>
      priorityOrder = priorityOrder + amount;

  bool hasPriorityOrder() => _priorityOrder != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static TimeOfUseDetailsStruct fromMap(Map<String, dynamic> data) =>
      TimeOfUseDetailsStruct(
        id: castToType<int>(data['Id']),
        timeBandId: castToType<int>(data['TimeBandId']),
        channelId: castToType<int>(data['ChannelId']),
        channel: data['Channel'] is ChannelStruct
            ? data['Channel']
            : ChannelStruct.maybeFromMap(data['Channel']),
        timeBand: data['TimeBand'] is TimeBandModelStruct
            ? data['TimeBand']
            : TimeBandModelStruct.maybeFromMap(data['TimeBand']),
        registerDisplayCode: data['RegisterDisplayCode'] as String?,
        priorityOrder: castToType<int>(data['PriorityOrder']),
        active: data['Active'] as bool?,
      );

  static TimeOfUseDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? TimeOfUseDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'TimeBandId': _timeBandId,
        'ChannelId': _channelId,
        'Channel': _channel?.toMap(),
        'TimeBand': _timeBand?.toMap(),
        'RegisterDisplayCode': _registerDisplayCode,
        'PriorityOrder': _priorityOrder,
        'Active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'TimeBandId': serializeParam(
          _timeBandId,
          ParamType.int,
        ),
        'ChannelId': serializeParam(
          _channelId,
          ParamType.int,
        ),
        'Channel': serializeParam(
          _channel,
          ParamType.DataStruct,
        ),
        'TimeBand': serializeParam(
          _timeBand,
          ParamType.DataStruct,
        ),
        'RegisterDisplayCode': serializeParam(
          _registerDisplayCode,
          ParamType.String,
        ),
        'PriorityOrder': serializeParam(
          _priorityOrder,
          ParamType.int,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TimeOfUseDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TimeOfUseDetailsStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        timeBandId: deserializeParam(
          data['TimeBandId'],
          ParamType.int,
          false,
        ),
        channelId: deserializeParam(
          data['ChannelId'],
          ParamType.int,
          false,
        ),
        channel: deserializeStructParam(
          data['Channel'],
          ParamType.DataStruct,
          false,
          structBuilder: ChannelStruct.fromSerializableMap,
        ),
        timeBand: deserializeStructParam(
          data['TimeBand'],
          ParamType.DataStruct,
          false,
          structBuilder: TimeBandModelStruct.fromSerializableMap,
        ),
        registerDisplayCode: deserializeParam(
          data['RegisterDisplayCode'],
          ParamType.String,
          false,
        ),
        priorityOrder: deserializeParam(
          data['PriorityOrder'],
          ParamType.int,
          false,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TimeOfUseDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeOfUseDetailsStruct &&
        id == other.id &&
        timeBandId == other.timeBandId &&
        channelId == other.channelId &&
        channel == other.channel &&
        timeBand == other.timeBand &&
        registerDisplayCode == other.registerDisplayCode &&
        priorityOrder == other.priorityOrder &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        timeBandId,
        channelId,
        channel,
        timeBand,
        registerDisplayCode,
        priorityOrder,
        active
      ]);
}

TimeOfUseDetailsStruct createTimeOfUseDetailsStruct({
  int? id,
  int? timeBandId,
  int? channelId,
  ChannelStruct? channel,
  TimeBandModelStruct? timeBand,
  String? registerDisplayCode,
  int? priorityOrder,
  bool? active,
}) =>
    TimeOfUseDetailsStruct(
      id: id,
      timeBandId: timeBandId,
      channelId: channelId,
      channel: channel ?? ChannelStruct(),
      timeBand: timeBand ?? TimeBandModelStruct(),
      registerDisplayCode: registerDisplayCode,
      priorityOrder: priorityOrder,
      active: active,
    );
