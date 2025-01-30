// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetProfileResponseModelStruct extends BaseStruct {
  GetProfileResponseModelStruct({
    String? sub,
    bool? emailVerified,
    String? name,
    String? preferredUsername,
    String? givenName,
    String? familyName,
    String? email,
    String? picture,
  })  : _sub = sub,
        _emailVerified = emailVerified,
        _name = name,
        _preferredUsername = preferredUsername,
        _givenName = givenName,
        _familyName = familyName,
        _email = email,
        _picture = picture;

  // "sub" field.
  String? _sub;
  String get sub => _sub ?? '';
  set sub(String? val) => _sub = val;

  bool hasSub() => _sub != null;

  // "email_verified" field.
  bool? _emailVerified;
  bool get emailVerified => _emailVerified ?? false;
  set emailVerified(bool? val) => _emailVerified = val;

  bool hasEmailVerified() => _emailVerified != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "preferred_username" field.
  String? _preferredUsername;
  String get preferredUsername => _preferredUsername ?? '';
  set preferredUsername(String? val) => _preferredUsername = val;

  bool hasPreferredUsername() => _preferredUsername != null;

  // "given_name" field.
  String? _givenName;
  String get givenName => _givenName ?? '';
  set givenName(String? val) => _givenName = val;

  bool hasGivenName() => _givenName != null;

  // "family_name" field.
  String? _familyName;
  String get familyName => _familyName ?? '';
  set familyName(String? val) => _familyName = val;

  bool hasFamilyName() => _familyName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  set picture(String? val) => _picture = val;

  bool hasPicture() => _picture != null;

  static GetProfileResponseModelStruct fromMap(Map<String, dynamic> data) =>
      GetProfileResponseModelStruct(
        sub: data['sub'] as String?,
        emailVerified: data['email_verified'] as bool?,
        name: data['name'] as String?,
        preferredUsername: data['preferred_username'] as String?,
        givenName: data['given_name'] as String?,
        familyName: data['family_name'] as String?,
        email: data['email'] as String?,
        picture: data['picture'] as String?,
      );

  static GetProfileResponseModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GetProfileResponseModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'sub': _sub,
        'email_verified': _emailVerified,
        'name': _name,
        'preferred_username': _preferredUsername,
        'given_name': _givenName,
        'family_name': _familyName,
        'email': _email,
        'picture': _picture,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sub': serializeParam(
          _sub,
          ParamType.String,
        ),
        'email_verified': serializeParam(
          _emailVerified,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'preferred_username': serializeParam(
          _preferredUsername,
          ParamType.String,
        ),
        'given_name': serializeParam(
          _givenName,
          ParamType.String,
        ),
        'family_name': serializeParam(
          _familyName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'picture': serializeParam(
          _picture,
          ParamType.String,
        ),
      }.withoutNulls;

  static GetProfileResponseModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetProfileResponseModelStruct(
        sub: deserializeParam(
          data['sub'],
          ParamType.String,
          false,
        ),
        emailVerified: deserializeParam(
          data['email_verified'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        preferredUsername: deserializeParam(
          data['preferred_username'],
          ParamType.String,
          false,
        ),
        givenName: deserializeParam(
          data['given_name'],
          ParamType.String,
          false,
        ),
        familyName: deserializeParam(
          data['family_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        picture: deserializeParam(
          data['picture'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GetProfileResponseModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetProfileResponseModelStruct &&
        sub == other.sub &&
        emailVerified == other.emailVerified &&
        name == other.name &&
        preferredUsername == other.preferredUsername &&
        givenName == other.givenName &&
        familyName == other.familyName &&
        email == other.email &&
        picture == other.picture;
  }

  @override
  int get hashCode => const ListEquality().hash([
        sub,
        emailVerified,
        name,
        preferredUsername,
        givenName,
        familyName,
        email,
        picture
      ]);
}

GetProfileResponseModelStruct createGetProfileResponseModelStruct({
  String? sub,
  bool? emailVerified,
  String? name,
  String? preferredUsername,
  String? givenName,
  String? familyName,
  String? email,
  String? picture,
}) =>
    GetProfileResponseModelStruct(
      sub: sub,
      emailVerified: emailVerified,
      name: name,
      preferredUsername: preferredUsername,
      givenName: givenName,
      familyName: familyName,
      email: email,
      picture: picture,
    );
