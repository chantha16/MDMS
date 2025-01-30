// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HandleErrorStruct extends BaseStruct {
  HandleErrorStruct({
    String? error,
    String? path,
    String? code,
  })  : _error = error,
        _path = path,
        _code = code;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) => _error = val;

  bool hasError() => _error != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static HandleErrorStruct fromMap(Map<String, dynamic> data) =>
      HandleErrorStruct(
        error: data['error'] as String?,
        path: data['path'] as String?,
        code: data['code'] as String?,
      );

  static HandleErrorStruct? maybeFromMap(dynamic data) => data is Map
      ? HandleErrorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'error': _error,
        'path': _path,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'error': serializeParam(
          _error,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static HandleErrorStruct fromSerializableMap(Map<String, dynamic> data) =>
      HandleErrorStruct(
        error: deserializeParam(
          data['error'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HandleErrorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HandleErrorStruct &&
        error == other.error &&
        path == other.path &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([error, path, code]);
}

HandleErrorStruct createHandleErrorStruct({
  String? error,
  String? path,
  String? code,
}) =>
    HandleErrorStruct(
      error: error,
      path: path,
      code: code,
    );
