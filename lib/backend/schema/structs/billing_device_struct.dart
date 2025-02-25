// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillingDeviceStruct extends BaseStruct {
  BillingDeviceStruct({
    String? id,
    int? siteId,
    int? deviceGroupId,
    int? timeOfUseId,
    String? status,
    String? deviceId,
    SiteModelStruct? site,
    DeviceModelStruct? device,
    TimeOfUseStruct? timeOfUse,
    String? lastScheduledTime,
    DeviceGroupModelStruct? deviceGroup,
  })  : _id = id,
        _siteId = siteId,
        _deviceGroupId = deviceGroupId,
        _timeOfUseId = timeOfUseId,
        _status = status,
        _deviceId = deviceId,
        _site = site,
        _device = device,
        _timeOfUse = timeOfUse,
        _lastScheduledTime = lastScheduledTime,
        _deviceGroup = deviceGroup;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "SiteId" field.
  int? _siteId;
  int get siteId => _siteId ?? 0;
  set siteId(int? val) => _siteId = val;

  void incrementSiteId(int amount) => siteId = siteId + amount;

  bool hasSiteId() => _siteId != null;

  // "DeviceGroupId" field.
  int? _deviceGroupId;
  int get deviceGroupId => _deviceGroupId ?? 0;
  set deviceGroupId(int? val) => _deviceGroupId = val;

  void incrementDeviceGroupId(int amount) =>
      deviceGroupId = deviceGroupId + amount;

  bool hasDeviceGroupId() => _deviceGroupId != null;

  // "TimeOfUseId" field.
  int? _timeOfUseId;
  int get timeOfUseId => _timeOfUseId ?? 0;
  set timeOfUseId(int? val) => _timeOfUseId = val;

  void incrementTimeOfUseId(int amount) => timeOfUseId = timeOfUseId + amount;

  bool hasTimeOfUseId() => _timeOfUseId != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "DeviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "Site" field.
  SiteModelStruct? _site;
  SiteModelStruct get site => _site ?? SiteModelStruct();
  set site(SiteModelStruct? val) => _site = val;

  void updateSite(Function(SiteModelStruct) updateFn) {
    updateFn(_site ??= SiteModelStruct());
  }

  bool hasSite() => _site != null;

  // "Device" field.
  DeviceModelStruct? _device;
  DeviceModelStruct get device => _device ?? DeviceModelStruct();
  set device(DeviceModelStruct? val) => _device = val;

  void updateDevice(Function(DeviceModelStruct) updateFn) {
    updateFn(_device ??= DeviceModelStruct());
  }

  bool hasDevice() => _device != null;

  // "TimeOfUse" field.
  TimeOfUseStruct? _timeOfUse;
  TimeOfUseStruct get timeOfUse => _timeOfUse ?? TimeOfUseStruct();
  set timeOfUse(TimeOfUseStruct? val) => _timeOfUse = val;

  void updateTimeOfUse(Function(TimeOfUseStruct) updateFn) {
    updateFn(_timeOfUse ??= TimeOfUseStruct());
  }

  bool hasTimeOfUse() => _timeOfUse != null;

  // "LastScheduledTime" field.
  String? _lastScheduledTime;
  String get lastScheduledTime => _lastScheduledTime ?? '';
  set lastScheduledTime(String? val) => _lastScheduledTime = val;

  bool hasLastScheduledTime() => _lastScheduledTime != null;

  // "DeviceGroup" field.
  DeviceGroupModelStruct? _deviceGroup;
  DeviceGroupModelStruct get deviceGroup =>
      _deviceGroup ?? DeviceGroupModelStruct();
  set deviceGroup(DeviceGroupModelStruct? val) => _deviceGroup = val;

  void updateDeviceGroup(Function(DeviceGroupModelStruct) updateFn) {
    updateFn(_deviceGroup ??= DeviceGroupModelStruct());
  }

  bool hasDeviceGroup() => _deviceGroup != null;

  static BillingDeviceStruct fromMap(Map<String, dynamic> data) =>
      BillingDeviceStruct(
        id: data['Id'] as String?,
        siteId: castToType<int>(data['SiteId']),
        deviceGroupId: castToType<int>(data['DeviceGroupId']),
        timeOfUseId: castToType<int>(data['TimeOfUseId']),
        status: data['Status'] as String?,
        deviceId: data['DeviceId'] as String?,
        site: data['Site'] is SiteModelStruct
            ? data['Site']
            : SiteModelStruct.maybeFromMap(data['Site']),
        device: data['Device'] is DeviceModelStruct
            ? data['Device']
            : DeviceModelStruct.maybeFromMap(data['Device']),
        timeOfUse: data['TimeOfUse'] is TimeOfUseStruct
            ? data['TimeOfUse']
            : TimeOfUseStruct.maybeFromMap(data['TimeOfUse']),
        lastScheduledTime: data['LastScheduledTime'] as String?,
        deviceGroup: data['DeviceGroup'] is DeviceGroupModelStruct
            ? data['DeviceGroup']
            : DeviceGroupModelStruct.maybeFromMap(data['DeviceGroup']),
      );

  static BillingDeviceStruct? maybeFromMap(dynamic data) => data is Map
      ? BillingDeviceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'SiteId': _siteId,
        'DeviceGroupId': _deviceGroupId,
        'TimeOfUseId': _timeOfUseId,
        'Status': _status,
        'DeviceId': _deviceId,
        'Site': _site?.toMap(),
        'Device': _device?.toMap(),
        'TimeOfUse': _timeOfUse?.toMap(),
        'LastScheduledTime': _lastScheduledTime,
        'DeviceGroup': _deviceGroup?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
        'SiteId': serializeParam(
          _siteId,
          ParamType.int,
        ),
        'DeviceGroupId': serializeParam(
          _deviceGroupId,
          ParamType.int,
        ),
        'TimeOfUseId': serializeParam(
          _timeOfUseId,
          ParamType.int,
        ),
        'Status': serializeParam(
          _status,
          ParamType.String,
        ),
        'DeviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'Site': serializeParam(
          _site,
          ParamType.DataStruct,
        ),
        'Device': serializeParam(
          _device,
          ParamType.DataStruct,
        ),
        'TimeOfUse': serializeParam(
          _timeOfUse,
          ParamType.DataStruct,
        ),
        'LastScheduledTime': serializeParam(
          _lastScheduledTime,
          ParamType.String,
        ),
        'DeviceGroup': serializeParam(
          _deviceGroup,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static BillingDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      BillingDeviceStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
        siteId: deserializeParam(
          data['SiteId'],
          ParamType.int,
          false,
        ),
        deviceGroupId: deserializeParam(
          data['DeviceGroupId'],
          ParamType.int,
          false,
        ),
        timeOfUseId: deserializeParam(
          data['TimeOfUseId'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['Status'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeParam(
          data['DeviceId'],
          ParamType.String,
          false,
        ),
        site: deserializeStructParam(
          data['Site'],
          ParamType.DataStruct,
          false,
          structBuilder: SiteModelStruct.fromSerializableMap,
        ),
        device: deserializeStructParam(
          data['Device'],
          ParamType.DataStruct,
          false,
          structBuilder: DeviceModelStruct.fromSerializableMap,
        ),
        timeOfUse: deserializeStructParam(
          data['TimeOfUse'],
          ParamType.DataStruct,
          false,
          structBuilder: TimeOfUseStruct.fromSerializableMap,
        ),
        lastScheduledTime: deserializeParam(
          data['LastScheduledTime'],
          ParamType.String,
          false,
        ),
        deviceGroup: deserializeStructParam(
          data['DeviceGroup'],
          ParamType.DataStruct,
          false,
          structBuilder: DeviceGroupModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BillingDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BillingDeviceStruct &&
        id == other.id &&
        siteId == other.siteId &&
        deviceGroupId == other.deviceGroupId &&
        timeOfUseId == other.timeOfUseId &&
        status == other.status &&
        deviceId == other.deviceId &&
        site == other.site &&
        device == other.device &&
        timeOfUse == other.timeOfUse &&
        lastScheduledTime == other.lastScheduledTime &&
        deviceGroup == other.deviceGroup;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        siteId,
        deviceGroupId,
        timeOfUseId,
        status,
        deviceId,
        site,
        device,
        timeOfUse,
        lastScheduledTime,
        deviceGroup
      ]);
}

BillingDeviceStruct createBillingDeviceStruct({
  String? id,
  int? siteId,
  int? deviceGroupId,
  int? timeOfUseId,
  String? status,
  String? deviceId,
  SiteModelStruct? site,
  DeviceModelStruct? device,
  TimeOfUseStruct? timeOfUse,
  String? lastScheduledTime,
  DeviceGroupModelStruct? deviceGroup,
}) =>
    BillingDeviceStruct(
      id: id,
      siteId: siteId,
      deviceGroupId: deviceGroupId,
      timeOfUseId: timeOfUseId,
      status: status,
      deviceId: deviceId,
      site: site ?? SiteModelStruct(),
      device: device ?? DeviceModelStruct(),
      timeOfUse: timeOfUse ?? TimeOfUseStruct(),
      lastScheduledTime: lastScheduledTime,
      deviceGroup: deviceGroup ?? DeviceGroupModelStruct(),
    );
