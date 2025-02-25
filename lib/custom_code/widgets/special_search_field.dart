// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:epower_library_llyhdh/backend/schema/structs/index.dart"
    as epower_library_llyhdh_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SpecialSearchField extends StatelessWidget {
  final Function(String) onSearch;

  const SpecialSearchField({Key? key, required this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // Call the search function with encoded text
        final encodedValue = Uri.encodeComponent(value);
        onSearch(encodedValue);
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
