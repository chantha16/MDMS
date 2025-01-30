// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TbTableStruct extends BaseStruct {
  TbTableStruct({
    List<int>? name,
  }) : _name = name;

  // "name" field.
  List<int>? _name;
  List<int> get name => _name ?? const [];
  set name(List<int>? val) => _name = val;

  void updateName(Function(List<int>) updateFn) {
    updateFn(_name ??= []);
  }

  bool hasName() => _name != null;

  static TbTableStruct fromMap(Map<String, dynamic> data) => TbTableStruct(
        name: getDataList(data['name']),
      );

  static TbTableStruct? maybeFromMap(dynamic data) =>
      data is Map ? TbTableStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static TbTableStruct fromSerializableMap(Map<String, dynamic> data) =>
      TbTableStruct(
        name: deserializeParam<int>(
          data['name'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'TbTableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TbTableStruct && listEquality.equals(name, other.name);
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

TbTableStruct createTbTableStruct() => TbTableStruct();
