// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemStruct extends BaseStruct {
  ItemStruct({
    TotalStruct? total,
  }) : _total = total;

  // "Total" field.
  TotalStruct? _total;
  TotalStruct get total => _total ?? TotalStruct();
  set total(TotalStruct? val) => _total = val;

  void updateTotal(Function(TotalStruct) updateFn) {
    updateFn(_total ??= TotalStruct());
  }

  bool hasTotal() => _total != null;

  static ItemStruct fromMap(Map<String, dynamic> data) => ItemStruct(
        total: data['Total'] is TotalStruct
            ? data['Total']
            : TotalStruct.maybeFromMap(data['Total']),
      );

  static ItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Total': _total?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Total': serializeParam(
          _total,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemStruct(
        total: deserializeStructParam(
          data['Total'],
          ParamType.DataStruct,
          false,
          structBuilder: TotalStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemStruct && total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([total]);
}

ItemStruct createItemStruct({
  TotalStruct? total,
}) =>
    ItemStruct(
      total: total ?? TotalStruct(),
    );
