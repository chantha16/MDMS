// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WhereStruct extends BaseStruct {
  WhereStruct({
    List<AndStruct>? and,
    List<OrStruct>? or,
  })  : _and = and,
        _or = or;

  // "and" field.
  List<AndStruct>? _and;
  List<AndStruct> get and => _and ?? const [];
  set and(List<AndStruct>? val) => _and = val;

  void updateAnd(Function(List<AndStruct>) updateFn) {
    updateFn(_and ??= []);
  }

  bool hasAnd() => _and != null;

  // "or" field.
  List<OrStruct>? _or;
  List<OrStruct> get or => _or ?? const [];
  set or(List<OrStruct>? val) => _or = val;

  void updateOr(Function(List<OrStruct>) updateFn) {
    updateFn(_or ??= []);
  }

  bool hasOr() => _or != null;

  static WhereStruct fromMap(Map<String, dynamic> data) => WhereStruct(
        and: getStructList(
          data['and'],
          AndStruct.fromMap,
        ),
        or: getStructList(
          data['or'],
          OrStruct.fromMap,
        ),
      );

  static WhereStruct? maybeFromMap(dynamic data) =>
      data is Map ? WhereStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'and': _and?.map((e) => e.toMap()).toList(),
        'or': _or?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'and': serializeParam(
          _and,
          ParamType.DataStruct,
          isList: true,
        ),
        'or': serializeParam(
          _or,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static WhereStruct fromSerializableMap(Map<String, dynamic> data) =>
      WhereStruct(
        and: deserializeStructParam<AndStruct>(
          data['and'],
          ParamType.DataStruct,
          true,
          structBuilder: AndStruct.fromSerializableMap,
        ),
        or: deserializeStructParam<OrStruct>(
          data['or'],
          ParamType.DataStruct,
          true,
          structBuilder: OrStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WhereStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WhereStruct &&
        listEquality.equals(and, other.and) &&
        listEquality.equals(or, other.or);
  }

  @override
  int get hashCode => const ListEquality().hash([and, or]);
}

WhereStruct createWhereStruct() => WhereStruct();
