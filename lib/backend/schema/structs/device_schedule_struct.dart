// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceScheduleStruct extends BaseStruct {
  DeviceScheduleStruct({
    List<ScheduleStruct>? deviceSchedule,
  }) : _deviceSchedule = deviceSchedule;

  // "DeviceSchedule" field.
  List<ScheduleStruct>? _deviceSchedule;
  List<ScheduleStruct> get deviceSchedule => _deviceSchedule ?? const [];
  set deviceSchedule(List<ScheduleStruct>? val) => _deviceSchedule = val;

  void updateDeviceSchedule(Function(List<ScheduleStruct>) updateFn) {
    updateFn(_deviceSchedule ??= []);
  }

  bool hasDeviceSchedule() => _deviceSchedule != null;

  static DeviceScheduleStruct fromMap(Map<String, dynamic> data) =>
      DeviceScheduleStruct(
        deviceSchedule: getStructList(
          data['DeviceSchedule'],
          ScheduleStruct.fromMap,
        ),
      );

  static DeviceScheduleStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceScheduleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'DeviceSchedule': _deviceSchedule?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DeviceSchedule': serializeParam(
          _deviceSchedule,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DeviceScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceScheduleStruct(
        deviceSchedule: deserializeStructParam<ScheduleStruct>(
          data['DeviceSchedule'],
          ParamType.DataStruct,
          true,
          structBuilder: ScheduleStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeviceScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeviceScheduleStruct &&
        listEquality.equals(deviceSchedule, other.deviceSchedule);
  }

  @override
  int get hashCode => const ListEquality().hash([deviceSchedule]);
}

DeviceScheduleStruct createDeviceScheduleStruct() => DeviceScheduleStruct();
