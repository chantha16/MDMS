// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeBandAttributesModelStruct extends BaseStruct {
  TimeBandAttributesModelStruct({
    int? id,
    int? timeBandId,
    String? key,
    bool? active,
    List<SeasonModelStruct>? seasons,
    List<SpecialDayModelStruct>? specialDays,
    List<int>? value,
  })  : _id = id,
        _timeBandId = timeBandId,
        _key = key,
        _active = active,
        _seasons = seasons,
        _specialDays = specialDays,
        _value = value;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "TimeBandId" field.
  int? _timeBandId;
  int get timeBandId => _timeBandId ?? 0;
  set timeBandId(int? val) => _timeBandId = val;

  void incrementTimeBandId(int amount) => timeBandId = timeBandId + amount;

  bool hasTimeBandId() => _timeBandId != null;

  // "Key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "Active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "Seasons" field.
  List<SeasonModelStruct>? _seasons;
  List<SeasonModelStruct> get seasons => _seasons ?? const [];
  set seasons(List<SeasonModelStruct>? val) => _seasons = val;

  void updateSeasons(Function(List<SeasonModelStruct>) updateFn) {
    updateFn(_seasons ??= []);
  }

  bool hasSeasons() => _seasons != null;

  // "SpecialDays" field.
  List<SpecialDayModelStruct>? _specialDays;
  List<SpecialDayModelStruct> get specialDays => _specialDays ?? const [];
  set specialDays(List<SpecialDayModelStruct>? val) => _specialDays = val;

  void updateSpecialDays(Function(List<SpecialDayModelStruct>) updateFn) {
    updateFn(_specialDays ??= []);
  }

  bool hasSpecialDays() => _specialDays != null;

  // "Value" field.
  List<int>? _value;
  List<int> get value => _value ?? const [];
  set value(List<int>? val) => _value = val;

  void updateValue(Function(List<int>) updateFn) {
    updateFn(_value ??= []);
  }

  bool hasValue() => _value != null;

  static TimeBandAttributesModelStruct fromMap(Map<String, dynamic> data) =>
      TimeBandAttributesModelStruct(
        id: castToType<int>(data['Id']),
        timeBandId: castToType<int>(data['TimeBandId']),
        key: data['Key'] as String?,
        active: data['Active'] as bool?,
        seasons: getStructList(
          data['Seasons'],
          SeasonModelStruct.fromMap,
        ),
        specialDays: getStructList(
          data['SpecialDays'],
          SpecialDayModelStruct.fromMap,
        ),
        value: getDataList(data['Value']),
      );

  static TimeBandAttributesModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? TimeBandAttributesModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'TimeBandId': _timeBandId,
        'Key': _key,
        'Active': _active,
        'Seasons': _seasons?.map((e) => e.toMap()).toList(),
        'SpecialDays': _specialDays?.map((e) => e.toMap()).toList(),
        'Value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'TimeBandId': serializeParam(
          _timeBandId,
          ParamType.int,
        ),
        'Key': serializeParam(
          _key,
          ParamType.String,
        ),
        'Active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'Seasons': serializeParam(
          _seasons,
          ParamType.DataStruct,
          isList: true,
        ),
        'SpecialDays': serializeParam(
          _specialDays,
          ParamType.DataStruct,
          isList: true,
        ),
        'Value': serializeParam(
          _value,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static TimeBandAttributesModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TimeBandAttributesModelStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        timeBandId: deserializeParam(
          data['TimeBandId'],
          ParamType.int,
          false,
        ),
        key: deserializeParam(
          data['Key'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['Active'],
          ParamType.bool,
          false,
        ),
        seasons: deserializeStructParam<SeasonModelStruct>(
          data['Seasons'],
          ParamType.DataStruct,
          true,
          structBuilder: SeasonModelStruct.fromSerializableMap,
        ),
        specialDays: deserializeStructParam<SpecialDayModelStruct>(
          data['SpecialDays'],
          ParamType.DataStruct,
          true,
          structBuilder: SpecialDayModelStruct.fromSerializableMap,
        ),
        value: deserializeParam<int>(
          data['Value'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'TimeBandAttributesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TimeBandAttributesModelStruct &&
        id == other.id &&
        timeBandId == other.timeBandId &&
        key == other.key &&
        active == other.active &&
        listEquality.equals(seasons, other.seasons) &&
        listEquality.equals(specialDays, other.specialDays) &&
        listEquality.equals(value, other.value);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, timeBandId, key, active, seasons, specialDays, value]);
}

TimeBandAttributesModelStruct createTimeBandAttributesModelStruct({
  int? id,
  int? timeBandId,
  String? key,
  bool? active,
}) =>
    TimeBandAttributesModelStruct(
      id: id,
      timeBandId: timeBandId,
      key: key,
      active: active,
    );
