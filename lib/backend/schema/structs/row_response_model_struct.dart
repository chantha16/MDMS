// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RowResponseModelStruct extends BaseStruct {
  RowResponseModelStruct({
    int? id,
    String? name,
    bool? isSort,
  })  : _id = id,
        _name = name,
        _isSort = isSort;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "isSort" field.
  bool? _isSort;
  bool get isSort => _isSort ?? false;
  set isSort(bool? val) => _isSort = val;

  bool hasIsSort() => _isSort != null;

  static RowResponseModelStruct fromMap(Map<String, dynamic> data) =>
      RowResponseModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        isSort: data['isSort'] as bool?,
      );

  static RowResponseModelStruct? maybeFromMap(dynamic data) => data is Map
      ? RowResponseModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'isSort': _isSort,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'isSort': serializeParam(
          _isSort,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RowResponseModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RowResponseModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isSort: deserializeParam(
          data['isSort'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RowResponseModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RowResponseModelStruct &&
        id == other.id &&
        name == other.name &&
        isSort == other.isSort;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, isSort]);
}

RowResponseModelStruct createRowResponseModelStruct({
  int? id,
  String? name,
  bool? isSort,
}) =>
    RowResponseModelStruct(
      id: id,
      name: name,
      isSort: isSort,
    );
