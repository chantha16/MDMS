// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrStruct extends BaseStruct {
  OrStruct({
    LabelsStruct? labels,
  }) : _labels = labels;

  // "Labels" field.
  LabelsStruct? _labels;
  LabelsStruct get labels => _labels ?? LabelsStruct();
  set labels(LabelsStruct? val) => _labels = val;

  void updateLabels(Function(LabelsStruct) updateFn) {
    updateFn(_labels ??= LabelsStruct());
  }

  bool hasLabels() => _labels != null;

  static OrStruct fromMap(Map<String, dynamic> data) => OrStruct(
        labels: data['Labels'] is LabelsStruct
            ? data['Labels']
            : LabelsStruct.maybeFromMap(data['Labels']),
      );

  static OrStruct? maybeFromMap(dynamic data) =>
      data is Map ? OrStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Labels': _labels?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Labels': serializeParam(
          _labels,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static OrStruct fromSerializableMap(Map<String, dynamic> data) => OrStruct(
        labels: deserializeStructParam(
          data['Labels'],
          ParamType.DataStruct,
          false,
          structBuilder: LabelsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrStruct && labels == other.labels;
  }

  @override
  int get hashCode => const ListEquality().hash([labels]);
}

OrStruct createOrStruct({
  LabelsStruct? labels,
}) =>
    OrStruct(
      labels: labels ?? LabelsStruct(),
    );
