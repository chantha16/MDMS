// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TouColorsTypeStruct extends BaseStruct {
  TouColorsTypeStruct({
    Color? sunColor,
    Color? monColor,
    Color? tueColor,
    Color? wedColor,
    Color? thu,
    Color? friColor,
    Color? satColor,
  })  : _sunColor = sunColor,
        _monColor = monColor,
        _tueColor = tueColor,
        _wedColor = wedColor,
        _thu = thu,
        _friColor = friColor,
        _satColor = satColor;

  // "SunColor" field.
  Color? _sunColor;
  Color get sunColor => _sunColor ?? const Color(0xFF3498DB);
  set sunColor(Color? val) => _sunColor = val;

  bool hasSunColor() => _sunColor != null;

  // "MonColor" field.
  Color? _monColor;
  Color get monColor => _monColor ?? const Color(0xFF2ECC71);
  set monColor(Color? val) => _monColor = val;

  bool hasMonColor() => _monColor != null;

  // "TueColor" field.
  Color? _tueColor;
  Color get tueColor => _tueColor ?? const Color(0xFFF1C40F);
  set tueColor(Color? val) => _tueColor = val;

  bool hasTueColor() => _tueColor != null;

  // "WedColor" field.
  Color? _wedColor;
  Color get wedColor => _wedColor ?? const Color(0xFFE67E22);
  set wedColor(Color? val) => _wedColor = val;

  bool hasWedColor() => _wedColor != null;

  // "Thu" field.
  Color? _thu;
  Color get thu => _thu ?? const Color(0xFFE74C3C);
  set thu(Color? val) => _thu = val;

  bool hasThu() => _thu != null;

  // "FriColor" field.
  Color? _friColor;
  Color get friColor => _friColor ?? const Color(0xFF9B59B6);
  set friColor(Color? val) => _friColor = val;

  bool hasFriColor() => _friColor != null;

  // "SatColor" field.
  Color? _satColor;
  Color get satColor => _satColor ?? const Color(0xFFFF6B81);
  set satColor(Color? val) => _satColor = val;

  bool hasSatColor() => _satColor != null;

  static TouColorsTypeStruct fromMap(Map<String, dynamic> data) =>
      TouColorsTypeStruct(
        sunColor: getSchemaColor(data['SunColor']),
        monColor: getSchemaColor(data['MonColor']),
        tueColor: getSchemaColor(data['TueColor']),
        wedColor: getSchemaColor(data['WedColor']),
        thu: getSchemaColor(data['Thu']),
        friColor: getSchemaColor(data['FriColor']),
        satColor: getSchemaColor(data['SatColor']),
      );

  static TouColorsTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? TouColorsTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SunColor': _sunColor,
        'MonColor': _monColor,
        'TueColor': _tueColor,
        'WedColor': _wedColor,
        'Thu': _thu,
        'FriColor': _friColor,
        'SatColor': _satColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SunColor': serializeParam(
          _sunColor,
          ParamType.Color,
        ),
        'MonColor': serializeParam(
          _monColor,
          ParamType.Color,
        ),
        'TueColor': serializeParam(
          _tueColor,
          ParamType.Color,
        ),
        'WedColor': serializeParam(
          _wedColor,
          ParamType.Color,
        ),
        'Thu': serializeParam(
          _thu,
          ParamType.Color,
        ),
        'FriColor': serializeParam(
          _friColor,
          ParamType.Color,
        ),
        'SatColor': serializeParam(
          _satColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static TouColorsTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TouColorsTypeStruct(
        sunColor: deserializeParam(
          data['SunColor'],
          ParamType.Color,
          false,
        ),
        monColor: deserializeParam(
          data['MonColor'],
          ParamType.Color,
          false,
        ),
        tueColor: deserializeParam(
          data['TueColor'],
          ParamType.Color,
          false,
        ),
        wedColor: deserializeParam(
          data['WedColor'],
          ParamType.Color,
          false,
        ),
        thu: deserializeParam(
          data['Thu'],
          ParamType.Color,
          false,
        ),
        friColor: deserializeParam(
          data['FriColor'],
          ParamType.Color,
          false,
        ),
        satColor: deserializeParam(
          data['SatColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'TouColorsTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TouColorsTypeStruct &&
        sunColor == other.sunColor &&
        monColor == other.monColor &&
        tueColor == other.tueColor &&
        wedColor == other.wedColor &&
        thu == other.thu &&
        friColor == other.friColor &&
        satColor == other.satColor;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([sunColor, monColor, tueColor, wedColor, thu, friColor, satColor]);
}

TouColorsTypeStruct createTouColorsTypeStruct({
  Color? sunColor,
  Color? monColor,
  Color? tueColor,
  Color? wedColor,
  Color? thu,
  Color? friColor,
  Color? satColor,
}) =>
    TouColorsTypeStruct(
      sunColor: sunColor,
      monColor: monColor,
      tueColor: tueColor,
      wedColor: wedColor,
      thu: thu,
      friColor: friColor,
      satColor: satColor,
    );
