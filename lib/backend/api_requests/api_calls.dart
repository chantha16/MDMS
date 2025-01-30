import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Keycloak Group Code

class KeycloakGroup {
  static String getBaseUrl({
    String? clientId,
    String? clientSecret,
    String? grantType,
    String? redirectUri = '',
    String? realm,
    String? token = '',
    String? scope,
    String? responseType,
  }) {
    clientId ??= FFDevEnvironmentValues().clientId;
    clientSecret ??= FFDevEnvironmentValues().clientSecret;
    grantType ??= FFDevEnvironmentValues().grantType;
    realm ??= FFDevEnvironmentValues().realm;
    scope ??= FFDevEnvironmentValues().scope;
    responseType ??= FFAppConstants.responseType;
    return 'https://ids.oone.bz';
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static IntrospectCall introspectCall = IntrospectCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
  static ExchangeTokenCall exchangeTokenCall = ExchangeTokenCall();
  static LogoutCall logoutCall = LogoutCall();
}

class IntrospectCall {
  Future<ApiCallResponse> call({
    String? clientId,
    String? clientSecret,
    String? grantType,
    String? redirectUri = '',
    String? realm,
    String? token = '',
    String? scope,
    String? responseType,
  }) async {
    clientId ??= FFDevEnvironmentValues().clientId;
    clientSecret ??= FFDevEnvironmentValues().clientSecret;
    grantType ??= FFDevEnvironmentValues().grantType;
    realm ??= FFDevEnvironmentValues().realm;
    scope ??= FFDevEnvironmentValues().scope;
    responseType ??= FFAppConstants.responseType;
    final baseUrl = KeycloakGroup.getBaseUrl(
      clientId: clientId,
      clientSecret: clientSecret,
      grantType: grantType,
      redirectUri: redirectUri,
      realm: realm,
      token: token,
      scope: scope,
      responseType: responseType,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Introspect',
      apiUrl:
          '$baseUrl/realms/$realm/protocol/openid-connect/token/introspect',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? clientId,
    String? clientSecret,
    String? grantType,
    String? redirectUri = '',
    String? realm,
    String? token = '',
    String? scope,
    String? responseType,
  }) async {
    clientId ??= FFDevEnvironmentValues().clientId;
    clientSecret ??= FFDevEnvironmentValues().clientSecret;
    grantType ??= FFDevEnvironmentValues().grantType;
    realm ??= FFDevEnvironmentValues().realm;
    scope ??= FFDevEnvironmentValues().scope;
    responseType ??= FFAppConstants.responseType;
    final baseUrl = KeycloakGroup.getBaseUrl(
      clientId: clientId,
      clientSecret: clientSecret,
      grantType: grantType,
      redirectUri: redirectUri,
      realm: realm,
      token: token,
      scope: scope,
      responseType: responseType,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Profile',
      apiUrl: '$baseUrl/realms/$realm/protocol/openid-connect/userinfo',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      },
      params: {
        'client_id': clientId,
        'client_secret': clientSecret,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
    String? clientId,
    String? clientSecret,
    String? grantType,
    String? redirectUri = '',
    String? realm,
    String? token = '',
    String? scope,
    String? responseType,
  }) async {
    clientId ??= FFDevEnvironmentValues().clientId;
    clientSecret ??= FFDevEnvironmentValues().clientSecret;
    grantType ??= FFDevEnvironmentValues().grantType;
    realm ??= FFDevEnvironmentValues().realm;
    scope ??= FFDevEnvironmentValues().scope;
    responseType ??= FFAppConstants.responseType;
    final baseUrl = KeycloakGroup.getBaseUrl(
      clientId: clientId,
      clientSecret: clientSecret,
      grantType: grantType,
      redirectUri: redirectUri,
      realm: realm,
      token: token,
      scope: scope,
      responseType: responseType,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Refresh Token',
      apiUrl: '$baseUrl/realms/$realm/protocol/openid-connect/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_id': clientId,
        'grant_type': "refresh_token",
        'client_secret': clientSecret,
        'refresh_token': refreshToken,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ExchangeTokenCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? clientId,
    String? clientSecret,
    String? grantType,
    String? redirectUri = '',
    String? realm,
    String? token = '',
    String? scope,
    String? responseType,
  }) async {
    clientId ??= FFDevEnvironmentValues().clientId;
    clientSecret ??= FFDevEnvironmentValues().clientSecret;
    grantType ??= FFDevEnvironmentValues().grantType;
    realm ??= FFDevEnvironmentValues().realm;
    scope ??= FFDevEnvironmentValues().scope;
    responseType ??= FFAppConstants.responseType;
    final baseUrl = KeycloakGroup.getBaseUrl(
      clientId: clientId,
      clientSecret: clientSecret,
      grantType: grantType,
      redirectUri: redirectUri,
      realm: realm,
      token: token,
      scope: scope,
      responseType: responseType,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Exchange Token',
      apiUrl: '$baseUrl/realms/$realm/protocol/openid-connect/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'code': code,
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': grantType,
        'redirect_uri': redirectUri,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
    String? clientId,
    String? clientSecret,
    String? grantType,
    String? redirectUri = '',
    String? realm,
    String? token = '',
    String? scope,
    String? responseType,
  }) async {
    clientId ??= FFDevEnvironmentValues().clientId;
    clientSecret ??= FFDevEnvironmentValues().clientSecret;
    grantType ??= FFDevEnvironmentValues().grantType;
    realm ??= FFDevEnvironmentValues().realm;
    scope ??= FFDevEnvironmentValues().scope;
    responseType ??= FFAppConstants.responseType;
    final baseUrl = KeycloakGroup.getBaseUrl(
      clientId: clientId,
      clientSecret: clientSecret,
      grantType: grantType,
      redirectUri: redirectUri,
      realm: realm,
      token: token,
      scope: scope,
      responseType: responseType,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '$baseUrl/realms/$realm/protocol/openid-connect/logout',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'refresh_token': refreshToken,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Keycloak Group Code

/// Start specialDay Group Code

class SpecialDayGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadAllSpecialDaysCall readAllSpecialDaysCall =
      ReadAllSpecialDaysCall();
  static SepcialDayIdCall sepcialDayIdCall = SepcialDayIdCall();
  static DeleteSpecialDayCall deleteSpecialDayCall = DeleteSpecialDayCall();
  static CreateSpecialDayCall createSpecialDayCall = CreateSpecialDayCall();
  static CreateSpecialDayListCall createSpecialDayListCall =
      CreateSpecialDayListCall();
  static UpdateSpecialDayCall updateSpecialDayCall = UpdateSpecialDayCall();
}

class ReadAllSpecialDaysCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    bool? includeSpecialDayDetail = true,
    int? limit = 25,
    int? offset = 0,
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All SpecialDays',
      apiUrl:
          '$baseUrl/api/rest/SpecialDay?search=%25$search%25&includeSpecialDayDetail=$includeSpecialDayDetail&limit=$limit&offset=$offset',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.SpecialDay[:].Name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SepcialDayIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SepcialDayId',
      apiUrl:
          '$baseUrl/api/rest/SpecialDay/$id?includeSpecialDayDetail=true',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? specialDayDetails(dynamic response) => getJsonField(
        response,
        r'''$.SpecialDay[:].SpecialDayDetails''',
        true,
      ) as List?;
}

class DeleteSpecialDayCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'DeleteSpecialDay',
      apiUrl: '$baseUrl/api/rest/SpecialDay/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSpecialDayCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? nameDetail = '',
    String? descriptionDetail = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "SpecialDay": {
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "SpecialDayDetails": {
      "data": [
        {
          "Name": "${escapeStringForJson(nameDetail)}",
          "Description": "${escapeStringForJson(descriptionDetail)}",
          "StartDate": "${escapeStringForJson(startDate)}",
          "EndDate": "${escapeStringForJson(endDate)}"
        }
      ]
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateSpecialDay',
      apiUrl: '$baseUrl/api/rest/SpecialDay',
      callType: ApiCallType.POST,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSpecialDayListCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? nameDetail = '',
    String? descriptionDetail = '',
    String? startDate = '',
    String? endDate = '',
    dynamic dataJson,
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    final data = _serializeJson(dataJson, true);
    final ffApiRequestBody = '''
{
  "SpecialDay": {
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "SpecialDayDetails": {
      "data": $data
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateSpecialDayList',
      apiUrl: '$baseUrl/api/rest/SpecialDay',
      callType: ApiCallType.POST,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSpecialDayCall {
  Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? description = '',
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "SpecialDay": {
    "Description": "${escapeStringForJson(description)}",
    "Name": "${escapeStringForJson(name)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateSpecialDay',
      apiUrl: '$baseUrl/api/rest/SpecialDay/$id',
      callType: ApiCallType.POST,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End specialDay Group Code

/// Start Season Group Code

class SeasonGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadAllSeasonsCall readAllSeasonsCall = ReadAllSeasonsCall();
  static ReadSeasonByIdCall readSeasonByIdCall = ReadSeasonByIdCall();
  static CreateSeasonCall createSeasonCall = CreateSeasonCall();
  static UpdateSeasonCall updateSeasonCall = UpdateSeasonCall();
  static DeleteSeasonCall deleteSeasonCall = DeleteSeasonCall();
}

class ReadAllSeasonsCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    int? limit,
    int? offset,
    int? page,
  }) async {
    final baseUrl = SeasonGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All Seasons',
      apiUrl: '$baseUrl/api/rest/v2/Season',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'search': search,
        'limit': limit,
        'offset': offset,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReadSeasonByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SeasonGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Season by Id',
      apiUrl: '$baseUrl/api/rest/Season/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSeasonCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? monthRange = '',
  }) async {
    final baseUrl = SeasonGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Season": {
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "MonthRange": "${escapeStringForJson(monthRange)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Season',
      apiUrl: '$baseUrl/api/rest/Season',
      callType: ApiCallType.POST,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSeasonCall {
  Future<ApiCallResponse> call({
    int? id,
    String? description = '',
    String? monthRange = '',
    String? name = '',
  }) async {
    final baseUrl = SeasonGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Season": {
"Name":"${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "MonthRange": "${escapeStringForJson(monthRange)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Season',
      apiUrl: '$baseUrl/api/rest/Season/$id',
      callType: ApiCallType.POST,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteSeasonCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SeasonGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Season',
      apiUrl: '$baseUrl/api/rest/Season/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Season Group Code

/// Start specialDayDetails Group Code

class SpecialDayDetailsGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static SpecialDayDetailIdCall specialDayDetailIdCall =
      SpecialDayDetailIdCall();
  static UpdateSpecialDayDetailsCall updateSpecialDayDetailsCall =
      UpdateSpecialDayDetailsCall();
  static DeletespecialDayCall deletespecialDayCall = DeletespecialDayCall();
  static CreateSpecialDayDetailsCall createSpecialDayDetailsCall =
      CreateSpecialDayDetailsCall();
}

class SpecialDayDetailIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SpecialDayDetailsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SpecialDayDetailId',
      apiUrl: '$baseUrl/api/rest/SpecialDayDetail/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSpecialDayDetailsCall {
  Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? description = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final baseUrl = SpecialDayDetailsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "SpecialDayDetail": {
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "StartDate": "${escapeStringForJson(startDate)}",
    "EndDate": "${escapeStringForJson(endDate)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateSpecialDayDetails',
      apiUrl: '$baseUrl/api/rest/SpecialDayDetail/$id',
      callType: ApiCallType.POST,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletespecialDayCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SpecialDayDetailsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'DeletespecialDay',
      apiUrl: '$baseUrl/api/rest/SpecialDayDetail/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSpecialDayDetailsCall {
  Future<ApiCallResponse> call({
    int? specialDayId,
    String? name = '',
    String? description = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final baseUrl = SpecialDayDetailsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "SpecialDayDetail": {
    "SpecialDayId": $specialDayId,
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "StartDate": "${escapeStringForJson(startDate)}",
    "EndDate": "${escapeStringForJson(endDate)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateSpecialDayDetails',
      apiUrl: '$baseUrl/api/rest/SpecialDayDetail',
      callType: ApiCallType.POST,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

/// End specialDayDetails Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
