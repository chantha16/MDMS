// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialDayModelStruct extends BaseStruct {
  SpecialDayModelStruct({
    int? id,
    String? name,
    String? description,
    bool? active,
    List<SpecialDayDetailsModelStruct>? specialDayDetails,
  })  : _id = id,
        _name = name,
        _description = description,
        _active = active,
        _specialDayDetails = specialDayDetails;

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

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "SpecialDayDetails" field.
  List<SpecialDayDetailsModelStruct>? _specialDayDetails;
  List<SpecialDayDetailsModelStruct> get specialDayDetails =>
      _specialDayDetails ?? const [];
  set specialDayDetails(List<SpecialDayDetailsModelStruct>? val) =>
      _specialDayDetails = val;

  void updateSpecialDayDetails(
      Function(List<SpecialDayDetailsModelStruct>) updateFn) {
    updateFn(_specialDayDetails ??= []);
  }

  bool hasSpecialDayDetails() => _specialDayDetails != null;

  static SpecialDayModelStruct fromMap(Map<String, dynamic> data) =>
      SpecialDayModelStruct(
        id: castToType<int>(data['Id']),
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        active: data['Active'] as bool?,
        specialDayDetails: getStructList(
          data['SpecialDayDetails'],
          SpecialDayDetailsModelStruct.fromMap,
        ),
      );

  static SpecialDayModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SpecialDayModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
        'Description': _description,
        'Active': _active,
        'SpecialDayDetails': _specialDayDetails?.map((e) => e.toMap()).toList(),
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
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'SpecialDayDetails': serializeParam(
          _specialDayDetails,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SpecialDayModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpecialDayModelStruct(
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
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
        specialDayDetails: deserializeStructParam<SpecialDayDetailsModelStruct>(
          data['SpecialDayDetails'],
          ParamType.DataStruct,
          true,
          structBuilder: SpecialDayDetailsModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SpecialDayModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SpecialDayModelStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        active == other.active &&
        listEquality.equals(specialDayDetails, other.specialDayDetails);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, description, active, specialDayDetails]);
}

SpecialDayModelStruct createSpecialDayModelStruct({
  int? id,
  String? name,
  String? description,
  bool? active,
}) =>
    SpecialDayModelStruct(
      id: id,
      name: name,
      description: description,
      active: active,
    );
