// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceAttributesStruct extends BaseStruct {
  DeviceAttributesStruct({
    String? id,
    String? deviceId,
    String? name,
    String? value,
  })  : _id = id,
        _deviceId = deviceId,
        _name = name,
        _value = value;

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

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static DeviceAttributesStruct fromMap(Map<String, dynamic> data) =>
      DeviceAttributesStruct(
        id: data['Id'] as String?,
        deviceId: data['DeviceId'] as String?,
        name: data['Name'] as String?,
        value: data['Value'] as String?,
      );

  static DeviceAttributesStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceAttributesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'DeviceId': _deviceId,
        'Name': _name,
        'Value': _value,
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
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeviceAttributesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DeviceAttributesStruct(
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
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeviceAttributesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeviceAttributesStruct &&
        id == other.id &&
        deviceId == other.deviceId &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([id, deviceId, name, value]);
}

DeviceAttributesStruct createDeviceAttributesStruct({
  String? id,
  String? deviceId,
  String? name,
  String? value,
}) =>
    DeviceAttributesStruct(
      id: id,
      deviceId: deviceId,
      name: name,
      value: value,
    );
