// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RowModelStruct extends BaseStruct {
  RowModelStruct({
    int? id,
    List<CellModelStruct>? cell,
    int? order,
    bool? readyOnly,
    bool? selected,
  })  : _id = id,
        _cell = cell,
        _order = order,
        _readyOnly = readyOnly,
        _selected = selected;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "cell" field.
  List<CellModelStruct>? _cell;
  List<CellModelStruct> get cell => _cell ?? const [];
  set cell(List<CellModelStruct>? val) => _cell = val;

  void updateCell(Function(List<CellModelStruct>) updateFn) {
    updateFn(_cell ??= []);
  }

  bool hasCell() => _cell != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "readyOnly" field.
  bool? _readyOnly;
  bool get readyOnly => _readyOnly ?? false;
  set readyOnly(bool? val) => _readyOnly = val;

  bool hasReadyOnly() => _readyOnly != null;

  // "selected" field.
  bool? _selected;
  bool get selected => _selected ?? false;
  set selected(bool? val) => _selected = val;

  bool hasSelected() => _selected != null;

  static RowModelStruct fromMap(Map<String, dynamic> data) => RowModelStruct(
        id: castToType<int>(data['id']),
        cell: getStructList(
          data['cell'],
          CellModelStruct.fromMap,
        ),
        order: castToType<int>(data['order']),
        readyOnly: data['readyOnly'] as bool?,
        selected: data['selected'] as bool?,
      );

  static RowModelStruct? maybeFromMap(dynamic data) =>
      data is Map ? RowModelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'cell': _cell?.map((e) => e.toMap()).toList(),
        'order': _order,
        'readyOnly': _readyOnly,
        'selected': _selected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'cell': serializeParam(
          _cell,
          ParamType.DataStruct,
          isList: true,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'readyOnly': serializeParam(
          _readyOnly,
          ParamType.bool,
        ),
        'selected': serializeParam(
          _selected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RowModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      RowModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        cell: deserializeStructParam<CellModelStruct>(
          data['cell'],
          ParamType.DataStruct,
          true,
          structBuilder: CellModelStruct.fromSerializableMap,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        readyOnly: deserializeParam(
          data['readyOnly'],
          ParamType.bool,
          false,
        ),
        selected: deserializeParam(
          data['selected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RowModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RowModelStruct &&
        id == other.id &&
        listEquality.equals(cell, other.cell) &&
        order == other.order &&
        readyOnly == other.readyOnly &&
        selected == other.selected;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, cell, order, readyOnly, selected]);
}

RowModelStruct createRowModelStruct({
  int? id,
  int? order,
  bool? readyOnly,
  bool? selected,
}) =>
    RowModelStruct(
      id: id,
      order: order,
      readyOnly: readyOnly,
      selected: selected,
    );
