// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemModelStruct extends BaseStruct {
  ItemModelStruct({
    List<String>? itemResponse,
  }) : _itemResponse = itemResponse;

  // "itemResponse" field.
  List<String>? _itemResponse;
  List<String> get itemResponse => _itemResponse ?? const [];
  set itemResponse(List<String>? val) => _itemResponse = val;

  void updateItemResponse(Function(List<String>) updateFn) {
    updateFn(_itemResponse ??= []);
  }

  bool hasItemResponse() => _itemResponse != null;

  static ItemModelStruct fromMap(Map<String, dynamic> data) => ItemModelStruct(
        itemResponse: getDataList(data['itemResponse']),
      );

  static ItemModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'itemResponse': _itemResponse,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemResponse': serializeParam(
          _itemResponse,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ItemModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemModelStruct(
        itemResponse: deserializeParam<String>(
          data['itemResponse'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ItemModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ItemModelStruct &&
        listEquality.equals(itemResponse, other.itemResponse);
  }

  @override
  int get hashCode => const ListEquality().hash([itemResponse]);
}

ItemModelStruct createItemModelStruct() => ItemModelStruct();
