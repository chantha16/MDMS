// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AndStruct extends BaseStruct {
  AndStruct({
    TimestampStruct? timestamp,
  }) : _timestamp = timestamp;

  // "Timestamp" field.
  TimestampStruct? _timestamp;
  TimestampStruct get timestamp => _timestamp ?? TimestampStruct();
  set timestamp(TimestampStruct? val) => _timestamp = val;

  void updateTimestamp(Function(TimestampStruct) updateFn) {
    updateFn(_timestamp ??= TimestampStruct());
  }

  bool hasTimestamp() => _timestamp != null;

  static AndStruct fromMap(Map<String, dynamic> data) => AndStruct(
        timestamp: data['Timestamp'] is TimestampStruct
            ? data['Timestamp']
            : TimestampStruct.maybeFromMap(data['Timestamp']),
      );

  static AndStruct? maybeFromMap(dynamic data) =>
      data is Map ? AndStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Timestamp': _timestamp?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Timestamp': serializeParam(
          _timestamp,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AndStruct fromSerializableMap(Map<String, dynamic> data) => AndStruct(
        timestamp: deserializeStructParam(
          data['Timestamp'],
          ParamType.DataStruct,
          false,
          structBuilder: TimestampStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AndStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AndStruct && timestamp == other.timestamp;
  }

  @override
  int get hashCode => const ListEquality().hash([timestamp]);
}

AndStruct createAndStruct({
  TimestampStruct? timestamp,
}) =>
    AndStruct(
      timestamp: timestamp ?? TimestampStruct(),
    );
