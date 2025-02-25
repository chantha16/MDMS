// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WheresStruct extends BaseStruct {
  WheresStruct({
    List<AndStruct>? and,
  }) : _and = and;

  // "and" field.
  List<AndStruct>? _and;
  List<AndStruct> get and => _and ?? const [];
  set and(List<AndStruct>? val) => _and = val;

  void updateAnd(Function(List<AndStruct>) updateFn) {
    updateFn(_and ??= []);
  }

  bool hasAnd() => _and != null;

  static WheresStruct fromMap(Map<String, dynamic> data) => WheresStruct(
        and: getStructList(
          data['and'],
          AndStruct.fromMap,
        ),
      );

  static WheresStruct? maybeFromMap(dynamic data) =>
      data is Map ? WheresStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'and': _and?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'and': serializeParam(
          _and,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static WheresStruct fromSerializableMap(Map<String, dynamic> data) =>
      WheresStruct(
        and: deserializeStructParam<AndStruct>(
          data['and'],
          ParamType.DataStruct,
          true,
          structBuilder: AndStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WheresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WheresStruct && listEquality.equals(and, other.and);
  }

  @override
  int get hashCode => const ListEquality().hash([and]);
}

WheresStruct createWheresStruct() => WheresStruct();
