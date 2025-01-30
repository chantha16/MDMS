// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeasonModelStruct extends BaseStruct {
  SeasonModelStruct({
    String? name,
    String? description,
    String? monthRange,
    bool? active,
    int? id,
  })  : _name = name,
        _description = description,
        _monthRange = monthRange,
        _active = active,
        _id = id;

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

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static SeasonModelStruct fromMap(Map<String, dynamic> data) =>
      SeasonModelStruct(
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        monthRange: data['MonthRange'] as String?,
        active: data['Active'] as bool?,
        id: castToType<int>(data['Id']),
      );

  static SeasonModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SeasonModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Description': _description,
        'MonthRange': _monthRange,
        'Active': _active,
        'Id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static SeasonModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SeasonModelStruct(
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
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SeasonModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeasonModelStruct &&
        name == other.name &&
        description == other.description &&
        monthRange == other.monthRange &&
        active == other.active &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, description, monthRange, active, id]);
}

SeasonModelStruct createSeasonModelStruct({
  String? name,
  String? description,
  String? monthRange,
  bool? active,
  int? id,
}) =>
    SeasonModelStruct(
      name: name,
      description: description,
      monthRange: monthRange,
      active: active,
      id: id,
    );
