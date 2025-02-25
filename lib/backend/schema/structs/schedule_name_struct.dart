// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleNameStruct extends BaseStruct {
  ScheduleNameStruct({
    List<ScheduleStruct>? device,
    List<ScheduleStruct>? group,
  })  : _device = device,
        _group = group;

  // "Device" field.
  List<ScheduleStruct>? _device;
  List<ScheduleStruct> get device => _device ?? const [];
  set device(List<ScheduleStruct>? val) => _device = val;

  void updateDevice(Function(List<ScheduleStruct>) updateFn) {
    updateFn(_device ??= []);
  }

  bool hasDevice() => _device != null;

  // "Group" field.
  List<ScheduleStruct>? _group;
  List<ScheduleStruct> get group => _group ?? const [];
  set group(List<ScheduleStruct>? val) => _group = val;

  void updateGroup(Function(List<ScheduleStruct>) updateFn) {
    updateFn(_group ??= []);
  }

  bool hasGroup() => _group != null;

  static ScheduleNameStruct fromMap(Map<String, dynamic> data) =>
      ScheduleNameStruct(
        device: getStructList(
          data['Device'],
          ScheduleStruct.fromMap,
        ),
        group: getStructList(
          data['Group'],
          ScheduleStruct.fromMap,
        ),
      );

  static ScheduleNameStruct? maybeFromMap(dynamic data) => data is Map
      ? ScheduleNameStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Device': _device?.map((e) => e.toMap()).toList(),
        'Group': _group?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Device': serializeParam(
          _device,
          ParamType.DataStruct,
          isList: true,
        ),
        'Group': serializeParam(
          _group,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ScheduleNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScheduleNameStruct(
        device: deserializeStructParam<ScheduleStruct>(
          data['Device'],
          ParamType.DataStruct,
          true,
          structBuilder: ScheduleStruct.fromSerializableMap,
        ),
        group: deserializeStructParam<ScheduleStruct>(
          data['Group'],
          ParamType.DataStruct,
          true,
          structBuilder: ScheduleStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ScheduleNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ScheduleNameStruct &&
        listEquality.equals(device, other.device) &&
        listEquality.equals(group, other.group);
  }

  @override
  int get hashCode => const ListEquality().hash([device, group]);
}

ScheduleNameStruct createScheduleNameStruct() => ScheduleNameStruct();
