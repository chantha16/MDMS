// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttributeModelStruct extends BaseStruct {
  AttributeModelStruct({
    int? id,
    String? key,
    List<int>? value,
    bool? active,
  })  : _id = id,
        _key = key,
        _value = value,
        _active = active;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "Value" field.
  List<int>? _value;
  List<int> get value => _value ?? const [];
  set value(List<int>? val) => _value = val;

  void updateValue(Function(List<int>) updateFn) {
    updateFn(_value ??= []);
  }

  bool hasValue() => _value != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static AttributeModelStruct fromMap(Map<String, dynamic> data) =>
      AttributeModelStruct(
        id: castToType<int>(data['Id']),
        key: data['Key'] as String?,
        value: getDataList(data['Value']),
        active: data['Active'] as bool?,
      );

  static AttributeModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AttributeModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Key': _key,
        'Value': _value,
        'Active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Key': serializeParam(
          _key,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.int,
          isList: true,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AttributeModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttributeModelStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        key: deserializeParam(
          data['Key'],
          ParamType.String,
          false,
        ),
        value: deserializeParam<int>(
          data['Value'],
          ParamType.int,
          true,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AttributeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AttributeModelStruct &&
        id == other.id &&
        key == other.key &&
        listEquality.equals(value, other.value) &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([id, key, value, active]);
}

AttributeModelStruct createAttributeModelStruct({
  int? id,
  String? key,
  bool? active,
}) =>
    AttributeModelStruct(
      id: id,
      key: key,
      active: active,
    );
