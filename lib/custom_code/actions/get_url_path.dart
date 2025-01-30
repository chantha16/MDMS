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

Future<String> getUrlPath() async {
  final uri = Uri.parse(html.window.location.href);
  String url = '';
  if (uri.port != 0 && uri.host.contains('localhost')) {
    url = '${uri.host}:${uri.port}';
  } else {
    url = '${uri.host}';
  }

  if (uri.host.contains('localhost')) {
    url = 'http://$url';
  } else {
    url = 'https://$url';
  }

  if (url.endsWith('/')) {
    url = url.substring(0, url.length - 1);
  }

  // This was run on flutterflow debug server
  if (url.contains('.run.app')) {
    url = '$url${uri.path}';
  }
  FFAppState().urlPath = url;
  return url;
}
