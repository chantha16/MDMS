// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GenerateDataDeviceStruct extends BaseStruct {
  GenerateDataDeviceStruct({
    String? serialNumber,
    String? model,
    String? deviceType,
    String? manufacturer,
    String? status,
    String? linkStatus,
    String? tou,
    String? name,
    String? groupDevice,
    String? latitude,
    String? longitude,
    String? location,
    int? deviceGroupId,
  })  : _serialNumber = serialNumber,
        _model = model,
        _deviceType = deviceType,
        _manufacturer = manufacturer,
        _status = status,
        _linkStatus = linkStatus,
        _tou = tou,
        _name = name,
        _groupDevice = groupDevice,
        _latitude = latitude,
        _longitude = longitude,
        _location = location,
        _deviceGroupId = deviceGroupId;

  // "SerialNumber" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  set serialNumber(String? val) => _serialNumber = val;

  bool hasSerialNumber() => _serialNumber != null;

  // "Model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "DeviceType" field.
  String? _deviceType;
  String get deviceType => _deviceType ?? '';
  set deviceType(String? val) => _deviceType = val;

  bool hasDeviceType() => _deviceType != null;

  // "Manufacturer" field.
  String? _manufacturer;
  String get manufacturer => _manufacturer ?? '';
  set manufacturer(String? val) => _manufacturer = val;

  bool hasManufacturer() => _manufacturer != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? 'None';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "LinkStatus" field.
  String? _linkStatus;
  String get linkStatus => _linkStatus ?? 'None';
  set linkStatus(String? val) => _linkStatus = val;

  bool hasLinkStatus() => _linkStatus != null;

  // "TOU" field.
  String? _tou;
  String get tou => _tou ?? '';
  set tou(String? val) => _tou = val;

  bool hasTou() => _tou != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "GroupDevice" field.
  String? _groupDevice;
  String get groupDevice => _groupDevice ?? '';
  set groupDevice(String? val) => _groupDevice = val;

  bool hasGroupDevice() => _groupDevice != null;

  // "Latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "Longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "DeviceGroupId" field.
  int? _deviceGroupId;
  int get deviceGroupId => _deviceGroupId ?? 0;
  set deviceGroupId(int? val) => _deviceGroupId = val;

  void incrementDeviceGroupId(int amount) =>
      deviceGroupId = deviceGroupId + amount;

  bool hasDeviceGroupId() => _deviceGroupId != null;

  static GenerateDataDeviceStruct fromMap(Map<String, dynamic> data) =>
      GenerateDataDeviceStruct(
        serialNumber: data['SerialNumber'] as String?,
        model: data['Model'] as String?,
        deviceType: data['DeviceType'] as String?,
        manufacturer: data['Manufacturer'] as String?,
        status: data['Status'] as String?,
        linkStatus: data['LinkStatus'] as String?,
        tou: data['TOU'] as String?,
        name: data['Name'] as String?,
        groupDevice: data['GroupDevice'] as String?,
        latitude: data['Latitude'] as String?,
        longitude: data['Longitude'] as String?,
        location: data['Location'] as String?,
        deviceGroupId: castToType<int>(data['DeviceGroupId']),
      );

  static GenerateDataDeviceStruct? maybeFromMap(dynamic data) => data is Map
      ? GenerateDataDeviceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SerialNumber': _serialNumber,
        'Model': _model,
        'DeviceType': _deviceType,
        'Manufacturer': _manufacturer,
        'Status': _status,
        'LinkStatus': _linkStatus,
        'TOU': _tou,
        'Name': _name,
        'GroupDevice': _groupDevice,
        'Latitude': _latitude,
        'Longitude': _longitude,
        'Location': _location,
        'DeviceGroupId': _deviceGroupId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SerialNumber': serializeParam(
          _serialNumber,
          ParamType.String,
        ),
        'Model': serializeParam(
          _model,
          ParamType.String,
        ),
        'DeviceType': serializeParam(
          _deviceType,
          ParamType.String,
        ),
        'Manufacturer': serializeParam(
          _manufacturer,
          ParamType.String,
        ),
        'Status': serializeParam(
          _status,
          ParamType.String,
        ),
        'LinkStatus': serializeParam(
          _linkStatus,
          ParamType.String,
        ),
        'TOU': serializeParam(
          _tou,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'GroupDevice': serializeParam(
          _groupDevice,
          ParamType.String,
        ),
        'Latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'Longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'DeviceGroupId': serializeParam(
          _deviceGroupId,
          ParamType.int,
        ),
      }.withoutNulls;

  static GenerateDataDeviceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GenerateDataDeviceStruct(
        serialNumber: deserializeParam(
          data['SerialNumber'],
          ParamType.String,
          false,
        ),
        model: deserializeParam(
          data['Model'],
          ParamType.String,
          false,
        ),
        deviceType: deserializeParam(
          data['DeviceType'],
          ParamType.String,
          false,
        ),
        manufacturer: deserializeParam(
          data['Manufacturer'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['Status'],
          ParamType.String,
          false,
        ),
        linkStatus: deserializeParam(
          data['LinkStatus'],
          ParamType.String,
          false,
        ),
        tou: deserializeParam(
          data['TOU'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        groupDevice: deserializeParam(
          data['GroupDevice'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['Latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['Longitude'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        deviceGroupId: deserializeParam(
          data['DeviceGroupId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GenerateDataDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GenerateDataDeviceStruct &&
        serialNumber == other.serialNumber &&
        model == other.model &&
        deviceType == other.deviceType &&
        manufacturer == other.manufacturer &&
        status == other.status &&
        linkStatus == other.linkStatus &&
        tou == other.tou &&
        name == other.name &&
        groupDevice == other.groupDevice &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        location == other.location &&
        deviceGroupId == other.deviceGroupId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        serialNumber,
        model,
        deviceType,
        manufacturer,
        status,
        linkStatus,
        tou,
        name,
        groupDevice,
        latitude,
        longitude,
        location,
        deviceGroupId
      ]);
}

GenerateDataDeviceStruct createGenerateDataDeviceStruct({
  String? serialNumber,
  String? model,
  String? deviceType,
  String? manufacturer,
  String? status,
  String? linkStatus,
  String? tou,
  String? name,
  String? groupDevice,
  String? latitude,
  String? longitude,
  String? location,
  int? deviceGroupId,
}) =>
    GenerateDataDeviceStruct(
      serialNumber: serialNumber,
      model: model,
      deviceType: deviceType,
      manufacturer: manufacturer,
      status: status,
      linkStatus: linkStatus,
      tou: tou,
      name: name,
      groupDevice: groupDevice,
      latitude: latitude,
      longitude: longitude,
      location: location,
      deviceGroupId: deviceGroupId,
    );
