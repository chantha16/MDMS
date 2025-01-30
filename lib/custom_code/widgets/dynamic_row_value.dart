// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class DynamicRowValue extends StatefulWidget {
  const DynamicRowValue({
    super.key,
    this.width,
    this.height,
    required this.row,
    required this.columnHeaders,
    required this.isAscending,
    this.maxLines,
  });

  final double? width;
  final double? height;
  final dynamic row; // Dynamic row data (JSON)
  final List<String> columnHeaders; // List of column headers for sorting
  final bool isAscending; // Sorting order: true for ASC, false for DESC
  final int? maxLines;

  @override
  State<DynamicRowValue> createState() => _DynamicRowValueState();
}

class _DynamicRowValueState extends State<DynamicRowValue> {
  @override
  Widget build(BuildContext context) {
    // Validate if `row` is a map
    if (widget.row is! Map<String, dynamic>) {
      return const Center(
        child: Text(
          'Invalid data format',
          style: TextStyle(color: Colors.red, fontSize: 14.0),
        ),
      );
    }

    final Map<String, dynamic> rowData = widget.row as Map<String, dynamic>;

    // Sort the row data based on columnHeaders and isAscending
    final sortedEntries = widget.columnHeaders
        .map((header) => MapEntry(header, rowData[header] ?? '--'))
        .toList();

    if (!widget.isAscending) {
      sortedEntries.sort((a, b) => b.key.compareTo(a.key)); // Sort DESC
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: sortedEntries.map((entry) {
        final value = entry.value ?? '--';
        return Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              value.toString(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 14.0),
              maxLines: widget.maxLines ?? 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
