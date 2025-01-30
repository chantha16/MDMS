// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:universal_html/html.dart' as html;

Future openWebLogin() async {
  final redirectUrl = await getUrlPath();
  final issuer = FFDevEnvironmentValues().issuer;
  final authUrl = Uri.parse('$issuer/protocol/openid-connect/auth')
      .replace(queryParameters: {
    'client_id': FFDevEnvironmentValues().clientId,
    'redirect_uri': redirectUrl,
    'response_type': FFAppConstants.responseType,
    'scope': FFDevEnvironmentValues().scope,
    'client_secret': FFDevEnvironmentValues().clientSecret
  });

  html.window.location.href = authUrl.toString();
}
