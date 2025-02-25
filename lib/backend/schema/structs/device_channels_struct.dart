// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceChannelsStruct extends BaseStruct {
  DeviceChannelsStruct({
    String? id,
    String? deviceId,
    int? channelId,
    bool? active,
    List<ChannelStruct>? channel,
  })  : _id = id,
        _deviceId = deviceId,
        _channelId = channelId,
        _active = active,
        _channel = channel;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "DeviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "ChannelId" field.
  int? _channelId;
  int get channelId => _channelId ?? 0;
  set channelId(int? val) => _channelId = val;

  void incrementChannelId(int amount) => channelId = channelId + amount;

  bool hasChannelId() => _channelId != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "Channel" field.
  List<ChannelStruct>? _channel;
  List<ChannelStruct> get channel => _channel ?? const [];
  set channel(List<ChannelStruct>? val) => _channel = val;

  void updateChannel(Function(List<ChannelStruct>) updateFn) {
    updateFn(_channel ??= []);
  }

  bool hasChannel() => _channel != null;

  static DeviceChannelsStruct fromMap(Map<String, dynamic> data) =>
      DeviceChannelsStruct(
        id: data['Id'] as String?,
        deviceId: data['DeviceId'] as String?,
        channelId: castToType<int>(data['ChannelId']),
        active: data['Active'] as bool?,
        channel: getStructList(
          data['Channel'],
          ChannelStruct.fromMap,
        ),
      );

  static DeviceChannelsStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceChannelsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'DeviceId': _deviceId,
        'ChannelId': _channelId,
        'Active': _active,
        'Channel': _channel?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
        'DeviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'ChannelId': serializeParam(
          _channelId,
          ParamType.int,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'Channel': serializeParam(
          _channel,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DeviceChannelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceChannelsStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeParam(
          data['DeviceId'],
          ParamType.String,
          false,
        ),
        channelId: deserializeParam(
          data['ChannelId'],
          ParamType.int,
          false,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
        channel: deserializeStructParam<ChannelStruct>(
          data['Channel'],
          ParamType.DataStruct,
          true,
          structBuilder: ChannelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeviceChannelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeviceChannelsStruct &&
        id == other.id &&
        deviceId == other.deviceId &&
        channelId == other.channelId &&
        active == other.active &&
        listEquality.equals(channel, other.channel);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, deviceId, channelId, active, channel]);
}

DeviceChannelsStruct createDeviceChannelsStruct({
  String? id,
  String? deviceId,
  int? channelId,
  bool? active,
}) =>
    DeviceChannelsStruct(
      id: id,
      deviceId: deviceId,
      channelId: channelId,
      active: active,
    );
