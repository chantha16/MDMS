// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeaderModelStruct extends BaseStruct {
  HeaderModelStruct({
    String? name,
    double? width,
    int? order,
    bool? readOnly,
    bool? isShow,
  })  : _name = name,
        _width = width,
        _order = order,
        _readOnly = readOnly,
        _isShow = isShow;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "width" field.
  double? _width;
  double get width => _width ?? 0.0;
  set width(double? val) => _width = val;

  void incrementWidth(double amount) => width = width + amount;

  bool hasWidth() => _width != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "readOnly" field.
  bool? _readOnly;
  bool get readOnly => _readOnly ?? false;
  set readOnly(bool? val) => _readOnly = val;

  bool hasReadOnly() => _readOnly != null;

  // "isShow" field.
  bool? _isShow;
  bool get isShow => _isShow ?? false;
  set isShow(bool? val) => _isShow = val;

  bool hasIsShow() => _isShow != null;

  static HeaderModelStruct fromMap(Map<String, dynamic> data) =>
      HeaderModelStruct(
        name: data['name'] as String?,
        width: castToType<double>(data['width']),
        order: castToType<int>(data['order']),
        readOnly: data['readOnly'] as bool?,
        isShow: data['isShow'] as bool?,
      );

  static HeaderModelStruct? maybeFromMap(dynamic data) => data is Map
      ? HeaderModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'width': _width,
        'order': _order,
        'readOnly': _readOnly,
        'isShow': _isShow,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'width': serializeParam(
          _width,
          ParamType.double,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'readOnly': serializeParam(
          _readOnly,
          ParamType.bool,
        ),
        'isShow': serializeParam(
          _isShow,
          ParamType.bool,
        ),
      }.withoutNulls;

  static HeaderModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      HeaderModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.double,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        readOnly: deserializeParam(
          data['readOnly'],
          ParamType.bool,
          false,
        ),
        isShow: deserializeParam(
          data['isShow'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'HeaderModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HeaderModelStruct &&
        name == other.name &&
        width == other.width &&
        order == other.order &&
        readOnly == other.readOnly &&
        isShow == other.isShow;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, width, order, readOnly, isShow]);
}

HeaderModelStruct createHeaderModelStruct({
  String? name,
  double? width,
  int? order,
  bool? readOnly,
  bool? isShow,
}) =>
    HeaderModelStruct(
      name: name,
      width: width,
      order: order,
      readOnly: readOnly,
      isShow: isShow,
    );
