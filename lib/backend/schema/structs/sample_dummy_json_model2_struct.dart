// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SampleDummyJsonModel2Struct extends BaseStruct {
  SampleDummyJsonModel2Struct({
    int? id,
    String? name,
    String? note,
    bool? isSort,
    DateTime? date,
    String? role,
  })  : _id = id,
        _name = name,
        _note = note,
        _isSort = isSort,
        _date = date,
        _role = role;

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

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "isSort" field.
  bool? _isSort;
  bool get isSort => _isSort ?? false;
  set isSort(bool? val) => _isSort = val;

  bool hasIsSort() => _isSort != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  static SampleDummyJsonModel2Struct fromMap(Map<String, dynamic> data) =>
      SampleDummyJsonModel2Struct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        note: data['note'] as String?,
        isSort: data['isSort'] as bool?,
        date: data['date'] as DateTime?,
        role: data['role'] as String?,
      );

  static SampleDummyJsonModel2Struct? maybeFromMap(dynamic data) => data is Map
      ? SampleDummyJsonModel2Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'note': _note,
        'isSort': _isSort,
        'date': _date,
        'role': _role,
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
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'isSort': serializeParam(
          _isSort,
          ParamType.bool,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static SampleDummyJsonModel2Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      SampleDummyJsonModel2Struct(
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
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        isSort: deserializeParam(
          data['isSort'],
          ParamType.bool,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SampleDummyJsonModel2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SampleDummyJsonModel2Struct &&
        id == other.id &&
        name == other.name &&
        note == other.note &&
        isSort == other.isSort &&
        date == other.date &&
        role == other.role;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, note, isSort, date, role]);
}

SampleDummyJsonModel2Struct createSampleDummyJsonModel2Struct({
  int? id,
  String? name,
  String? note,
  bool? isSort,
  DateTime? date,
  String? role,
}) =>
    SampleDummyJsonModel2Struct(
      id: id,
      name: name,
      note: note,
      isSort: isSort,
      date: date,
      role: role,
    );
