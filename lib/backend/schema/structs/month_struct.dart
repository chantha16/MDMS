// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthStruct extends BaseStruct {
  MonthStruct({
    List<Month>? month,
  }) : _month = month;

  // "Month" field.
  List<Month>? _month;
  List<Month> get month => _month ?? const [];
  set month(List<Month>? val) => _month = val;

  void updateMonth(Function(List<Month>) updateFn) {
    updateFn(_month ??= []);
  }

  bool hasMonth() => _month != null;

  static MonthStruct fromMap(Map<String, dynamic> data) => MonthStruct(
        month: getEnumList<Month>(data['Month']),
      );

  static MonthStruct? maybeFromMap(dynamic data) =>
      data is Map ? MonthStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Month': _month?.map((e) => e.serialize()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Month': serializeParam(
          _month,
          ParamType.Enum,
          isList: true,
        ),
      }.withoutNulls;

  static MonthStruct fromSerializableMap(Map<String, dynamic> data) =>
      MonthStruct(
        month: deserializeParam<Month>(
          data['Month'],
          ParamType.Enum,
          true,
        ),
      );

  @override
  String toString() => 'MonthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MonthStruct && listEquality.equals(month, other.month);
  }

  @override
  int get hashCode => const ListEquality().hash([month]);
}

MonthStruct createMonthStruct() => MonthStruct();
