// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceGroupModelStruct extends BaseStruct {
  DeviceGroupModelStruct({
    int? id,
    String? name,
    String? description,
    bool? active,
    List<DeviceModelStruct>? devices,
  })  : _id = id,
        _name = name,
        _description = description,
        _active = active,
        _devices = devices;

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

  // "Devices" field.
  List<DeviceModelStruct>? _devices;
  List<DeviceModelStruct> get devices => _devices ?? const [];
  set devices(List<DeviceModelStruct>? val) => _devices = val;

  void updateDevices(Function(List<DeviceModelStruct>) updateFn) {
    updateFn(_devices ??= []);
  }

  bool hasDevices() => _devices != null;

  static DeviceGroupModelStruct fromMap(Map<String, dynamic> data) =>
      DeviceGroupModelStruct(
        id: castToType<int>(data['Id']),
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        active: data['Active'] as bool?,
        devices: getStructList(
          data['Devices'],
          DeviceModelStruct.fromMap,
        ),
      );

  static DeviceGroupModelStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceGroupModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
        'Description': _description,
        'Active': _active,
        'Devices': _devices?.map((e) => e.toMap()).toList(),
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
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'Devices': serializeParam(
          _devices,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DeviceGroupModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DeviceGroupModelStruct(
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
        devices: deserializeStructParam<DeviceModelStruct>(
          data['Devices'],
          ParamType.DataStruct,
          true,
          structBuilder: DeviceModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeviceGroupModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeviceGroupModelStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        active == other.active &&
        listEquality.equals(devices, other.devices);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, description, active, devices]);
}

DeviceGroupModelStruct createDeviceGroupModelStruct({
  int? id,
  String? name,
  String? description,
  bool? active,
}) =>
    DeviceGroupModelStruct(
      id: id,
      name: name,
      description: description,
      active: active,
    );
