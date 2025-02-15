// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeasonStruct extends BaseStruct {
  SeasonStruct({
    int? id,
    String? name,
    String? description,
    String? monthRange,
    bool? active,
  })  : _id = id,
        _name = name,
        _description = description,
        _monthRange = monthRange,
        _active = active;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "MonthRange" field.
  String? _monthRange;
  String get monthRange => _monthRange ?? '';
  set monthRange(String? val) => _monthRange = val;

  bool hasMonthRange() => _monthRange != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static SeasonStruct fromMap(Map<String, dynamic> data) => SeasonStruct(
        id: castToType<int>(data['Id']),
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        monthRange: data['MonthRange'] as String?,
        active: data['Active'] as bool?,
      );

  static SeasonStruct? maybeFromMap(dynamic data) =>
      data is Map ? SeasonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
        'Description': _description,
        'MonthRange': _monthRange,
        'Active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'MonthRange': serializeParam(
          _monthRange,
          ParamType.String,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SeasonStruct fromSerializableMap(Map<String, dynamic> data) =>
      SeasonStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        monthRange: deserializeParam(
          data['MonthRange'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SeasonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeasonStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        monthRange == other.monthRange &&
        active == other.active;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, description, monthRange, active]);
}

SeasonStruct createSeasonStruct({
  int? id,
  String? name,
  String? description,
  String? monthRange,
  bool? active,
}) =>
    SeasonStruct(
      id: id,
      name: name,
      description: description,
      monthRange: monthRange,
      active: active,
    );
