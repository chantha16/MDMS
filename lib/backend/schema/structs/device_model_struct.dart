// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceModelStruct extends BaseStruct {
  DeviceModelStruct({
    String? id,
    String? serialNumber,
    String? name,
    String? deviceType,
    String? model,
    String? manufacturer,
    String? status,
    String? linkStatus,
    bool? active,
    List<DeviceChannelsStruct>? deviceChannels,
    List<DeviceAttributesStruct>? deviceAttributes,
    int? deviceGroupId,
  })  : _id = id,
        _serialNumber = serialNumber,
        _name = name,
        _deviceType = deviceType,
        _model = model,
        _manufacturer = manufacturer,
        _status = status,
        _linkStatus = linkStatus,
        _active = active,
        _deviceChannels = deviceChannels,
        _deviceAttributes = deviceAttributes,
        _deviceGroupId = deviceGroupId;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  // "Model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "Manufacturer" field.
  String? _manufacturer;
  String get manufacturer => _manufacturer ?? '';
  set manufacturer(String? val) => _manufacturer = val;

  bool hasManufacturer() => _manufacturer != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "LinkStatus" field.
  String? _linkStatus;
  String get linkStatus => _linkStatus ?? '';
  set linkStatus(String? val) => _linkStatus = val;

  bool hasLinkStatus() => _linkStatus != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "DeviceChannels" field.
  List<DeviceChannelsStruct>? _deviceChannels;
  List<DeviceChannelsStruct> get deviceChannels => _deviceChannels ?? const [];
  set deviceChannels(List<DeviceChannelsStruct>? val) => _deviceChannels = val;

  void updateDeviceChannels(Function(List<DeviceChannelsStruct>) updateFn) {
    updateFn(_deviceChannels ??= []);
  }

  bool hasDeviceChannels() => _deviceChannels != null;

  // "DeviceAttributes" field.
  List<DeviceAttributesStruct>? _deviceAttributes;
  List<DeviceAttributesStruct> get deviceAttributes =>
      _deviceAttributes ?? const [];
  set deviceAttributes(List<DeviceAttributesStruct>? val) =>
      _deviceAttributes = val;

  void updateDeviceAttributes(Function(List<DeviceAttributesStruct>) updateFn) {
    updateFn(_deviceAttributes ??= []);
  }

  bool hasDeviceAttributes() => _deviceAttributes != null;

  // "DeviceGroupId" field.
  int? _deviceGroupId;
  int get deviceGroupId => _deviceGroupId ?? 0;
  set deviceGroupId(int? val) => _deviceGroupId = val;

  void incrementDeviceGroupId(int amount) =>
      deviceGroupId = deviceGroupId + amount;

  bool hasDeviceGroupId() => _deviceGroupId != null;

  static DeviceModelStruct fromMap(Map<String, dynamic> data) =>
      DeviceModelStruct(
        id: data['Id'] as String?,
        serialNumber: data['SerialNumber'] as String?,
        name: data['Name'] as String?,
        deviceType: data['DeviceType'] as String?,
        model: data['Model'] as String?,
        manufacturer: data['Manufacturer'] as String?,
        status: data['Status'] as String?,
        linkStatus: data['LinkStatus'] as String?,
        active: data['Active'] as bool?,
        deviceChannels: getStructList(
          data['DeviceChannels'],
          DeviceChannelsStruct.fromMap,
        ),
        deviceAttributes: getStructList(
          data['DeviceAttributes'],
          DeviceAttributesStruct.fromMap,
        ),
        deviceGroupId: castToType<int>(data['DeviceGroupId']),
      );

  static DeviceModelStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'SerialNumber': _serialNumber,
        'Name': _name,
        'DeviceType': _deviceType,
        'Model': _model,
        'Manufacturer': _manufacturer,
        'Status': _status,
        'LinkStatus': _linkStatus,
        'Active': _active,
        'DeviceChannels': _deviceChannels?.map((e) => e.toMap()).toList(),
        'DeviceAttributes': _deviceAttributes?.map((e) => e.toMap()).toList(),
        'DeviceGroupId': _deviceGroupId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
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
        'Model': serializeParam(
          _model,
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
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'DeviceChannels': serializeParam(
          _deviceChannels,
          ParamType.DataStruct,
          isList: true,
        ),
        'DeviceAttributes': serializeParam(
          _deviceAttributes,
          ParamType.DataStruct,
          isList: true,
        ),
        'DeviceGroupId': serializeParam(
          _deviceGroupId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DeviceModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceModelStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
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
        model: deserializeParam(
          data['Model'],
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
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
        deviceChannels: deserializeStructParam<DeviceChannelsStruct>(
          data['DeviceChannels'],
          ParamType.DataStruct,
          true,
          structBuilder: DeviceChannelsStruct.fromSerializableMap,
        ),
        deviceAttributes: deserializeStructParam<DeviceAttributesStruct>(
          data['DeviceAttributes'],
          ParamType.DataStruct,
          true,
          structBuilder: DeviceAttributesStruct.fromSerializableMap,
        ),
        deviceGroupId: deserializeParam(
          data['DeviceGroupId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DeviceModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeviceModelStruct &&
        id == other.id &&
        serialNumber == other.serialNumber &&
        name == other.name &&
        deviceType == other.deviceType &&
        model == other.model &&
        manufacturer == other.manufacturer &&
        status == other.status &&
        linkStatus == other.linkStatus &&
        active == other.active &&
        listEquality.equals(deviceChannels, other.deviceChannels) &&
        listEquality.equals(deviceAttributes, other.deviceAttributes) &&
        deviceGroupId == other.deviceGroupId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        serialNumber,
        name,
        deviceType,
        model,
        manufacturer,
        status,
        linkStatus,
        active,
        deviceChannels,
        deviceAttributes,
        deviceGroupId
      ]);
}

DeviceModelStruct createDeviceModelStruct({
  String? id,
  String? serialNumber,
  String? name,
  String? deviceType,
  String? model,
  String? manufacturer,
  String? status,
  String? linkStatus,
  bool? active,
  int? deviceGroupId,
}) =>
    DeviceModelStruct(
      id: id,
      serialNumber: serialNumber,
      name: name,
      deviceType: deviceType,
      model: model,
      manufacturer: manufacturer,
      status: status,
      linkStatus: linkStatus,
      active: active,
      deviceGroupId: deviceGroupId,
    );
