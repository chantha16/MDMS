// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokenResponseModelStruct extends BaseStruct {
  TokenResponseModelStruct({
    String? accessToken,
    int? expiresIn,
    int? refreshExpiresIn,
    String? refreshToken,
    String? tokenType,
    String? idToken,
    int? notBeforePolicy,
    String? sessionState,
    String? scope,
    DateTime? expiresInDatetime,
    DateTime? refreshExpiresInDatetime,
  })  : _accessToken = accessToken,
        _expiresIn = expiresIn,
        _refreshExpiresIn = refreshExpiresIn,
        _refreshToken = refreshToken,
        _tokenType = tokenType,
        _idToken = idToken,
        _notBeforePolicy = notBeforePolicy,
        _sessionState = sessionState,
        _scope = scope,
        _expiresInDatetime = expiresInDatetime,
        _refreshExpiresInDatetime = refreshExpiresInDatetime;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "expires_in" field.
  int? _expiresIn;
  int get expiresIn => _expiresIn ?? 0;
  set expiresIn(int? val) => _expiresIn = val;

  void incrementExpiresIn(int amount) => expiresIn = expiresIn + amount;

  bool hasExpiresIn() => _expiresIn != null;

  // "refresh_expires_in" field.
  int? _refreshExpiresIn;
  int get refreshExpiresIn => _refreshExpiresIn ?? 0;
  set refreshExpiresIn(int? val) => _refreshExpiresIn = val;

  void incrementRefreshExpiresIn(int amount) =>
      refreshExpiresIn = refreshExpiresIn + amount;

  bool hasRefreshExpiresIn() => _refreshExpiresIn != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  // "token_type" field.
  String? _tokenType;
  String get tokenType => _tokenType ?? '';
  set tokenType(String? val) => _tokenType = val;

  bool hasTokenType() => _tokenType != null;

  // "id_token" field.
  String? _idToken;
  String get idToken => _idToken ?? '';
  set idToken(String? val) => _idToken = val;

  bool hasIdToken() => _idToken != null;

  // "not-before-policy" field.
  int? _notBeforePolicy;
  int get notBeforePolicy => _notBeforePolicy ?? 0;
  set notBeforePolicy(int? val) => _notBeforePolicy = val;

  void incrementNotBeforePolicy(int amount) =>
      notBeforePolicy = notBeforePolicy + amount;

  bool hasNotBeforePolicy() => _notBeforePolicy != null;

  // "session_state" field.
  String? _sessionState;
  String get sessionState => _sessionState ?? '';
  set sessionState(String? val) => _sessionState = val;

  bool hasSessionState() => _sessionState != null;

  // "scope" field.
  String? _scope;
  String get scope => _scope ?? '';
  set scope(String? val) => _scope = val;

  bool hasScope() => _scope != null;

  // "expires_in_datetime" field.
  DateTime? _expiresInDatetime;
  DateTime? get expiresInDatetime => _expiresInDatetime;
  set expiresInDatetime(DateTime? val) => _expiresInDatetime = val;

  bool hasExpiresInDatetime() => _expiresInDatetime != null;

  // "refresh_expires_in_datetime" field.
  DateTime? _refreshExpiresInDatetime;
  DateTime? get refreshExpiresInDatetime => _refreshExpiresInDatetime;
  set refreshExpiresInDatetime(DateTime? val) =>
      _refreshExpiresInDatetime = val;

  bool hasRefreshExpiresInDatetime() => _refreshExpiresInDatetime != null;

  static TokenResponseModelStruct fromMap(Map<String, dynamic> data) =>
      TokenResponseModelStruct(
        accessToken: data['access_token'] as String?,
        expiresIn: castToType<int>(data['expires_in']),
        refreshExpiresIn: castToType<int>(data['refresh_expires_in']),
        refreshToken: data['refresh_token'] as String?,
        tokenType: data['token_type'] as String?,
        idToken: data['id_token'] as String?,
        notBeforePolicy: castToType<int>(data['not-before-policy']),
        sessionState: data['session_state'] as String?,
        scope: data['scope'] as String?,
        expiresInDatetime: data['expires_in_datetime'] as DateTime?,
        refreshExpiresInDatetime:
            data['refresh_expires_in_datetime'] as DateTime?,
      );

  static TokenResponseModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TokenResponseModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'access_token': _accessToken,
        'expires_in': _expiresIn,
        'refresh_expires_in': _refreshExpiresIn,
        'refresh_token': _refreshToken,
        'token_type': _tokenType,
        'id_token': _idToken,
        'not-before-policy': _notBeforePolicy,
        'session_state': _sessionState,
        'scope': _scope,
        'expires_in_datetime': _expiresInDatetime,
        'refresh_expires_in_datetime': _refreshExpiresInDatetime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'expires_in': serializeParam(
          _expiresIn,
          ParamType.int,
        ),
        'refresh_expires_in': serializeParam(
          _refreshExpiresIn,
          ParamType.int,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'token_type': serializeParam(
          _tokenType,
          ParamType.String,
        ),
        'id_token': serializeParam(
          _idToken,
          ParamType.String,
        ),
        'not-before-policy': serializeParam(
          _notBeforePolicy,
          ParamType.int,
        ),
        'session_state': serializeParam(
          _sessionState,
          ParamType.String,
        ),
        'scope': serializeParam(
          _scope,
          ParamType.String,
        ),
        'expires_in_datetime': serializeParam(
          _expiresInDatetime,
          ParamType.DateTime,
        ),
        'refresh_expires_in_datetime': serializeParam(
          _refreshExpiresInDatetime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TokenResponseModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TokenResponseModelStruct(
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        expiresIn: deserializeParam(
          data['expires_in'],
          ParamType.int,
          false,
        ),
        refreshExpiresIn: deserializeParam(
          data['refresh_expires_in'],
          ParamType.int,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
        tokenType: deserializeParam(
          data['token_type'],
          ParamType.String,
          false,
        ),
        idToken: deserializeParam(
          data['id_token'],
          ParamType.String,
          false,
        ),
        notBeforePolicy: deserializeParam(
          data['not-before-policy'],
          ParamType.int,
          false,
        ),
        sessionState: deserializeParam(
          data['session_state'],
          ParamType.String,
          false,
        ),
        scope: deserializeParam(
          data['scope'],
          ParamType.String,
          false,
        ),
        expiresInDatetime: deserializeParam(
          data['expires_in_datetime'],
          ParamType.DateTime,
          false,
        ),
        refreshExpiresInDatetime: deserializeParam(
          data['refresh_expires_in_datetime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TokenResponseModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokenResponseModelStruct &&
        accessToken == other.accessToken &&
        expiresIn == other.expiresIn &&
        refreshExpiresIn == other.refreshExpiresIn &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType &&
        idToken == other.idToken &&
        notBeforePolicy == other.notBeforePolicy &&
        sessionState == other.sessionState &&
        scope == other.scope &&
        expiresInDatetime == other.expiresInDatetime &&
        refreshExpiresInDatetime == other.refreshExpiresInDatetime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        accessToken,
        expiresIn,
        refreshExpiresIn,
        refreshToken,
        tokenType,
        idToken,
        notBeforePolicy,
        sessionState,
        scope,
        expiresInDatetime,
        refreshExpiresInDatetime
      ]);
}

TokenResponseModelStruct createTokenResponseModelStruct({
  String? accessToken,
  int? expiresIn,
  int? refreshExpiresIn,
  String? refreshToken,
  String? tokenType,
  String? idToken,
  int? notBeforePolicy,
  String? sessionState,
  String? scope,
  DateTime? expiresInDatetime,
  DateTime? refreshExpiresInDatetime,
}) =>
    TokenResponseModelStruct(
      accessToken: accessToken,
      expiresIn: expiresIn,
      refreshExpiresIn: refreshExpiresIn,
      refreshToken: refreshToken,
      tokenType: tokenType,
      idToken: idToken,
      notBeforePolicy: notBeforePolicy,
      sessionState: sessionState,
      scope: scope,
      expiresInDatetime: expiresInDatetime,
      refreshExpiresInDatetime: refreshExpiresInDatetime,
    );
