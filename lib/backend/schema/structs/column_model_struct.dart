// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColumnModelStruct extends BaseStruct {
  ColumnModelStruct({
    int? id,
    String? name,
    bool? sorted,
    bool? isHidden,
  })  : _id = id,
        _name = name,
        _sorted = sorted,
        _isHidden = isHidden;

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

  // "sorted" field.
  bool? _sorted;
  bool get sorted => _sorted ?? false;
  set sorted(bool? val) => _sorted = val;

  bool hasSorted() => _sorted != null;

  // "isHidden" field.
  bool? _isHidden;
  bool get isHidden => _isHidden ?? false;
  set isHidden(bool? val) => _isHidden = val;

  bool hasIsHidden() => _isHidden != null;

  static ColumnModelStruct fromMap(Map<String, dynamic> data) =>
      ColumnModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        sorted: data['sorted'] as bool?,
        isHidden: data['isHidden'] as bool?,
      );

  static ColumnModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ColumnModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'sorted': _sorted,
        'isHidden': _isHidden,
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
        'sorted': serializeParam(
          _sorted,
          ParamType.bool,
        ),
        'isHidden': serializeParam(
          _isHidden,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ColumnModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColumnModelStruct(
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
        sorted: deserializeParam(
          data['sorted'],
          ParamType.bool,
          false,
        ),
        isHidden: deserializeParam(
          data['isHidden'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ColumnModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColumnModelStruct &&
        id == other.id &&
        name == other.name &&
        sorted == other.sorted &&
        isHidden == other.isHidden;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, sorted, isHidden]);
}

ColumnModelStruct createColumnModelStruct({
  int? id,
  String? name,
  bool? sorted,
  bool? isHidden,
}) =>
    ColumnModelStruct(
      id: id,
      name: name,
      sorted: sorted,
      isHidden: isHidden,
    );
