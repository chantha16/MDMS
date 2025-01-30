// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalStruct extends BaseStruct {
  TotalStruct({
    int? total,
  }) : _total = total;

  // "Total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static TotalStruct fromMap(Map<String, dynamic> data) => TotalStruct(
        total: castToType<int>(data['Total']),
      );

  static TotalStruct? maybeFromMap(dynamic data) =>
      data is Map ? TotalStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static TotalStruct fromSerializableMap(Map<String, dynamic> data) =>
      TotalStruct(
        total: deserializeParam(
          data['Total'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TotalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TotalStruct && total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([total]);
}

TotalStruct createTotalStruct({
  int? total,
}) =>
    TotalStruct(
      total: total,
    );
