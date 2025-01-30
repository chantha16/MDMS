// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntrospectModelStruct extends BaseStruct {
  IntrospectModelStruct({
    bool? active,
  }) : _active = active;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static IntrospectModelStruct fromMap(Map<String, dynamic> data) =>
      IntrospectModelStruct(
        active: data['active'] as bool?,
      );

  static IntrospectModelStruct? maybeFromMap(dynamic data) => data is Map
      ? IntrospectModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static IntrospectModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntrospectModelStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'IntrospectModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntrospectModelStruct && active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([active]);
}

IntrospectModelStruct createIntrospectModelStruct({
  bool? active,
}) =>
    IntrospectModelStruct(
      active: active,
    );
