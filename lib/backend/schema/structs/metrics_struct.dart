// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetricsStruct extends BaseStruct {
  MetricsStruct({
    String? timestamp,
    double? value,
    MetricLabelsStruct? labels,
  })  : _timestamp = timestamp,
        _value = value,
        _labels = labels;

  // "Timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  set timestamp(String? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "Labels" field.
  MetricLabelsStruct? _labels;
  MetricLabelsStruct get labels => _labels ?? MetricLabelsStruct();
  set labels(MetricLabelsStruct? val) => _labels = val;

  void updateLabels(Function(MetricLabelsStruct) updateFn) {
    updateFn(_labels ??= MetricLabelsStruct());
  }

  bool hasLabels() => _labels != null;

  static MetricsStruct fromMap(Map<String, dynamic> data) => MetricsStruct(
        timestamp: data['Timestamp'] as String?,
        value: castToType<double>(data['Value']),
        labels: data['Labels'] is MetricLabelsStruct
            ? data['Labels']
            : MetricLabelsStruct.maybeFromMap(data['Labels']),
      );

  static MetricsStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetricsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Timestamp': _timestamp,
        'Value': _value,
        'Labels': _labels?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Timestamp': serializeParam(
          _timestamp,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.double,
        ),
        'Labels': serializeParam(
          _labels,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MetricsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetricsStruct(
        timestamp: deserializeParam(
          data['Timestamp'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        labels: deserializeStructParam(
          data['Labels'],
          ParamType.DataStruct,
          false,
          structBuilder: MetricLabelsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MetricsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetricsStruct &&
        timestamp == other.timestamp &&
        value == other.value &&
        labels == other.labels;
  }

  @override
  int get hashCode => const ListEquality().hash([timestamp, value, labels]);
}

MetricsStruct createMetricsStruct({
  String? timestamp,
  double? value,
  MetricLabelsStruct? labels,
}) =>
    MetricsStruct(
      timestamp: timestamp,
      value: value,
      labels: labels ?? MetricLabelsStruct(),
    );
