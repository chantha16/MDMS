// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HandleErrorStruct extends BaseStruct {
  HandleErrorStruct({
    String? error,
    String? path,
    String? code,
    String? warning,
  })  : _error = error,
        _path = path,
        _code = code,
        _warning = warning;

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

  // "warning" field.
  String? _warning;
  String get warning =>
      _warning ?? 'Code field already exists. Please use a different value.';
  set warning(String? val) => _warning = val;

  bool hasWarning() => _warning != null;

  static HandleErrorStruct fromMap(Map<String, dynamic> data) =>
      HandleErrorStruct(
        error: data['error'] as String?,
        path: data['path'] as String?,
        code: data['code'] as String?,
        warning: data['warning'] as String?,
      );

  static HandleErrorStruct? maybeFromMap(dynamic data) => data is Map
      ? HandleErrorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'error': _error,
        'path': _path,
        'code': _code,
        'warning': _warning,
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
        'warning': serializeParam(
          _warning,
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
        warning: deserializeParam(
          data['warning'],
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
        code == other.code &&
        warning == other.warning;
  }

  @override
  int get hashCode => const ListEquality().hash([error, path, code, warning]);
}

HandleErrorStruct createHandleErrorStruct({
  String? error,
  String? path,
  String? code,
  String? warning,
}) =>
    HandleErrorStruct(
      error: error,
      path: path,
      code: code,
      warning: warning,
    );
