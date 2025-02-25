// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LabelsStruct extends BaseStruct {
  LabelsStruct({
    ContainsStruct? contains,
  }) : _contains = contains;

  // "contains" field.
  ContainsStruct? _contains;
  ContainsStruct get contains => _contains ?? ContainsStruct();
  set contains(ContainsStruct? val) => _contains = val;

  void updateContains(Function(ContainsStruct) updateFn) {
    updateFn(_contains ??= ContainsStruct());
  }

  bool hasContains() => _contains != null;

  static LabelsStruct fromMap(Map<String, dynamic> data) => LabelsStruct(
        contains: data['contains'] is ContainsStruct
            ? data['contains']
            : ContainsStruct.maybeFromMap(data['contains']),
      );

  static LabelsStruct? maybeFromMap(dynamic data) =>
      data is Map ? LabelsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'contains': _contains?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contains': serializeParam(
          _contains,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LabelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LabelsStruct(
        contains: deserializeStructParam(
          data['contains'],
          ParamType.DataStruct,
          false,
          structBuilder: ContainsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LabelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LabelsStruct && contains == other.contains;
  }

  @override
  int get hashCode => const ListEquality().hash([contains]);
}

LabelsStruct createLabelsStruct({
  ContainsStruct? contains,
}) =>
    LabelsStruct(
      contains: contains ?? ContainsStruct(),
    );
