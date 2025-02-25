// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddToListStruct extends BaseStruct {
  AddToListStruct({
    String? url,
    int? id,
  })  : _url = url,
        _id = id;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static AddToListStruct fromMap(Map<String, dynamic> data) => AddToListStruct(
        url: data['url'] as String?,
        id: castToType<int>(data['id']),
      );

  static AddToListStruct? maybeFromMap(dynamic data) => data is Map
      ? AddToListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static AddToListStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddToListStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AddToListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddToListStruct && url == other.url && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([url, id]);
}

AddToListStruct createAddToListStruct({
  String? url,
  int? id,
}) =>
    AddToListStruct(
      url: url,
      id: id,
    );
