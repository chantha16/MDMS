// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DropDownNameStruct extends BaseStruct {
  DropDownNameStruct({
    List<String>? dropDownName,
  }) : _dropDownName = dropDownName;

  // "dropDownName" field.
  List<String>? _dropDownName;
  List<String> get dropDownName => _dropDownName ?? const [];
  set dropDownName(List<String>? val) => _dropDownName = val;

  void updateDropDownName(Function(List<String>) updateFn) {
    updateFn(_dropDownName ??= []);
  }

  bool hasDropDownName() => _dropDownName != null;

  static DropDownNameStruct fromMap(Map<String, dynamic> data) =>
      DropDownNameStruct(
        dropDownName: getDataList(data['dropDownName']),
      );

  static DropDownNameStruct? maybeFromMap(dynamic data) => data is Map
      ? DropDownNameStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dropDownName': _dropDownName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dropDownName': serializeParam(
          _dropDownName,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static DropDownNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      DropDownNameStruct(
        dropDownName: deserializeParam<String>(
          data['dropDownName'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'DropDownNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DropDownNameStruct &&
        listEquality.equals(dropDownName, other.dropDownName);
  }

  @override
  int get hashCode => const ListEquality().hash([dropDownName]);
}

DropDownNameStruct createDropDownNameStruct() => DropDownNameStruct();
