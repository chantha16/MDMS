// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlagStruct extends BaseStruct {
  FlagStruct({
    Flag? option,
  }) : _option = option;

  // "option" field.
  Flag? _option;
  Flag? get option => _option;
  set option(Flag? val) => _option = val;

  bool hasOption() => _option != null;

  static FlagStruct fromMap(Map<String, dynamic> data) => FlagStruct(
        option: data['option'] is Flag
            ? data['option']
            : deserializeEnum<Flag>(data['option']),
      );

  static FlagStruct? maybeFromMap(dynamic data) =>
      data is Map ? FlagStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'option': _option?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'option': serializeParam(
          _option,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static FlagStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlagStruct(
        option: deserializeParam<Flag>(
          data['option'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'FlagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlagStruct && option == other.option;
  }

  @override
  int get hashCode => const ListEquality().hash([option]);
}

FlagStruct createFlagStruct({
  Flag? option,
}) =>
    FlagStruct(
      option: option,
    );
