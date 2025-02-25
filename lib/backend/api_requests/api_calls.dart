import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start TimeBand Group Code

class TimeBandGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static CreateTimeBandCall createTimeBandCall = CreateTimeBandCall();
  static UpdateTimeBandCall updateTimeBandCall = UpdateTimeBandCall();
  static ReadTimeBandByIdCall readTimeBandByIdCall = ReadTimeBandByIdCall();
  static ReadAllTimeBandCall readAllTimeBandCall = ReadAllTimeBandCall();
  static DeleteTimeBandCall deleteTimeBandCall = DeleteTimeBandCall();
}

class CreateTimeBandCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? startTime = '',
    String? endTime = '',
    dynamic dataJson,
  }) async {
    final baseUrl = TimeBandGroup.getBaseUrl();

    final data = _serializeJson(dataJson, true);
    final ffApiRequestBody = '''
{
  "TimeBand": {
    "Name": "${escapeStringForJson(name)}",
    "StartTime": "${escapeStringForJson(startTime)}",
    "EndTime": "${escapeStringForJson(endTime)}",
    "Description": "${escapeStringForJson(description)}",
    "TimeBandAttributes": {
            "on_conflict": {
                "constraint": "PK_TimeBandAttribute",
                "update_columns": [
                    "Key",
                    "Value",
                    "Active"
                ]
            },
      "data": ${data}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create TimeBand',
      apiUrl: '${baseUrl}/api/rest/TimeBand',
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

class UpdateTimeBandCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? startTime = '',
    String? endTime = '',
    dynamic dataJson,
    int? id,
  }) async {
    final baseUrl = TimeBandGroup.getBaseUrl();

    final data = _serializeJson(dataJson, true);
    final ffApiRequestBody = '''
{
  "TimeBand": {
    "Id": ${id},
    "Name": "${escapeStringForJson(name)}",
    "StartTime": "${escapeStringForJson(startTime)}",
    "EndTime": "${escapeStringForJson(endTime)}",
    "Description": "${escapeStringForJson(description)}",
    "TimeBandAttributes": {
      "on_conflict": {
        "constraint": "PK_TimeBandAttribute",
        "update_columns": [
          "Key",
          "Value",
          "Active"
        ]
      },
      "data": ${data}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update TimeBand',
      apiUrl: '${baseUrl}/api/rest/TimeBand',
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

class ReadTimeBandByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TimeBandGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read TimeBand by Id',
      apiUrl: '${baseUrl}/api/rest/TimeBand/${id}',
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

class ReadAllTimeBandCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    int? limit = 25,
    int? offset = 0,
    bool? includeTimeBandAttributes = true,
  }) async {
    final baseUrl = TimeBandGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All TimeBand',
      apiUrl: '${baseUrl}/api/rest/TimeBand',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'search': search,
        'limit': limit,
        'offset': offset,
        'includeTimeBandAttributes': includeTimeBandAttributes,
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

class DeleteTimeBandCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TimeBandGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete TimeBand',
      apiUrl: '${baseUrl}/api/rest/TimeBand/${id}',
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

/// End TimeBand Group Code

/// Start specialDayDetails Group Code

class SpecialDayDetailsGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static SpecialDayDetailIdCall specialDayDetailIdCall =
      SpecialDayDetailIdCall();
  static DeletespecialDayCall deletespecialDayCall = DeletespecialDayCall();
  static UpdateSpecialDayDetailsCall updateSpecialDayDetailsCall =
      UpdateSpecialDayDetailsCall();
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
      apiUrl: '${baseUrl}/api/rest/SpecialDayDetail/${id}',
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

class DeletespecialDayCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SpecialDayDetailsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'DeletespecialDay',
      apiUrl: '${baseUrl}/api/rest/SpecialDayDetail/${id}',
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
      apiUrl: '${baseUrl}/api/rest/SpecialDayDetail/${id}',
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
    "SpecialDayId": ${specialDayId},
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "StartDate": "${escapeStringForJson(startDate)}",
    "EndDate": "${escapeStringForJson(endDate)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateSpecialDayDetails',
      apiUrl: '${baseUrl}/api/rest/SpecialDayDetail',
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

/// Start TimeBandAttribute Group Code

class TimeBandAttributeGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static DeleteTimeBandAttributeCall deleteTimeBandAttributeCall =
      DeleteTimeBandAttributeCall();
  static CreateTimeBandAttributeCall createTimeBandAttributeCall =
      CreateTimeBandAttributeCall();
  static UpdateTimeBandAttributeCall updateTimeBandAttributeCall =
      UpdateTimeBandAttributeCall();
  static ReadTimeBandAttributeCall readTimeBandAttributeCall =
      ReadTimeBandAttributeCall();
}

class DeleteTimeBandAttributeCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TimeBandAttributeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Time Band Attribute',
      apiUrl: '${baseUrl}/api/rest/TimeBandAttribute/${id}',
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

class CreateTimeBandAttributeCall {
  Future<ApiCallResponse> call({
    int? timeBandId,
    String? key = '',
    String? value = '',
  }) async {
    final baseUrl = TimeBandAttributeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "TimeBandAttribute": {
    "TimeBandId": ${timeBandId},
    "Key": "${escapeStringForJson(key)}",
    "Value": "${escapeStringForJson(value)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Time Band Attribute',
      apiUrl: '${baseUrl}/api/rest/TimeBandAttribute',
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

class UpdateTimeBandAttributeCall {
  Future<ApiCallResponse> call({
    int? id,
    String? value = '',
  }) async {
    final baseUrl = TimeBandAttributeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "TimeBandAttribute": {
    "Value": "${escapeStringForJson(value)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Time Band Attribute',
      apiUrl: '${baseUrl}/api/rest/TimeBandAttribute/${id}',
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

class ReadTimeBandAttributeCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TimeBandAttributeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Time Band Attribute',
      apiUrl: '${baseUrl}/api/rest/TimeBandAttribute/${id}',
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

/// End TimeBandAttribute Group Code

/// Start DeviceGroup Group Code

class DeviceGroupGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadAllDeviceGroupCall readAllDeviceGroupCall =
      ReadAllDeviceGroupCall();
  static ReadDeviceGroupByIdCall readDeviceGroupByIdCall =
      ReadDeviceGroupByIdCall();
  static CreateDeviceGroupCall createDeviceGroupCall = CreateDeviceGroupCall();
  static UpdateDeviceGroupCall updateDeviceGroupCall = UpdateDeviceGroupCall();
  static DeleteDeviceGroupCall deleteDeviceGroupCall = DeleteDeviceGroupCall();
}

class ReadAllDeviceGroupCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    int? limit = 25,
    int? offset = 0,
    bool? includeDevices = true,
  }) async {
    final baseUrl = DeviceGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All Device Group',
      apiUrl: '${baseUrl}/api/rest/v1/DeviceGroup',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'search': search,
        'limit': limit,
        'offset': offset,
        'includeDevices': includeDevices,
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

class ReadDeviceGroupByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    bool? includeDevices,
  }) async {
    final baseUrl = DeviceGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Device Group by Id',
      apiUrl: '${baseUrl}/api/rest/v1/DeviceGroup/${id}',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'includeDevices': includeDevices,
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

class CreateDeviceGroupCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    dynamic dataJson,
    dynamic removedDevicesJson,
  }) async {
    final baseUrl = DeviceGroupGroup.getBaseUrl();

    final data = _serializeJson(dataJson, true);
    final removedDevices = _serializeJson(removedDevicesJson, true);
    final ffApiRequestBody = '''
{
  "DeviceGroup": {
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "Devices": {
      "on_conflict": {
        "constraint": "PK_Device",
        "update_columns": [
          "DeviceGroupId"
        ]
      },
      "data": ${data}
    }
  },
  "RemovedDevices": ${removedDevices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Device Group',
      apiUrl: '${baseUrl}/api/rest/v1/DeviceGroup',
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

class UpdateDeviceGroupCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    dynamic dataJson,
    int? id,
    dynamic removedDevicesJson,
  }) async {
    final baseUrl = DeviceGroupGroup.getBaseUrl();

    final data = _serializeJson(dataJson, true);
    final removedDevices = _serializeJson(removedDevicesJson, true);
    final ffApiRequestBody = '''
{
  "DeviceGroup": {
    "Id": ${id},
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "Devices": {
      "on_conflict": {
        "constraint": "PK_Device",
        "update_columns": [
          "DeviceGroupId"
        ]
      },
      "data": ${data}
    }
  },
  "RemovedDevices": ${removedDevices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Device Group',
      apiUrl: '${baseUrl}/api/rest/v1/DeviceGroup',
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

class DeleteDeviceGroupCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = DeviceGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Device Group',
      apiUrl: '${baseUrl}/api/rest/v1/DeviceGroup/${id}',
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

/// End DeviceGroup Group Code

/// Start Channel Group Code

class ChannelGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadAllChannelCall readAllChannelCall = ReadAllChannelCall();
  static UpdateChannelCall updateChannelCall = UpdateChannelCall();
  static CreateChannelCall createChannelCall = CreateChannelCall();
  static DeleteChannelCall deleteChannelCall = DeleteChannelCall();
  static ReadChannelCall readChannelCall = ReadChannelCall();
}

class ReadAllChannelCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    int? limit = 25,
    int? offset = 0,
  }) async {
    final baseUrl = ChannelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All Channel',
      apiUrl: '${baseUrl}/api/rest/Channel?search=%%&limit=25&offset=0',
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
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateChannelCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? name = '',
    String? units = '',
    String? flowDirection = '',
    String? phase = '',
    String? apportionPolicy = '',
    int? id,
    dynamic channelJson,
  }) async {
    final baseUrl = ChannelGroup.getBaseUrl();

    final channel = _serializeJson(channelJson);
    final ffApiRequestBody = '''
{
  "Channel": ${channel}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Channel',
      apiUrl: '${baseUrl}/api/rest/Channel/${id}',
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

class CreateChannelCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? name = '',
    String? units = '',
    String? flowDirection = '',
    String? phase = '',
    String? apportionPolicy = '',
    int? id,
  }) async {
    final baseUrl = ChannelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Channel": {
    "Code": "${escapeStringForJson(code)}",
    "Name": "${escapeStringForJson(name)}",
    "Units": "${escapeStringForJson(units)}",
    "FlowDirection": "${escapeStringForJson(flowDirection)}",
    "Phase": "${escapeStringForJson(phase)}",
    "ApportionPolicy": "${escapeStringForJson(apportionPolicy)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Channel',
      apiUrl: '${baseUrl}/api/rest/Channel',
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

class DeleteChannelCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ChannelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Channel',
      apiUrl: '${baseUrl}/api/rest/Channel/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

class ReadChannelCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = ChannelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Channel',
      apiUrl: '${baseUrl}/api/rest/Channel/${id}',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

/// End Channel Group Code

/// Start SpecialDay Group Code

class SpecialDayGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static DeleteSpecialDayCall deleteSpecialDayCall = DeleteSpecialDayCall();
  static ReadAllSpecialDaysCall readAllSpecialDaysCall =
      ReadAllSpecialDaysCall();
  static CreateSpecialDayListCall createSpecialDayListCall =
      CreateSpecialDayListCall();
  static UpdateSpecialDayCall updateSpecialDayCall = UpdateSpecialDayCall();
  static SepcialDayIdCall sepcialDayIdCall = SepcialDayIdCall();
  static CreateSpecialDayCall createSpecialDayCall = CreateSpecialDayCall();
}

class DeleteSpecialDayCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'DeleteSpecialDay',
      apiUrl: '${baseUrl}/api/rest/SpecialDay/${id}',
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
      apiUrl: '${baseUrl}/api/rest/v2/SpecialDay',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'search': search,
        'includeSpecialDayDetail': includeSpecialDayDetail,
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
      "data": ${data}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateSpecialDayList',
      apiUrl: '${baseUrl}/api/rest/SpecialDay',
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
      apiUrl: '${baseUrl}/api/rest/SpecialDay/${id}',
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

class SepcialDayIdCall {
  Future<ApiCallResponse> call({
    int? id,
    bool? includeSpecialDayDetail,
    String? search = '%%',
  }) async {
    final baseUrl = SpecialDayGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SepcialDayId',
      apiUrl: '${baseUrl}/api/rest/SpecialDay/${id}',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'includeSpecialDayDetail': includeSpecialDayDetail,
        'search': search,
      },
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
      apiUrl: '${baseUrl}/api/rest/SpecialDay',
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

/// End SpecialDay Group Code

/// Start Season Group Code

class SeasonGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadSeasonByIdCall readSeasonByIdCall = ReadSeasonByIdCall();
  static CreateSeasonCall createSeasonCall = CreateSeasonCall();
  static DeleteSeasonCall deleteSeasonCall = DeleteSeasonCall();
  static UpdateSeasonCall updateSeasonCall = UpdateSeasonCall();
  static ReadAllSeasonsCall readAllSeasonsCall = ReadAllSeasonsCall();
}

class ReadSeasonByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = SeasonGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Season by Id',
      apiUrl: '${baseUrl}/api/rest/Season/${id}',
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
      apiUrl: '${baseUrl}/api/rest/Season',
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
      apiUrl: '${baseUrl}/api/rest/Season/${id}',
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
      apiUrl: '${baseUrl}/api/rest/Season/${id}',
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
      apiUrl: '${baseUrl}/api/rest/v2/Season',
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

/// End Season Group Code

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
  static ExchangeTokenCall exchangeTokenCall = ExchangeTokenCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
  static LogoutCall logoutCall = LogoutCall();
  static IntrospectCall introspectCall = IntrospectCall();
  static GetProfileCall getProfileCall = GetProfileCall();
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
      apiUrl: '${baseUrl}/realms/${realm}/protocol/openid-connect/token',
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
      apiUrl: '${baseUrl}/realms/${realm}/protocol/openid-connect/token',
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
      apiUrl: '${baseUrl}/realms/${realm}/protocol/openid-connect/logout',
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
          '${baseUrl}/realms/${realm}/protocol/openid-connect/token/introspect',
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
      apiUrl: '${baseUrl}/realms/${realm}/protocol/openid-connect/userinfo',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}',
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

/// End Keycloak Group Code

/// Start TimeOfUse Group Code

class TimeOfUseGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static CreateTimeOfUseCall createTimeOfUseCall = CreateTimeOfUseCall();
  static DeleteTimeOfUseCall deleteTimeOfUseCall = DeleteTimeOfUseCall();
  static UpdateTimeOfUseCall updateTimeOfUseCall = UpdateTimeOfUseCall();
  static ReadTimeOfUseIdCall readTimeOfUseIdCall = ReadTimeOfUseIdCall();
  static ReadAllTimeOfUseCall readAllTimeOfUseCall = ReadAllTimeOfUseCall();
}

class CreateTimeOfUseCall {
  Future<ApiCallResponse> call({
    String? code = '0',
    String? name = '',
    String? description = '',
    dynamic dataJson,
  }) async {
    final baseUrl = TimeOfUseGroup.getBaseUrl();

    final data = _serializeJson(dataJson, true);
    final ffApiRequestBody = '''
{
  "TimeOfUse": {
    "Code": "${escapeStringForJson(code)}",
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "TimeOfUseDetails": {
      "on_conflict": {
        "constraint": "PK_TimeOfUseDetail",
        "update_columns": [
          "TimeBandId",
          "ChannelId",
          "RegisterDisplayCode",
          "PriorityOrder",
          "Active"
        ]
      },
      "data": ${data}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create TimeOfUse',
      apiUrl: '${baseUrl}/api/rest/TimeOfUse/',
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

class DeleteTimeOfUseCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TimeOfUseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Time Of Use',
      apiUrl: '${baseUrl}/api/rest/TimeOfUse/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

class UpdateTimeOfUseCall {
  Future<ApiCallResponse> call({
    int? id,
    String? code = '0',
    String? name = '',
    String? description = '',
    dynamic dataJson,
  }) async {
    final baseUrl = TimeOfUseGroup.getBaseUrl();

    final data = _serializeJson(dataJson, true);
    final ffApiRequestBody = '''
{
  "TimeOfUse": {
    "Id": "${id}",
    "Code": "${escapeStringForJson(code)}",
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "TimeOfUseDetails": {
      "on_conflict": {
        "constraint": "PK_TimeOfUseDetail",
        "update_columns": [
          "TimeBandId",
          "ChannelId",
          "RegisterDisplayCode",
          "PriorityOrder",
          "Active"
        ]
      },
      "data": ${data}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update TimeOfUse',
      apiUrl: '${baseUrl}/api/rest/TimeOfUse/',
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

class ReadTimeOfUseIdCall {
  Future<ApiCallResponse> call({
    int? id,
    bool? includeTimeOfUseDetails = true,
  }) async {
    final baseUrl = TimeOfUseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Time Of Use Id',
      apiUrl: '${baseUrl}/api/rest/TimeOfUse/${id}',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'includeTimeOfUseDetails': includeTimeOfUseDetails,
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

class ReadAllTimeOfUseCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    bool? includeTimeOfUseDetails = true,
    int? limit = 25,
    int? offset = 0,
  }) async {
    final baseUrl = TimeOfUseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All Time Of Use',
      apiUrl: '${baseUrl}/api/rest/TimeOfUse',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'search': search,
        'includeTimeOfUseDetails': includeTimeOfUseDetails,
        'limit': limit,
        'offset': offset,
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

/// End TimeOfUse Group Code

/// Start Devices Group Code

class DevicesGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadDeviceByIdCall readDeviceByIdCall = ReadDeviceByIdCall();
  static UpdateDeviceCall updateDeviceCall = UpdateDeviceCall();
  static ReadDeviceMetricsByIdCall readDeviceMetricsByIdCall =
      ReadDeviceMetricsByIdCall();
  static ReadDeviceMetricsByIdVTowCall readDeviceMetricsByIdVTowCall =
      ReadDeviceMetricsByIdVTowCall();
  static UpdateDeviceListCall updateDeviceListCall = UpdateDeviceListCall();
  static UpdateDeviceScheduleCall updateDeviceScheduleCall =
      UpdateDeviceScheduleCall();
  static LinkHESCall linkHESCall = LinkHESCall();
  static DeleteDeviceCall deleteDeviceCall = DeleteDeviceCall();
  static CreateDeviceCall createDeviceCall = CreateDeviceCall();
  static ReadAllDevicesCall readAllDevicesCall = ReadAllDevicesCall();
  static ReadDeviceFilterCall readDeviceFilterCall = ReadDeviceFilterCall();
}

class ReadDeviceByIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Device by Id',
      apiUrl: '${baseUrl}/api/rest/Device/${id}',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

class UpdateDeviceCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? name = '',
    String? serialNumber = '',
    String? deviceType = '',
    String? model = '',
    String? manufacturer = '',
    String? status = '',
    String? linkStatus = '',
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Device": {
    "SerialNumber": "${escapeStringForJson(serialNumber)}",
    "Name": "${escapeStringForJson(name)}",
    "DeviceType": "${escapeStringForJson(deviceType)}",
    "Model": "${escapeStringForJson(model)}",
    "Manufacturer": "${escapeStringForJson(manufacturer)}",
    "Status": "${escapeStringForJson(status)}",
    "LinkStatus": "${escapeStringForJson(linkStatus)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Device',
      apiUrl: '${baseUrl}/api/rest/Device/${id}',
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

class ReadDeviceMetricsByIdCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
    int? limit = 25,
    int? offset = 0,
    dynamic jsonLabelJson,
    String? id = '',
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final jsonLabel = _serializeJson(jsonLabelJson);
    final ffApiRequestBody = '''
{
  "startDate": "${escapeStringForJson(startDate)}",
  "endDate": "${escapeStringForJson(endDate)}",
  "limit": ${limit},
  "offset": ${offset},
  "jsonLabel": ${jsonLabel}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Read Device Metrics by Id',
      apiUrl: '${baseUrl}/api/rest/v1/Device/${id}/Matrics',
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

class ReadDeviceMetricsByIdVTowCall {
  Future<ApiCallResponse> call({
    int? limit = 25,
    int? offset = 0,
    String? id = '',
    dynamic whereJson,
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final where = _serializeJson(whereJson);
    final ffApiRequestBody = '''
{
  "limit": ${limit},
  "offset": ${offset},
  "where": ${where}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Read Device Metrics by IdVTow',
      apiUrl: '${baseUrl}/api/rest/v1/Device/${id}/MatricsV2',
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

class UpdateDeviceListCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? name = '',
    String? serialNumber = '',
    String? deviceType = '',
    String? model = '',
    String? manufacturer = '',
    String? status = '',
    String? linkStatus = '',
    dynamic deviceJson,
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final device = _serializeJson(deviceJson);
    final ffApiRequestBody = '''
{
  "Device": ${device}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update DeviceList',
      apiUrl: '${baseUrl}/api/rest/Device/${id}',
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

class UpdateDeviceScheduleCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? status = '',
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Schedule": {
    "Status": "${escapeStringForJson(status)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Device Schedule',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule/${id}',
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

class LinkHESCall {
  Future<ApiCallResponse> call({
    String? deviceId = '',
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "DeviceId": "${escapeStringForJson(deviceId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Link HES',
      apiUrl: '${baseUrl}/api/rest/v1/Device/LinkHes',
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

class DeleteDeviceCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Device',
      apiUrl: '${baseUrl}/api/rest/Device/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

class CreateDeviceCall {
  Future<ApiCallResponse> call({
    String? serialNumber = '',
    String? deviceType = '',
    String? model = '',
    String? manufacturer = '',
    String? status = '',
    String? linkStatus = '',
    String? name = '',
    int? deviceGroupId,
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Device": {
    "SerialNumber": "${escapeStringForJson(serialNumber)}",
    "Name": "${escapeStringForJson(name)}",
    "DeviceType": "${escapeStringForJson(deviceType)}",
    "Model": "${escapeStringForJson(model)}",
    "Manufacturer": "${escapeStringForJson(manufacturer)}",
    "Status": "${escapeStringForJson(status)}",
    "LinkStatus": "${escapeStringForJson(linkStatus)}",
    "DeviceGroupId": ${deviceGroupId}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Device',
      apiUrl: '${baseUrl}/api/rest/Device',
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

class ReadAllDevicesCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    int? offset = 0,
    int? limit = 25,
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All Devices',
      apiUrl: '${baseUrl}/api/rest/Device',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'search': search,
        'offset': offset,
        'limit': limit,
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

class ReadDeviceFilterCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    int? offset = 0,
    int? limit = 25,
    int? deviceGroupId,
  }) async {
    final baseUrl = DevicesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "filter": {
    "DeviceGroupId": {
      "_eq": ${deviceGroupId}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Read Device Filter',
      apiUrl:
          '${baseUrl}/api/rest/v1/Device/Filter?search=${search}&limit=${limit}&offset=${offset}',
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

/// End Devices Group Code

/// Start Channels Group Code

class ChannelsGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadAllChannelsCall readAllChannelsCall = ReadAllChannelsCall();
  static ReadChannelsCall readChannelsCall = ReadChannelsCall();
}

class ReadAllChannelsCall {
  Future<ApiCallResponse> call({
    String? search = '',
    int? limit = 25,
    int? offset = 0,
  }) async {
    final baseUrl = ChannelsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All Channels',
      apiUrl: '${baseUrl}/api/rest/Channel',
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
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReadChannelsCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = ChannelsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Channels',
      apiUrl: '${baseUrl}/api/rest/Channel/${id}',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

/// End Channels Group Code

/// Start Sites Group Code

class SitesGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static GetAllSitesCall getAllSitesCall = GetAllSitesCall();
  static GetSiteByIDCall getSiteByIDCall = GetSiteByIDCall();
  static UpdateSiteCall updateSiteCall = UpdateSiteCall();
  static GetAllSitesVTwoCall getAllSitesVTwoCall = GetAllSitesVTwoCall();
  static CreateSiteCall createSiteCall = CreateSiteCall();
  static DeleteSiteCall deleteSiteCall = DeleteSiteCall();
}

class GetAllSitesCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? includeSubSite = 'true',
  }) async {
    final baseUrl = SitesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Sites',
      apiUrl:
          '${baseUrl}/api/rest/Site?search=%25${search}%25&includeSubSite=true&limit=25&offset=0',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'includeSubSite': includeSubSite,
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

class GetSiteByIDCall {
  Future<ApiCallResponse> call({
    int? id,
    bool? includeSubSite = true,
    String? search = '%%',
  }) async {
    final baseUrl = SitesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Site by ID',
      apiUrl: '${baseUrl}/api/rest/Site/${id}',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'includeSubSite': includeSubSite,
        'search': search,
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

class UpdateSiteCall {
  Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? description = '',
    int? parentId,
  }) async {
    final baseUrl = SitesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Site": {
"ParentId":${parentId},
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Site',
      apiUrl: '${baseUrl}/api/rest/Site/${id}',
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

class GetAllSitesVTwoCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    bool? includeSubSite = true,
    int? limit = 25,
    int? offset = 0,
  }) async {
    final baseUrl = SitesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get All SitesVTwo',
      apiUrl: '${baseUrl}/api/rest/v2/Site',
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
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSiteCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    int? parentId,
  }) async {
    final baseUrl = SitesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Site": {
    "Name": "${escapeStringForJson(name)}",
    "Description": "${escapeStringForJson(description)}",
    "ParentId": ${parentId}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create site',
      apiUrl: '${baseUrl}/api/rest/Site',
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

class DeleteSiteCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = SitesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Site',
      apiUrl: '${baseUrl}/api/rest/Site/${id}',
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

/// End Sites Group Code

/// Start TimeOfUseDetail Group Code

class TimeOfUseDetailGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static CreateTimeOfUseDetailCall createTimeOfUseDetailCall =
      CreateTimeOfUseDetailCall();
  static DeleteTimeOfUseDetailCall deleteTimeOfUseDetailCall =
      DeleteTimeOfUseDetailCall();
  static UpdateTimeOfUseDetailCall updateTimeOfUseDetailCall =
      UpdateTimeOfUseDetailCall();
  static ReadTimeOfUseDetailCall readTimeOfUseDetailCall =
      ReadTimeOfUseDetailCall();
}

class CreateTimeOfUseDetailCall {
  Future<ApiCallResponse> call({
    int? timeOfUseId,
    int? timeBandId,
    int? channelId,
    String? registerDisplayCode = '',
    int? priorityOrder,
  }) async {
    final baseUrl = TimeOfUseDetailGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "TimeOfUseDetail": {
    "TimeOfUseId": ${timeOfUseId},
    "TimeBandId": ${timeBandId},
    "ChannelId": ${channelId},
    "RegisterDisplayCode": "${escapeStringForJson(registerDisplayCode)}",
    "PriorityOrder": ${priorityOrder}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Time Of Use Detail',
      apiUrl: '${baseUrl}/api/rest/TimeOfUseDetail',
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

class DeleteTimeOfUseDetailCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TimeOfUseDetailGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Time Of Use Detail',
      apiUrl: '${baseUrl}/api/rest/TimeOfUseDetail/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

class UpdateTimeOfUseDetailCall {
  Future<ApiCallResponse> call({
    int? id,
    int? timeOfUseId,
    int? timeBandId,
    int? channelId,
    String? registerDisplayCode = '',
    int? priorityOrder,
  }) async {
    final baseUrl = TimeOfUseDetailGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "TimeOfUseDetail": {
    "TimeOfUseId": ${timeOfUseId},
    "TimeBandId": ${timeBandId},
    "ChannelId": ${channelId},
    "RegisterDisplayCode": "${escapeStringForJson(registerDisplayCode)}",
    "PriorityOrder": ${priorityOrder}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Time Of Use Detail',
      apiUrl: '${baseUrl}/api/rest/TimeOfUseDetail/${id}',
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

class ReadTimeOfUseDetailCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TimeOfUseDetailGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Time Of Use Detail',
      apiUrl: '${baseUrl}/api/rest/TimeOfUseDetail/${id}',
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

/// End TimeOfUseDetail Group Code

/// Start Schedule Group Code

class ScheduleGroup {
  static String getBaseUrl() => 'https://mdms.oone.bz';
  static Map<String, String> headers = {
    'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
  };
  static ReadScheduleByIdCall readScheduleByIdCall = ReadScheduleByIdCall();
  static ReadScheduleByDeviceIdCall readScheduleByDeviceIdCall =
      ReadScheduleByDeviceIdCall();
  static ReadScheduleByDeviceGroupCall readScheduleByDeviceGroupCall =
      ReadScheduleByDeviceGroupCall();
  static ReadScheduleDeviceIdCall readScheduleDeviceIdCall =
      ReadScheduleDeviceIdCall();
  static UpdateScheduleCall updateScheduleCall = UpdateScheduleCall();
  static ReadScheduleDeviceGroupIdCall readScheduleDeviceGroupIdCall =
      ReadScheduleDeviceGroupIdCall();
  static ReadAllScheduleCall readAllScheduleCall = ReadAllScheduleCall();
  static DeleteScheduleCall deleteScheduleCall = DeleteScheduleCall();
  static CreateScheduleCall createScheduleCall = CreateScheduleCall();
}

class ReadScheduleByIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Schedule by Id',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule/${id}',
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

class ReadScheduleByDeviceIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Schedule by DeviceId',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule/Device/${id}',
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

class ReadScheduleByDeviceGroupCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Schedule by DeviceGroup',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule/DeviceGroup/${id}',
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

class ReadScheduleDeviceIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Schedule DeviceId',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule/Device/${id}',
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

class UpdateScheduleCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
    String? scheduleType = '',
    String? interval = '',
    int? retryCount = 0,
    String? status = '',
    String? id = '',
    dynamic dataJson,
    String? nextExecuteTime = '',
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
  "Schedule": {
    "Id": "${escapeStringForJson(id)}",
    "ScheduleType": "${escapeStringForJson(scheduleType)}",
    "Interval": "${escapeStringForJson(interval)}",
    "StartDate": "${escapeStringForJson(startDate)}",
    "EndDate": "${escapeStringForJson(endDate)}",
    "NextExecuteTime": "${escapeStringForJson(nextExecuteTime)}",
    "RetryCount": ${retryCount},
    "Status": "${escapeStringForJson(status)}",
    "BillingDevice": {
      "data": ${data}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update  Schedule',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule',
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

class ReadScheduleDeviceGroupIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read Schedule DeviceGroupId',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule/DeviceGroup/${id}',
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

class ReadAllScheduleCall {
  Future<ApiCallResponse> call({
    String? search = '%%',
    int? limit = 25,
    int? offset = 0,
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Read All Schedule',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule',
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
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteScheduleCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Schedule',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'x-hasura-admin-secret': '4)-g&M0siAov3Fl4O',
      },
      params: {
        'Id': id,
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

class CreateScheduleCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
    String? scheduleType = '',
    String? interval = '',
    dynamic dataJson,
    int? retryCount = 0,
    String? status = '',
    String? nextExecuteTime = '',
  }) async {
    final baseUrl = ScheduleGroup.getBaseUrl();

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
  "Schedule": {
    "ScheduleType": "${escapeStringForJson(scheduleType)}",
    "Interval": "${escapeStringForJson(interval)}",
    "StartDate": "${escapeStringForJson(startDate)}",
    "EndDate": "${escapeStringForJson(endDate)}",
    "NextExecuteTime": "${escapeStringForJson(nextExecuteTime)}",
    "RetryCount": ${retryCount},
    "Status": "${escapeStringForJson(status)}",
    "BillingDevice": {
      "data": ${data}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Schedule',
      apiUrl: '${baseUrl}/api/rest/v1/Schedule',
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

/// End Schedule Group Code

class GeocodingAPICall {
  static Future<ApiCallResponse> call({
    String? locationInput = '',
    String? apiKey = 'bdcec9aead82497886fb0e68d20d82b1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GeocodingAPI',
      apiUrl:
          'https://api.opencagedata.com/geocode/v1/json?q=${locationInput}&key=${apiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'locationInput': locationInput,
        'key': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.lng''',
      ));
  static String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].formatted''',
      ));
  static dynamic latlng(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry''',
      );
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
