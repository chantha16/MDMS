// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupDeviceScheduleStruct extends BaseStruct {
  GroupDeviceScheduleStruct({
    List<ScheduleStruct>? deviceGroupSchedule,
  }) : _deviceGroupSchedule = deviceGroupSchedule;

  // "DeviceGroupSchedule" field.
  List<ScheduleStruct>? _deviceGroupSchedule;
  List<ScheduleStruct> get deviceGroupSchedule =>
      _deviceGroupSchedule ?? const [];
  set deviceGroupSchedule(List<ScheduleStruct>? val) =>
      _deviceGroupSchedule = val;

  void updateDeviceGroupSchedule(Function(List<ScheduleStruct>) updateFn) {
    updateFn(_deviceGroupSchedule ??= []);
  }

  bool hasDeviceGroupSchedule() => _deviceGroupSchedule != null;

  static GroupDeviceScheduleStruct fromMap(Map<String, dynamic> data) =>
      GroupDeviceScheduleStruct(
        deviceGroupSchedule: getStructList(
          data['DeviceGroupSchedule'],
          ScheduleStruct.fromMap,
        ),
      );

  static GroupDeviceScheduleStruct? maybeFromMap(dynamic data) => data is Map
      ? GroupDeviceScheduleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'DeviceGroupSchedule':
            _deviceGroupSchedule?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DeviceGroupSchedule': serializeParam(
          _deviceGroupSchedule,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GroupDeviceScheduleStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GroupDeviceScheduleStruct(
        deviceGroupSchedule: deserializeStructParam<ScheduleStruct>(
          data['DeviceGroupSchedule'],
          ParamType.DataStruct,
          true,
          structBuilder: ScheduleStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GroupDeviceScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GroupDeviceScheduleStruct &&
        listEquality.equals(deviceGroupSchedule, other.deviceGroupSchedule);
  }

  @override
  int get hashCode => const ListEquality().hash([deviceGroupSchedule]);
}

GroupDeviceScheduleStruct createGroupDeviceScheduleStruct() =>
    GroupDeviceScheduleStruct();
