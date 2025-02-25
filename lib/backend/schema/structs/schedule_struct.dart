// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleStruct extends BaseStruct {
  ScheduleStruct({
    String? id,
    String? interval,
    String? billingDeviceId,
    String? startDate,
    int? retryCount,
    String? scheduleType,
    String? batchExecutionId,
    String? endDate,
    String? lastExecutedTime,
    String? nextExecuteTime,
    String? status,
    String? type,
    BillingDeviceStruct? billingDevice,
  })  : _id = id,
        _interval = interval,
        _billingDeviceId = billingDeviceId,
        _startDate = startDate,
        _retryCount = retryCount,
        _scheduleType = scheduleType,
        _batchExecutionId = batchExecutionId,
        _endDate = endDate,
        _lastExecutedTime = lastExecutedTime,
        _nextExecuteTime = nextExecuteTime,
        _status = status,
        _type = type,
        _billingDevice = billingDevice;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "Interval" field.
  String? _interval;
  String get interval => _interval ?? '';
  set interval(String? val) => _interval = val;

  bool hasInterval() => _interval != null;

  // "BillingDeviceId" field.
  String? _billingDeviceId;
  String get billingDeviceId => _billingDeviceId ?? '';
  set billingDeviceId(String? val) => _billingDeviceId = val;

  bool hasBillingDeviceId() => _billingDeviceId != null;

  // "StartDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "RetryCount" field.
  int? _retryCount;
  int get retryCount => _retryCount ?? 0;
  set retryCount(int? val) => _retryCount = val;

  void incrementRetryCount(int amount) => retryCount = retryCount + amount;

  bool hasRetryCount() => _retryCount != null;

  // "ScheduleType" field.
  String? _scheduleType;
  String get scheduleType => _scheduleType ?? '';
  set scheduleType(String? val) => _scheduleType = val;

  bool hasScheduleType() => _scheduleType != null;

  // "BatchExecutionId" field.
  String? _batchExecutionId;
  String get batchExecutionId => _batchExecutionId ?? '';
  set batchExecutionId(String? val) => _batchExecutionId = val;

  bool hasBatchExecutionId() => _batchExecutionId != null;

  // "EndDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "LastExecutedTime" field.
  String? _lastExecutedTime;
  String get lastExecutedTime => _lastExecutedTime ?? '';
  set lastExecutedTime(String? val) => _lastExecutedTime = val;

  bool hasLastExecutedTime() => _lastExecutedTime != null;

  // "NextExecuteTime" field.
  String? _nextExecuteTime;
  String get nextExecuteTime => _nextExecuteTime ?? '';
  set nextExecuteTime(String? val) => _nextExecuteTime = val;

  bool hasNextExecuteTime() => _nextExecuteTime != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "BillingDevice" field.
  BillingDeviceStruct? _billingDevice;
  BillingDeviceStruct get billingDevice =>
      _billingDevice ?? BillingDeviceStruct();
  set billingDevice(BillingDeviceStruct? val) => _billingDevice = val;

  void updateBillingDevice(Function(BillingDeviceStruct) updateFn) {
    updateFn(_billingDevice ??= BillingDeviceStruct());
  }

  bool hasBillingDevice() => _billingDevice != null;

  static ScheduleStruct fromMap(Map<String, dynamic> data) => ScheduleStruct(
        id: data['Id'] as String?,
        interval: data['Interval'] as String?,
        billingDeviceId: data['BillingDeviceId'] as String?,
        startDate: data['StartDate'] as String?,
        retryCount: castToType<int>(data['RetryCount']),
        scheduleType: data['ScheduleType'] as String?,
        batchExecutionId: data['BatchExecutionId'] as String?,
        endDate: data['EndDate'] as String?,
        lastExecutedTime: data['LastExecutedTime'] as String?,
        nextExecuteTime: data['NextExecuteTime'] as String?,
        status: data['Status'] as String?,
        type: data['Type'] as String?,
        billingDevice: data['BillingDevice'] is BillingDeviceStruct
            ? data['BillingDevice']
            : BillingDeviceStruct.maybeFromMap(data['BillingDevice']),
      );

  static ScheduleStruct? maybeFromMap(dynamic data) =>
      data is Map ? ScheduleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Interval': _interval,
        'BillingDeviceId': _billingDeviceId,
        'StartDate': _startDate,
        'RetryCount': _retryCount,
        'ScheduleType': _scheduleType,
        'BatchExecutionId': _batchExecutionId,
        'EndDate': _endDate,
        'LastExecutedTime': _lastExecutedTime,
        'NextExecuteTime': _nextExecuteTime,
        'Status': _status,
        'Type': _type,
        'BillingDevice': _billingDevice?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
        'Interval': serializeParam(
          _interval,
          ParamType.String,
        ),
        'BillingDeviceId': serializeParam(
          _billingDeviceId,
          ParamType.String,
        ),
        'StartDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'RetryCount': serializeParam(
          _retryCount,
          ParamType.int,
        ),
        'ScheduleType': serializeParam(
          _scheduleType,
          ParamType.String,
        ),
        'BatchExecutionId': serializeParam(
          _batchExecutionId,
          ParamType.String,
        ),
        'EndDate': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'LastExecutedTime': serializeParam(
          _lastExecutedTime,
          ParamType.String,
        ),
        'NextExecuteTime': serializeParam(
          _nextExecuteTime,
          ParamType.String,
        ),
        'Status': serializeParam(
          _status,
          ParamType.String,
        ),
        'Type': serializeParam(
          _type,
          ParamType.String,
        ),
        'BillingDevice': serializeParam(
          _billingDevice,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScheduleStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
        interval: deserializeParam(
          data['Interval'],
          ParamType.String,
          false,
        ),
        billingDeviceId: deserializeParam(
          data['BillingDeviceId'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['StartDate'],
          ParamType.String,
          false,
        ),
        retryCount: deserializeParam(
          data['RetryCount'],
          ParamType.int,
          false,
        ),
        scheduleType: deserializeParam(
          data['ScheduleType'],
          ParamType.String,
          false,
        ),
        batchExecutionId: deserializeParam(
          data['BatchExecutionId'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['EndDate'],
          ParamType.String,
          false,
        ),
        lastExecutedTime: deserializeParam(
          data['LastExecutedTime'],
          ParamType.String,
          false,
        ),
        nextExecuteTime: deserializeParam(
          data['NextExecuteTime'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['Status'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['Type'],
          ParamType.String,
          false,
        ),
        billingDevice: deserializeStructParam(
          data['BillingDevice'],
          ParamType.DataStruct,
          false,
          structBuilder: BillingDeviceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScheduleStruct &&
        id == other.id &&
        interval == other.interval &&
        billingDeviceId == other.billingDeviceId &&
        startDate == other.startDate &&
        retryCount == other.retryCount &&
        scheduleType == other.scheduleType &&
        batchExecutionId == other.batchExecutionId &&
        endDate == other.endDate &&
        lastExecutedTime == other.lastExecutedTime &&
        nextExecuteTime == other.nextExecuteTime &&
        status == other.status &&
        type == other.type &&
        billingDevice == other.billingDevice;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        interval,
        billingDeviceId,
        startDate,
        retryCount,
        scheduleType,
        batchExecutionId,
        endDate,
        lastExecutedTime,
        nextExecuteTime,
        status,
        type,
        billingDevice
      ]);
}

ScheduleStruct createScheduleStruct({
  String? id,
  String? interval,
  String? billingDeviceId,
  String? startDate,
  int? retryCount,
  String? scheduleType,
  String? batchExecutionId,
  String? endDate,
  String? lastExecutedTime,
  String? nextExecuteTime,
  String? status,
  String? type,
  BillingDeviceStruct? billingDevice,
}) =>
    ScheduleStruct(
      id: id,
      interval: interval,
      billingDeviceId: billingDeviceId,
      startDate: startDate,
      retryCount: retryCount,
      scheduleType: scheduleType,
      batchExecutionId: batchExecutionId,
      endDate: endDate,
      lastExecutedTime: lastExecutedTime,
      nextExecuteTime: nextExecuteTime,
      status: status,
      type: type,
      billingDevice: billingDevice ?? BillingDeviceStruct(),
    );
