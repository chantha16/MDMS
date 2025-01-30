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

Future<List<String>> getKeyFromObject(dynamic jsonString) async {
  // Add your function code here!
  if (jsonString == null) return [];
  // Parse JSON string into a Dart list of maps
  String jsnStr = '';
  if (!(jsonString is String)) {
    jsnStr = jsonEncode(jsonString);
  } else {
    jsnStr = jsonString;
  }
  List<dynamic> jsonData = jsonDecode(jsnStr);

  // Ensure the list is not empty
  if (jsonData.isNotEmpty && jsonData[0] is Map<String, dynamic>) {
    Map<String, dynamic> firstItem = jsonData[0];

    List<String> columnName = [];

    // Iterate through key-value pairs
    firstItem.forEach((key, value) {
      if (key.toLowerCase() != 'id') {
        columnName.add(key);
      }
    });
    return columnName;
  }
  return [];
}
