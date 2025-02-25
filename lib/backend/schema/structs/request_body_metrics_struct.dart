// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestBodyMetricsStruct extends BaseStruct {
  RequestBodyMetricsStruct({
    WhereStruct? where,
  }) : _where = where;

  // "where" field.
  WhereStruct? _where;
  WhereStruct get where => _where ?? WhereStruct();
  set where(WhereStruct? val) => _where = val;

  void updateWhere(Function(WhereStruct) updateFn) {
    updateFn(_where ??= WhereStruct());
  }

  bool hasWhere() => _where != null;

  static RequestBodyMetricsStruct fromMap(Map<String, dynamic> data) =>
      RequestBodyMetricsStruct(
        where: data['where'] is WhereStruct
            ? data['where']
            : WhereStruct.maybeFromMap(data['where']),
      );

  static RequestBodyMetricsStruct? maybeFromMap(dynamic data) => data is Map
      ? RequestBodyMetricsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'where': _where?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'where': serializeParam(
          _where,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static RequestBodyMetricsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RequestBodyMetricsStruct(
        where: deserializeStructParam(
          data['where'],
          ParamType.DataStruct,
          false,
          structBuilder: WhereStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RequestBodyMetricsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RequestBodyMetricsStruct && where == other.where;
  }

  @override
  int get hashCode => const ListEquality().hash([where]);
}

RequestBodyMetricsStruct createRequestBodyMetricsStruct({
  WhereStruct? where,
}) =>
    RequestBodyMetricsStruct(
      where: where ?? WhereStruct(),
    );
