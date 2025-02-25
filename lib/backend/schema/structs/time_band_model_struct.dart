// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeBandModelStruct extends BaseStruct {
  TimeBandModelStruct({
    int? id,
    String? name,
    String? startTime,
    String? endTime,
    String? description,
    bool? active,
    int? channelId,
    List<TimeBandAttributesModelStruct>? timeBandAttributes,
  })  : _id = id,
        _name = name,
        _startTime = startTime,
        _endTime = endTime,
        _description = description,
        _active = active,
        _channelId = channelId,
        _timeBandAttributes = timeBandAttributes;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "StartTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "ChannelId" field.
  int? _channelId;
  int get channelId => _channelId ?? 0;
  set channelId(int? val) => _channelId = val;

  void incrementChannelId(int amount) => channelId = channelId + amount;

  bool hasChannelId() => _channelId != null;

  // "TimeBandAttributes" field.
  List<TimeBandAttributesModelStruct>? _timeBandAttributes;
  List<TimeBandAttributesModelStruct> get timeBandAttributes =>
      _timeBandAttributes ?? const [];
  set timeBandAttributes(List<TimeBandAttributesModelStruct>? val) =>
      _timeBandAttributes = val;

  void updateTimeBandAttributes(
      Function(List<TimeBandAttributesModelStruct>) updateFn) {
    updateFn(_timeBandAttributes ??= []);
  }

  bool hasTimeBandAttributes() => _timeBandAttributes != null;

  static TimeBandModelStruct fromMap(Map<String, dynamic> data) =>
      TimeBandModelStruct(
        id: castToType<int>(data['Id']),
        name: data['Name'] as String?,
        startTime: data['StartTime'] as String?,
        endTime: data['EndTime'] as String?,
        description: data['Description'] as String?,
        active: data['Active'] as bool?,
        channelId: castToType<int>(data['ChannelId']),
        timeBandAttributes: getStructList(
          data['TimeBandAttributes'],
          TimeBandAttributesModelStruct.fromMap,
        ),
      );

  static TimeBandModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TimeBandModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
        'StartTime': _startTime,
        'EndTime': _endTime,
        'Description': _description,
        'Active': _active,
        'ChannelId': _channelId,
        'TimeBandAttributes':
            _timeBandAttributes?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'StartTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'EndTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'ChannelId': serializeParam(
          _channelId,
          ParamType.int,
        ),
        'TimeBandAttributes': serializeParam(
          _timeBandAttributes,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TimeBandModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimeBandModelStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['StartTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['EndTime'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
        channelId: deserializeParam(
          data['ChannelId'],
          ParamType.int,
          false,
        ),
        timeBandAttributes:
            deserializeStructParam<TimeBandAttributesModelStruct>(
          data['TimeBandAttributes'],
          ParamType.DataStruct,
          true,
          structBuilder: TimeBandAttributesModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TimeBandModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TimeBandModelStruct &&
        id == other.id &&
        name == other.name &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        description == other.description &&
        active == other.active &&
        channelId == other.channelId &&
        listEquality.equals(timeBandAttributes, other.timeBandAttributes);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        startTime,
        endTime,
        description,
        active,
        channelId,
        timeBandAttributes
      ]);
}

TimeBandModelStruct createTimeBandModelStruct({
  int? id,
  String? name,
  String? startTime,
  String? endTime,
  String? description,
  bool? active,
  int? channelId,
}) =>
    TimeBandModelStruct(
      id: id,
      name: name,
      startTime: startTime,
      endTime: endTime,
      description: description,
      active: active,
      channelId: channelId,
    );
