// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeOfUseStruct extends BaseStruct {
  TimeOfUseStruct({
    int? id,
    String? code,
    String? name,
    String? description,
    bool? active,
    List<TimeOfUseDetailsStruct>? timeOfUseDetails,
  })  : _id = id,
        _code = code,
        _name = name,
        _description = description,
        _active = active,
        _timeOfUseDetails = timeOfUseDetails;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

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

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "TimeOfUseDetails" field.
  List<TimeOfUseDetailsStruct>? _timeOfUseDetails;
  List<TimeOfUseDetailsStruct> get timeOfUseDetails =>
      _timeOfUseDetails ?? const [];
  set timeOfUseDetails(List<TimeOfUseDetailsStruct>? val) =>
      _timeOfUseDetails = val;

  void updateTimeOfUseDetails(Function(List<TimeOfUseDetailsStruct>) updateFn) {
    updateFn(_timeOfUseDetails ??= []);
  }

  bool hasTimeOfUseDetails() => _timeOfUseDetails != null;

  static TimeOfUseStruct fromMap(Map<String, dynamic> data) => TimeOfUseStruct(
        id: castToType<int>(data['Id']),
        code: data['Code'] as String?,
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        active: data['Active'] as bool?,
        timeOfUseDetails: getStructList(
          data['TimeOfUseDetails'],
          TimeOfUseDetailsStruct.fromMap,
        ),
      );

  static TimeOfUseStruct? maybeFromMap(dynamic data) => data is Map
      ? TimeOfUseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Code': _code,
        'Name': _name,
        'Description': _description,
        'Active': _active,
        'TimeOfUseDetails': _timeOfUseDetails?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Code': serializeParam(
          _code,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'TimeOfUseDetails': serializeParam(
          _timeOfUseDetails,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TimeOfUseStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimeOfUseStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        code: deserializeParam(
          data['Code'],
          ParamType.String,
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
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
        timeOfUseDetails: deserializeStructParam<TimeOfUseDetailsStruct>(
          data['TimeOfUseDetails'],
          ParamType.DataStruct,
          true,
          structBuilder: TimeOfUseDetailsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TimeOfUseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TimeOfUseStruct &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        description == other.description &&
        active == other.active &&
        listEquality.equals(timeOfUseDetails, other.timeOfUseDetails);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, code, name, description, active, timeOfUseDetails]);
}

TimeOfUseStruct createTimeOfUseStruct({
  int? id,
  String? code,
  String? name,
  String? description,
  bool? active,
}) =>
    TimeOfUseStruct(
      id: id,
      code: code,
      name: name,
      description: description,
      active: active,
    );
