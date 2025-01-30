// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CellModelStruct extends BaseStruct {
  CellModelStruct({
    int? columnId,
    String? data,
    bool? isHidden,
    CellType? type,
  })  : _columnId = columnId,
        _data = data,
        _isHidden = isHidden,
        _type = type;

  // "columnId" field.
  int? _columnId;
  int get columnId => _columnId ?? 0;
  set columnId(int? val) => _columnId = val;

  void incrementColumnId(int amount) => columnId = columnId + amount;

  bool hasColumnId() => _columnId != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "isHidden" field.
  bool? _isHidden;
  bool get isHidden => _isHidden ?? false;
  set isHidden(bool? val) => _isHidden = val;

  bool hasIsHidden() => _isHidden != null;

  // "type" field.
  CellType? _type;
  CellType get type => _type ?? CellType.text;
  set type(CellType? val) => _type = val;

  bool hasType() => _type != null;

  static CellModelStruct fromMap(Map<String, dynamic> data) => CellModelStruct(
        columnId: castToType<int>(data['columnId']),
        data: data['data'] as String?,
        isHidden: data['isHidden'] as bool?,
        type: data['type'] is CellType
            ? data['type']
            : deserializeEnum<CellType>(data['type']),
      );

  static CellModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CellModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'columnId': _columnId,
        'data': _data,
        'isHidden': _isHidden,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'columnId': serializeParam(
          _columnId,
          ParamType.int,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'isHidden': serializeParam(
          _isHidden,
          ParamType.bool,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static CellModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CellModelStruct(
        columnId: deserializeParam(
          data['columnId'],
          ParamType.int,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        isHidden: deserializeParam(
          data['isHidden'],
          ParamType.bool,
          false,
        ),
        type: deserializeParam<CellType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'CellModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CellModelStruct &&
        columnId == other.columnId &&
        data == other.data &&
        isHidden == other.isHidden &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([columnId, data, isHidden, type]);
}

CellModelStruct createCellModelStruct({
  int? columnId,
  String? data,
  bool? isHidden,
  CellType? type,
}) =>
    CellModelStruct(
      columnId: columnId,
      data: data,
      isHidden: isHidden,
      type: type,
    );
