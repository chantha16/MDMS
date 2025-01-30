// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagingStruct extends BaseStruct {
  PagingStruct({
    ItemStruct? item,
  }) : _item = item;

  // "Item" field.
  ItemStruct? _item;
  ItemStruct get item => _item ?? ItemStruct();
  set item(ItemStruct? val) => _item = val;

  void updateItem(Function(ItemStruct) updateFn) {
    updateFn(_item ??= ItemStruct());
  }

  bool hasItem() => _item != null;

  static PagingStruct fromMap(Map<String, dynamic> data) => PagingStruct(
        item: data['Item'] is ItemStruct
            ? data['Item']
            : ItemStruct.maybeFromMap(data['Item']),
      );

  static PagingStruct? maybeFromMap(dynamic data) =>
      data is Map ? PagingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Item': _item?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Item': serializeParam(
          _item,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PagingStruct fromSerializableMap(Map<String, dynamic> data) =>
      PagingStruct(
        item: deserializeStructParam(
          data['Item'],
          ParamType.DataStruct,
          false,
          structBuilder: ItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PagingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PagingStruct && item == other.item;
  }

  @override
  int get hashCode => const ListEquality().hash([item]);
}

PagingStruct createPagingStruct({
  ItemStruct? item,
}) =>
    PagingStruct(
      item: item ?? ItemStruct(),
    );
