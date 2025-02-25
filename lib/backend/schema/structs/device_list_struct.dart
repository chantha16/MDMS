// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceListStruct extends BaseStruct {
  DeviceListStruct({
    String? serialNumber,
    String? name,
    String? deviceType,
  })  : _serialNumber = serialNumber,
        _name = name,
        _deviceType = deviceType;

  // "SerialNumber" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  set serialNumber(String? val) => _serialNumber = val;

  bool hasSerialNumber() => _serialNumber != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "DeviceType" field.
  String? _deviceType;
  String get deviceType => _deviceType ?? '';
  set deviceType(String? val) => _deviceType = val;

  bool hasDeviceType() => _deviceType != null;

  static DeviceListStruct fromMap(Map<String, dynamic> data) =>
      DeviceListStruct(
        serialNumber: data['SerialNumber'] as String?,
        name: data['Name'] as String?,
        deviceType: data['DeviceType'] as String?,
      );

  static DeviceListStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SerialNumber': _serialNumber,
        'Name': _name,
        'DeviceType': _deviceType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SerialNumber': serializeParam(
          _serialNumber,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'DeviceType': serializeParam(
          _deviceType,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeviceListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceListStruct(
        serialNumber: deserializeParam(
          data['SerialNumber'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        deviceType: deserializeParam(
          data['DeviceType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeviceListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeviceListStruct &&
        serialNumber == other.serialNumber &&
        name == other.name &&
        deviceType == other.deviceType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([serialNumber, name, deviceType]);
}

DeviceListStruct createDeviceListStruct({
  String? serialNumber,
  String? name,
  String? deviceType,
}) =>
    DeviceListStruct(
      serialNumber: serialNumber,
      name: name,
      deviceType: deviceType,
    );
