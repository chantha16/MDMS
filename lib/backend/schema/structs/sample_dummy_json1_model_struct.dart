// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SampleDummyJson1ModelStruct extends BaseStruct {
  SampleDummyJson1ModelStruct({
    int? id,
    String? name,
    String? note,
    bool? isSort,
  })  : _id = id,
        _name = name,
        _note = note,
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

  static SampleDummyJson1ModelStruct fromMap(Map<String, dynamic> data) =>
      SampleDummyJson1ModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        note: data['note'] as String?,
        isSort: data['isSort'] as bool?,
      );

  static SampleDummyJson1ModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SampleDummyJson1ModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'note': _note,
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
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'isSort': serializeParam(
          _isSort,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SampleDummyJson1ModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SampleDummyJson1ModelStruct(
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
      );

  @override
  String toString() => 'SampleDummyJson1ModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SampleDummyJson1ModelStruct &&
        id == other.id &&
        name == other.name &&
        note == other.note &&
        isSort == other.isSort;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, note, isSort]);
}

SampleDummyJson1ModelStruct createSampleDummyJson1ModelStruct({
  int? id,
  String? name,
  String? note,
  bool? isSort,
}) =>
    SampleDummyJson1ModelStruct(
      id: id,
      name: name,
      note: note,
      isSort: isSort,
    );
