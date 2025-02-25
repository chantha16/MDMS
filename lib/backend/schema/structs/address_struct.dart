// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends BaseStruct {
  AddressStruct({
    List<String>? storeMapList,
  }) : _storeMapList = storeMapList;

  // "storeMapList" field.
  List<String>? _storeMapList;
  List<String> get storeMapList => _storeMapList ?? const [];
  set storeMapList(List<String>? val) => _storeMapList = val;

  void updateStoreMapList(Function(List<String>) updateFn) {
    updateFn(_storeMapList ??= []);
  }

  bool hasStoreMapList() => _storeMapList != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        storeMapList: getDataList(data['storeMapList']),
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'storeMapList': _storeMapList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'storeMapList': serializeParam(
          _storeMapList,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        storeMapList: deserializeParam<String>(
          data['storeMapList'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AddressStruct &&
        listEquality.equals(storeMapList, other.storeMapList);
  }

  @override
  int get hashCode => const ListEquality().hash([storeMapList]);
}

AddressStruct createAddressStruct() => AddressStruct();
