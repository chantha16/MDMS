// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillingDeviceAddStruct extends BaseStruct {
  BillingDeviceAddStruct({
    String? deviceId,
    int? deviceGroupId,
    int? siteId,
    int? timeOfUseId,
    String? status,
  })  : _deviceId = deviceId,
        _deviceGroupId = deviceGroupId,
        _siteId = siteId,
        _timeOfUseId = timeOfUseId,
        _status = status;

  // "DeviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "DeviceGroupId" field.
  int? _deviceGroupId;
  int get deviceGroupId => _deviceGroupId ?? 0;
  set deviceGroupId(int? val) => _deviceGroupId = val;

  void incrementDeviceGroupId(int amount) =>
      deviceGroupId = deviceGroupId + amount;

  bool hasDeviceGroupId() => _deviceGroupId != null;

  // "SiteId" field.
  int? _siteId;
  int get siteId => _siteId ?? 0;
  set siteId(int? val) => _siteId = val;

  void incrementSiteId(int amount) => siteId = siteId + amount;

  bool hasSiteId() => _siteId != null;

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

  static BillingDeviceAddStruct fromMap(Map<String, dynamic> data) =>
      BillingDeviceAddStruct(
        deviceId: data['DeviceId'] as String?,
        deviceGroupId: castToType<int>(data['DeviceGroupId']),
        siteId: castToType<int>(data['SiteId']),
        timeOfUseId: castToType<int>(data['TimeOfUseId']),
        status: data['Status'] as String?,
      );

  static BillingDeviceAddStruct? maybeFromMap(dynamic data) => data is Map
      ? BillingDeviceAddStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'DeviceId': _deviceId,
        'DeviceGroupId': _deviceGroupId,
        'SiteId': _siteId,
        'TimeOfUseId': _timeOfUseId,
        'Status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DeviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'DeviceGroupId': serializeParam(
          _deviceGroupId,
          ParamType.int,
        ),
        'SiteId': serializeParam(
          _siteId,
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
      }.withoutNulls;

  static BillingDeviceAddStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BillingDeviceAddStruct(
        deviceId: deserializeParam(
          data['DeviceId'],
          ParamType.String,
          false,
        ),
        deviceGroupId: deserializeParam(
          data['DeviceGroupId'],
          ParamType.int,
          false,
        ),
        siteId: deserializeParam(
          data['SiteId'],
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
      );

  @override
  String toString() => 'BillingDeviceAddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BillingDeviceAddStruct &&
        deviceId == other.deviceId &&
        deviceGroupId == other.deviceGroupId &&
        siteId == other.siteId &&
        timeOfUseId == other.timeOfUseId &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([deviceId, deviceGroupId, siteId, timeOfUseId, status]);
}

BillingDeviceAddStruct createBillingDeviceAddStruct({
  String? deviceId,
  int? deviceGroupId,
  int? siteId,
  int? timeOfUseId,
  String? status,
}) =>
    BillingDeviceAddStruct(
      deviceId: deviceId,
      deviceGroupId: deviceGroupId,
      siteId: siteId,
      timeOfUseId: timeOfUseId,
      status: status,
    );
