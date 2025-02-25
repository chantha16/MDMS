// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserObjectStruct extends BaseStruct {
  UserObjectStruct({
    String? avatar,
    String? email,
    String? displayName,
  })  : _avatar = avatar,
        _email = email,
        _displayName = displayName;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  static UserObjectStruct fromMap(Map<String, dynamic> data) =>
      UserObjectStruct(
        avatar: data['avatar'] as String?,
        email: data['email'] as String?,
        displayName: data['displayName'] as String?,
      );

  static UserObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? UserObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'avatar': _avatar,
        'email': _email,
        'displayName': _displayName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserObjectStruct(
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['displayName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserObjectStruct &&
        avatar == other.avatar &&
        email == other.email &&
        displayName == other.displayName;
  }

  @override
  int get hashCode => const ListEquality().hash([avatar, email, displayName]);
}

UserObjectStruct createUserObjectStruct({
  String? avatar,
  String? email,
  String? displayName,
}) =>
    UserObjectStruct(
      avatar: avatar,
      email: email,
      displayName: displayName,
    );
