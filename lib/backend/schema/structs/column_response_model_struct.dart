// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColumnResponseModelStruct extends BaseStruct {
  ColumnResponseModelStruct({
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

  static ColumnResponseModelStruct fromMap(Map<String, dynamic> data) =>
      ColumnResponseModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        isSort: data['isSort'] as bool?,
      );

  static ColumnResponseModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ColumnResponseModelStruct.fromMap(data.cast<String, dynamic>())
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

  static ColumnResponseModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ColumnResponseModelStruct(
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
  String toString() => 'ColumnResponseModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColumnResponseModelStruct &&
        id == other.id &&
        name == other.name &&
        isSort == other.isSort;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, isSort]);
}

ColumnResponseModelStruct createColumnResponseModelStruct({
  int? id,
  String? name,
  bool? isSort,
}) =>
    ColumnResponseModelStruct(
      id: id,
      name: name,
      isSort: isSort,
    );
