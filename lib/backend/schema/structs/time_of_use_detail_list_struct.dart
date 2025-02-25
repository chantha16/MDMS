// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeOfUseDetailListStruct extends BaseStruct {
  TimeOfUseDetailListStruct({
    int? id,
    int? timeBandId,
    int? channelId,
    String? registerDisplayCode,
    int? priorityOrder,
    bool? active,
  })  : _id = id,
        _timeBandId = timeBandId,
        _channelId = channelId,
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

  static TimeOfUseDetailListStruct fromMap(Map<String, dynamic> data) =>
      TimeOfUseDetailListStruct(
        id: castToType<int>(data['Id']),
        timeBandId: castToType<int>(data['TimeBandId']),
        channelId: castToType<int>(data['ChannelId']),
        registerDisplayCode: data['RegisterDisplayCode'] as String?,
        priorityOrder: castToType<int>(data['PriorityOrder']),
        active: data['Active'] as bool?,
      );

  static TimeOfUseDetailListStruct? maybeFromMap(dynamic data) => data is Map
      ? TimeOfUseDetailListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'TimeBandId': _timeBandId,
        'ChannelId': _channelId,
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

  static TimeOfUseDetailListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TimeOfUseDetailListStruct(
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
  String toString() => 'TimeOfUseDetailListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeOfUseDetailListStruct &&
        id == other.id &&
        timeBandId == other.timeBandId &&
        channelId == other.channelId &&
        registerDisplayCode == other.registerDisplayCode &&
        priorityOrder == other.priorityOrder &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, timeBandId, channelId, registerDisplayCode, priorityOrder, active]);
}

TimeOfUseDetailListStruct createTimeOfUseDetailListStruct({
  int? id,
  int? timeBandId,
  int? channelId,
  String? registerDisplayCode,
  int? priorityOrder,
  bool? active,
}) =>
    TimeOfUseDetailListStruct(
      id: id,
      timeBandId: timeBandId,
      channelId: channelId,
      registerDisplayCode: registerDisplayCode,
      priorityOrder: priorityOrder,
      active: active,
    );
