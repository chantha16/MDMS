// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimestampStruct extends BaseStruct {
  TimestampStruct({
    String? gte,
    String? lte,
  })  : _gte = gte,
        _lte = lte;

  // "gte" field.
  String? _gte;
  String get gte => _gte ?? '';
  set gte(String? val) => _gte = val;

  bool hasGte() => _gte != null;

  // "lte" field.
  String? _lte;
  String get lte => _lte ?? '';
  set lte(String? val) => _lte = val;

  bool hasLte() => _lte != null;

  static TimestampStruct fromMap(Map<String, dynamic> data) => TimestampStruct(
        gte: data['gte'] as String?,
        lte: data['lte'] as String?,
      );

  static TimestampStruct? maybeFromMap(dynamic data) => data is Map
      ? TimestampStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gte': _gte,
        'lte': _lte,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gte': serializeParam(
          _gte,
          ParamType.String,
        ),
        'lte': serializeParam(
          _lte,
          ParamType.String,
        ),
      }.withoutNulls;

  static TimestampStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimestampStruct(
        gte: deserializeParam(
          data['gte'],
          ParamType.String,
          false,
        ),
        lte: deserializeParam(
          data['lte'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TimestampStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimestampStruct && gte == other.gte && lte == other.lte;
  }

  @override
  int get hashCode => const ListEquality().hash([gte, lte]);
}

TimestampStruct createTimestampStruct({
  String? gte,
  String? lte,
}) =>
    TimestampStruct(
      gte: gte,
      lte: lte,
    );
