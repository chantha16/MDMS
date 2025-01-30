// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatemodelStruct extends BaseStruct {
  DatemodelStruct({
    Month? monthEnum,
  }) : _monthEnum = monthEnum;

  // "MonthEnum" field.
  Month? _monthEnum;
  Month? get monthEnum => _monthEnum;
  set monthEnum(Month? val) => _monthEnum = val;

  bool hasMonthEnum() => _monthEnum != null;

  static DatemodelStruct fromMap(Map<String, dynamic> data) => DatemodelStruct(
        monthEnum: data['MonthEnum'] is Month
            ? data['MonthEnum']
            : deserializeEnum<Month>(data['MonthEnum']),
      );

  static DatemodelStruct? maybeFromMap(dynamic data) => data is Map
      ? DatemodelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'MonthEnum': _monthEnum?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MonthEnum': serializeParam(
          _monthEnum,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static DatemodelStruct fromSerializableMap(Map<String, dynamic> data) =>
      DatemodelStruct(
        monthEnum: deserializeParam<Month>(
          data['MonthEnum'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'DatemodelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DatemodelStruct && monthEnum == other.monthEnum;
  }

  @override
  int get hashCode => const ListEquality().hash([monthEnum]);
}

DatemodelStruct createDatemodelStruct({
  Month? monthEnum,
}) =>
    DatemodelStruct(
      monthEnum: monthEnum,
    );
