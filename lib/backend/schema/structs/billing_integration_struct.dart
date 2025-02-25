// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillingIntegrationStruct extends BaseStruct {
  BillingIntegrationStruct({
    String? url,
  }) : _url = url;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static BillingIntegrationStruct fromMap(Map<String, dynamic> data) =>
      BillingIntegrationStruct(
        url: data['url'] as String?,
      );

  static BillingIntegrationStruct? maybeFromMap(dynamic data) => data is Map
      ? BillingIntegrationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static BillingIntegrationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BillingIntegrationStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BillingIntegrationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BillingIntegrationStruct && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([url]);
}

BillingIntegrationStruct createBillingIntegrationStruct({
  String? url,
}) =>
    BillingIntegrationStruct(
      url: url,
    );
