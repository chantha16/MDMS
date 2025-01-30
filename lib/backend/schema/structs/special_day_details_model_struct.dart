// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialDayDetailsModelStruct extends BaseStruct {
  SpecialDayDetailsModelStruct({
    int? id,
    String? name,
    String? description,
    String? startDate,
    String? endDate,
    bool? active,
    DateTime? date,
  })  : _id = id,
        _name = name,
        _description = description,
        _startDate = startDate,
        _endDate = endDate,
        _active = active,
        _date = date;

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

  // "StartDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "EndDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static SpecialDayDetailsModelStruct fromMap(Map<String, dynamic> data) =>
      SpecialDayDetailsModelStruct(
        id: castToType<int>(data['Id']),
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        startDate: data['StartDate'] as String?,
        endDate: data['EndDate'] as String?,
        active: data['Active'] as bool?,
        date: data['date'] as DateTime?,
      );

  static SpecialDayDetailsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SpecialDayDetailsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
        'Description': _description,
        'StartDate': _startDate,
        'EndDate': _endDate,
        'Active': _active,
        'date': _date,
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
        'StartDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'EndDate': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SpecialDayDetailsModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SpecialDayDetailsModelStruct(
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
        startDate: deserializeParam(
          data['StartDate'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['EndDate'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SpecialDayDetailsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpecialDayDetailsModelStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        active == other.active &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, description, startDate, endDate, active, date]);
}

SpecialDayDetailsModelStruct createSpecialDayDetailsModelStruct({
  int? id,
  String? name,
  String? description,
  String? startDate,
  String? endDate,
  bool? active,
  DateTime? date,
}) =>
    SpecialDayDetailsModelStruct(
      id: id,
      name: name,
      description: description,
      startDate: startDate,
      endDate: endDate,
      active: active,
      date: date,
    );
