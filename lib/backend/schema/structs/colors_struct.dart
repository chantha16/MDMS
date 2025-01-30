// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorsStruct extends BaseStruct {
  ColorsStruct({
    Color? bgColors,
  }) : _bgColors = bgColors;

  // "bgColors" field.
  Color? _bgColors;
  Color get bgColors => _bgColors ?? const Color(0xFFC471C5);
  set bgColors(Color? val) => _bgColors = val;

  bool hasBgColors() => _bgColors != null;

  static ColorsStruct fromMap(Map<String, dynamic> data) => ColorsStruct(
        bgColors: getSchemaColor(data['bgColors']),
      );

  static ColorsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ColorsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'bgColors': _bgColors,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bgColors': serializeParam(
          _bgColors,
          ParamType.Color,
        ),
      }.withoutNulls;

  static ColorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorsStruct(
        bgColors: deserializeParam(
          data['bgColors'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'ColorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorsStruct && bgColors == other.bgColors;
  }

  @override
  int get hashCode => const ListEquality().hash([bgColors]);
}

ColorsStruct createColorsStruct({
  Color? bgColors,
}) =>
    ColorsStruct(
      bgColors: bgColors,
    );
