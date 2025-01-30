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

class DynamicListViewWidget extends StatefulWidget {
  const DynamicListViewWidget({
    super.key,
    this.width,
    this.height,
    required this.items,
  });

  final double? width;
  final double? height;
  final List<dynamic> items;

  @override
  State<DynamicListViewWidget> createState() => _DynamicListViewWidgetState();
}

class _DynamicListViewWidgetState extends State<DynamicListViewWidget> {
  @override
  Widget build(BuildContext context) {
    // Check if items are empty
    if (widget.items.isEmpty) {
      return Center(
        child: Text(
          'No data available',
          style: TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
      );
    }

    // Validate that all items are maps
    final validItems =
        widget.items.where((item) => item is Map<String, dynamic>).toList();

    if (validItems.isEmpty) {
      return Center(
        child: Text(
          'Invalid data format',
          style: TextStyle(fontSize: 16.0, color: Colors.red),
        ),
      );
    }

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: ListView.builder(
        itemCount: validItems.length,
        itemBuilder: (context, index) {
          final row = validItems[index] as Map<String, dynamic>;

          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: row.entries.map((entry) {
                final value = entry.value ?? 'N/A'; // Handle null values
                return Expanded(
                  child: Text(
                    value.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
