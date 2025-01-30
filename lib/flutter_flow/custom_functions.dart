import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

int calculateTotalPages(
  int totalItems,
  int limit,
) {
  if (limit == 0) return 0; // Avoid division by zero
  return (totalItems / limit).ceil(); // Calculate and round up
}

List<String> apiResponseKey(List<dynamic> response) {
  if (response.isNotEmpty && response.first is Map<String, dynamic>) {
    // Extract keys from the first map in the list
    return (response.first as Map<String, dynamic>).keys.toList();
  }
  // Return an empty list if the response is empty or not a map
  return [];
}

int calculateOffset(
  int currentPage,
  int limit,
) {
  return ((currentPage - 1) * limit).ceil();
}

List<dynamic> apiResponseValue(List<dynamic> response) {
  if (response.isEmpty || response.first is! Map<String, dynamic>) {
    return [];
  }

  // Extract rows as a list of lists
  return response.map((item) {
    if (item is Map<String, dynamic>) {
      return item.values.map((value) => value.toString()).toList();
    }
    return [];
  }).toList();
}

List<String> splitStringByComma(String input) {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  // Check if input is null or empty, return an empty list
  if (input.isEmpty) {
    return [];
  }

  // Split the input string by comma, parse and filter valid month indices
  final List<String> result = input
      .split(',')
      .map((index) => int.tryParse(index.trim())) // Convert to integers
      .where((monthIndex) =>
          monthIndex != null &&
          monthIndex >= 1 &&
          monthIndex <= 12) // Filter valid indices
      .map((validIndex) => months[validIndex! - 1]) // Map to month names
      .toList(); // Return as list of strings

  // Return the formatted string
  return result.map((month) => '$month').toList();
}

String convertRowToValues(dynamic row) {
  if (row == null) {
    return '-';
  }
  return row.toString();
}

String convertMonth(List<String> monthRange) {
  // Define a map of month names to their indices
  final Map<String, int> monthMap = {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12,
  };

  // Convert the input list to lowercase and map to indices
  final List<int> indices = monthRange
      //.map((month) => month.toLowerCase().trim()) // Normalize month names
      .where((month) => monthMap.containsKey(month)) // Filter valid months
      .map((month) => monthMap[month]!) // Map to indices
      .toList();

  // Join indices with a comma separator
  return indices.join(',');
}

List<String> filterVisibleColumns(
  List<String> hiddenColumns,
  List<String> columnHeaders,
  List<String> rowValues,
) {
  // Map headers to values and filter based on hidden columns
  final visibleValues = <String>[];
  for (var i = 0; i < columnHeaders.length; i++) {
    if (!hiddenColumns.contains(columnHeaders[i])) {
      visibleValues.add(rowValues[i].toString());
    }
  }

  return visibleValues;
}

int roundUpToInteger(double num) {
  //if (num > 0 && num < 1) {
  //return 1;
  //}
  //return num.round();

  return num > 0 && num != num.toInt() ? num.ceil() : num.toInt();
}

bool isOdd(int value) {
  return value.isOdd;
}

int increment(int value) {
  return value + 1;
}

int getListIndexById(
  List<ColumnModelStruct> list,
  int id,
) {
  var targetIndex = list.indexWhere((element) => element.id == id);
  return targetIndex;
}

List<RowModelStruct> onCellVisibility(
  List<RowModelStruct> rows,
  List<int> columnIds,
) {
  final newRows = rows.map((e) {
    e.cell = e.cell.map((c) {
      if (columnIds.contains(c.columnId)) {
        c.isHidden = true;
      } else {
        c.isHidden = false;
      }
      return c;
    }).toList();
    return e;
  }).toList();
  return newRows;
}

List<int> getHiddenColumnId(List<ColumnModelStruct> columns) {
  final columnIds = columns.map((e) {
    if (e.isHidden) {
      return e.id;
    }
    return 0;
  }).toList();
  columnIds.removeWhere((e) => e == 0);
  return columnIds;
}

int paginationNumIncrement(
  int itemsPerPage,
  int currentPage,
  int index,
) {
  int orderNum = (currentPage - 1) * itemsPerPage + index + 1;
  return orderNum;
}

bool checkSelectAllRows(List<RowModelStruct> rows) {
  bool selectAll = rows.every((row) => row.selected);
  print('selected all row = $selectAll');
  return selectAll;
}

List<RowModelStruct> updateRowsToSelectAll(
  List<RowModelStruct> rows,
  bool isSelectedAll,
) {
  List<RowModelStruct> selectAllRows = rows.map((e) {
    e.selected = isSelectedAll;
    return e;
  }).toList();
  return selectAllRows;
}

String? escapeSpecialCharacters(String? specialCharacters) {
  if (specialCharacters == null) return null;

  // Escape all special characters to avoid search mismatches
  return specialCharacters.replaceAllMapped(
      RegExp(r'[.*+?^${}()|[\]\\]'), (match) => '\\${match[0]}');
}

int calculateCurrentPage(
  int offset,
  int limit,
) {
  return (offset / limit).floor() + 1;
}

int? validatePageNumber(
  String input,
  int totalPage,
) {
  int? value = int.tryParse(input);
  if (value == null || value < 1) {
    return 1;
  } else if (value > totalPage) {
    return totalPage;
  } else {
    return value;
  }
  // Valid input
}
