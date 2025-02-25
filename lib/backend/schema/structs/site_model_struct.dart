// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SiteModelStruct extends BaseStruct {
  SiteModelStruct({
    int? id,
    int? parentId,
    String? name,
    String? description,
    bool? active,
    List<SubSiteModelStruct>? subSites,
  })  : _id = id,
        _parentId = parentId,
        _name = name,
        _description = description,
        _active = active,
        _subSites = subSites;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "ParentId" field.
  int? _parentId;
  int get parentId => _parentId ?? 0;
  set parentId(int? val) => _parentId = val;

  void incrementParentId(int amount) => parentId = parentId + amount;

  bool hasParentId() => _parentId != null;

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

  // "SubSites" field.
  List<SubSiteModelStruct>? _subSites;
  List<SubSiteModelStruct> get subSites => _subSites ?? const [];
  set subSites(List<SubSiteModelStruct>? val) => _subSites = val;

  void updateSubSites(Function(List<SubSiteModelStruct>) updateFn) {
    updateFn(_subSites ??= []);
  }

  bool hasSubSites() => _subSites != null;

  static SiteModelStruct fromMap(Map<String, dynamic> data) => SiteModelStruct(
        id: castToType<int>(data['Id']),
        parentId: castToType<int>(data['ParentId']),
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        active: data['Active'] as bool?,
        subSites: getStructList(
          data['SubSites'],
          SubSiteModelStruct.fromMap,
        ),
      );

  static SiteModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SiteModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'ParentId': _parentId,
        'Name': _name,
        'Description': _description,
        'Active': _active,
        'SubSites': _subSites?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'ParentId': serializeParam(
          _parentId,
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
        'SubSites': serializeParam(
          _subSites,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SiteModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SiteModelStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        parentId: deserializeParam(
          data['ParentId'],
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
        subSites: deserializeStructParam<SubSiteModelStruct>(
          data['SubSites'],
          ParamType.DataStruct,
          true,
          structBuilder: SubSiteModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SiteModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SiteModelStruct &&
        id == other.id &&
        parentId == other.parentId &&
        name == other.name &&
        description == other.description &&
        active == other.active &&
        listEquality.equals(subSites, other.subSites);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, parentId, name, description, active, subSites]);
}

SiteModelStruct createSiteModelStruct({
  int? id,
  int? parentId,
  String? name,
  String? description,
  bool? active,
}) =>
    SiteModelStruct(
      id: id,
      parentId: parentId,
      name: name,
      description: description,
      active: active,
    );
