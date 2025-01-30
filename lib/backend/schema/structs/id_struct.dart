// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdStruct extends BaseStruct {
  IdStruct({
    Idseason? id,
  }) : _id = id;

  // "Id" field.
  Idseason? _id;
  Idseason? get id => _id;
  set id(Idseason? val) => _id = val;

  bool hasId() => _id != null;

  static IdStruct fromMap(Map<String, dynamic> data) => IdStruct(
        id: data['Id'] is Idseason
            ? data['Id']
            : deserializeEnum<Idseason>(data['Id']),
      );

  static IdStruct? maybeFromMap(dynamic data) =>
      data is Map ? IdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static IdStruct fromSerializableMap(Map<String, dynamic> data) => IdStruct(
        id: deserializeParam<Idseason>(
          data['Id'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'IdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IdStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

IdStruct createIdStruct({
  Idseason? id,
}) =>
    IdStruct(
      id: id,
    );
