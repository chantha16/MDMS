// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceMetricsStruct extends BaseStruct {
  DeviceMetricsStruct({
    String? id,
    String? name,
    String? model,
    String? serialNumber,
    String? status,
    PagingStruct? paging,
    List<MetricsStruct>? metrics,
  })  : _id = id,
        _name = name,
        _model = model,
        _serialNumber = serialNumber,
        _status = status,
        _paging = paging,
        _metrics = metrics;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "SerialNumber" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  set serialNumber(String? val) => _serialNumber = val;

  bool hasSerialNumber() => _serialNumber != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "Paging" field.
  PagingStruct? _paging;
  PagingStruct get paging => _paging ?? PagingStruct();
  set paging(PagingStruct? val) => _paging = val;

  void updatePaging(Function(PagingStruct) updateFn) {
    updateFn(_paging ??= PagingStruct());
  }

  bool hasPaging() => _paging != null;

  // "Metrics" field.
  List<MetricsStruct>? _metrics;
  List<MetricsStruct> get metrics => _metrics ?? const [];
  set metrics(List<MetricsStruct>? val) => _metrics = val;

  void updateMetrics(Function(List<MetricsStruct>) updateFn) {
    updateFn(_metrics ??= []);
  }

  bool hasMetrics() => _metrics != null;

  static DeviceMetricsStruct fromMap(Map<String, dynamic> data) =>
      DeviceMetricsStruct(
        id: data['Id'] as String?,
        name: data['Name'] as String?,
        model: data['Model'] as String?,
        serialNumber: data['SerialNumber'] as String?,
        status: data['Status'] as String?,
        paging: data['Paging'] is PagingStruct
            ? data['Paging']
            : PagingStruct.maybeFromMap(data['Paging']),
        metrics: getStructList(
          data['Metrics'],
          MetricsStruct.fromMap,
        ),
      );

  static DeviceMetricsStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceMetricsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
        'Model': _model,
        'SerialNumber': _serialNumber,
        'Status': _status,
        'Paging': _paging?.toMap(),
        'Metrics': _metrics?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Model': serializeParam(
          _model,
          ParamType.String,
        ),
        'SerialNumber': serializeParam(
          _serialNumber,
          ParamType.String,
        ),
        'Status': serializeParam(
          _status,
          ParamType.String,
        ),
        'Paging': serializeParam(
          _paging,
          ParamType.DataStruct,
        ),
        'Metrics': serializeParam(
          _metrics,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DeviceMetricsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceMetricsStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        model: deserializeParam(
          data['Model'],
          ParamType.String,
          false,
        ),
        serialNumber: deserializeParam(
          data['SerialNumber'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['Status'],
          ParamType.String,
          false,
        ),
        paging: deserializeStructParam(
          data['Paging'],
          ParamType.DataStruct,
          false,
          structBuilder: PagingStruct.fromSerializableMap,
        ),
        metrics: deserializeStructParam<MetricsStruct>(
          data['Metrics'],
          ParamType.DataStruct,
          true,
          structBuilder: MetricsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeviceMetricsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeviceMetricsStruct &&
        id == other.id &&
        name == other.name &&
        model == other.model &&
        serialNumber == other.serialNumber &&
        status == other.status &&
        paging == other.paging &&
        listEquality.equals(metrics, other.metrics);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, model, serialNumber, status, paging, metrics]);
}

DeviceMetricsStruct createDeviceMetricsStruct({
  String? id,
  String? name,
  String? model,
  String? serialNumber,
  String? status,
  PagingStruct? paging,
}) =>
    DeviceMetricsStruct(
      id: id,
      name: name,
      model: model,
      serialNumber: serialNumber,
      status: status,
      paging: paging ?? PagingStruct(),
    );
