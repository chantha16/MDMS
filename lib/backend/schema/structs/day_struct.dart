// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayStruct extends BaseStruct {
  DayStruct({
    List<Day>? day,
  }) : _day = day;

  // "Day" field.
  List<Day>? _day;
  List<Day> get day => _day ?? const [];
  set day(List<Day>? val) => _day = val;

  void updateDay(Function(List<Day>) updateFn) {
    updateFn(_day ??= []);
  }

  bool hasDay() => _day != null;

  static DayStruct fromMap(Map<String, dynamic> data) => DayStruct(
        day: getEnumList<Day>(data['Day']),
      );

  static DayStruct? maybeFromMap(dynamic data) =>
      data is Map ? DayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Day': _day?.map((e) => e.serialize()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Day': serializeParam(
          _day,
          ParamType.Enum,
          isList: true,
        ),
      }.withoutNulls;

  static DayStruct fromSerializableMap(Map<String, dynamic> data) => DayStruct(
        day: deserializeParam<Day>(
          data['Day'],
          ParamType.Enum,
          true,
        ),
      );

  @override
  String toString() => 'DayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DayStruct && listEquality.equals(day, other.day);
  }

  @override
  int get hashCode => const ListEquality().hash([day]);
}

DayStruct createDayStruct() => DayStruct();
