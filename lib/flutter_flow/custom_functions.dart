import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';
import "package:epower_library_llyhdh/backend/schema/structs/index.dart"
    as epower_library_llyhdh_data_schema;
import 'package:date_range_picker_marketplace_library_h3b4w8/flutter_flow/custom_functions.dart'
    as date_range_picker_marketplace_library_h3b4w8_functions;
import 'package:epower_library_llyhdh/flutter_flow/custom_functions.dart'
    as epower_library_llyhdh_functions;

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

String convertRowToValues(dynamic row) {
  if (row == null) {
    return '-';
  }
  return row.toString();
}

List<int> convertMonthsToInt(List<String> months) {
  const Map<String, int> monthMap = {
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

  // Convert the input list of month abbreviations to their corresponding integers
  return months.map((month) {
    // Check if the month abbreviation exists in the map
    if (monthMap.containsKey(month)) {
      return monthMap[month]!;
    } else {
      // Handle the case where the month abbreviation is not recognized
      throw ArgumentError('Invalid month abbreviation: $month');
    }
  }).toList();
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

bool isOdd(int value) {
  return value.isOdd;
}

List<String> splitStringByCommaMonthofYear(List<int> input) {
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

  // Filter valid month indices and map to month names
  final List<String> result = input
      .where((monthIndex) =>
          monthIndex >= 1 &&
          monthIndex <= 12) // Filter valid indices (1-12 for months)
      .map((validIndex) => months[validIndex - 1]) // Map to month names
      .toList(); // Return as list of strings

  // Return the formatted string
  return result.map((month) => '$month').toList();
}

int increment(int value) {
  return value + 1;
}

List<String> splitStringByCommaDayofWeek(List<int> input) {
  final List<String> daysOfWeek = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  // Check if input is null or empty, return an empty list
  if (input.isEmpty) {
    return [];
  }

  // Filter valid day indices and map to day names
  final List<String> result = input
      .where((dayIndex) =>
          dayIndex >= 0 &&
          dayIndex <= 6) // Filter valid indices (0-6 for days of the week)
      .map((validIndex) => daysOfWeek[validIndex]) // Map to day names
      .toList(); // Return as list of strings

  // Return the formatted string
  return result.map((day) => '$day').toList();
}

int getListIndexById(
  List<ColumnModelStruct> list,
  int id,
) {
  var targetIndex = list.indexWhere((element) => element.id == id);
  return targetIndex;
}

int validateTimeNumber(
  String input,
  int maxNumber,
) {
  int? value = int.tryParse(input);
  if (value == null || value < 0) {
    return 0;
  } else if (value > maxNumber) {
    return 0;
  } else {
    return value;
  }
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

int caluclationOffset(
  int currentPage,
  int limit,
) {
  return ((currentPage - 1) * limit).ceil();
}

int calculateOffset(
  int currentPage,
  int limit,
) {
  return ((currentPage - 1) * limit).ceil();
}

int calculateCurrentPage(
  int offset,
  int limit,
) {
  return (offset / limit).floor() + 1;
}

int validatePageNumber(
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
}

int calulationTotalPages(
  int totalItems,
  int limit,
) {
  if (limit == 0) return 0; // Avoid division by zero
  return (totalItems / limit).ceil(); // Calculate and round up
}

int calculationCurrentPage(
  int offset,
  int limit,
) {
  return (offset / limit).floor() + 1;
}

DateTime convertTimestampFrom(String timestamp) {
  DateTime dateTime =
      DateTime.parse(timestamp).toLocal(); // Parse the ISO string into DateTime

  return dateTime;
  // Format the DateTime in 24-hour format
}

int? validationPageInputNo(
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

int roundUpToInteger(double num) {
  //if (num > 0 && num < 1) {
  //return 1;
  //}
  //return num.round();

  return num > 0 && num != num.toInt() ? num.ceil() : num.toInt();
}

String? escapeSpecialCharacters(String? specialCharacters) {
  if (specialCharacters == null) return null;

  // Escape all special characters to avoid search mismatches
  return specialCharacters.replaceAllMapped(
      RegExp(r'[.*+?^${}()|[\]\\]'), (match) => '\\${match[0]}');
}

String? handleApiError(
  String errors,
  String? name,
) {
  // HandleError from api return string
  if (errors.isEmpty) {
    return null;
  }

  // Handle specific error cases
  if (errors.contains('Uniqueness violation.')) {
    return 'This name "${name}" already exists.';
  } else if (errors.contains('Not Found')) {
    return 'Not Found Error: The requested resource was not found';
  } else {
    return 'An error occurred: $errors';
  }
}

List<String> listStringExclude(
  List<String> list1,
  List<String> list2,
) {
  // it still error
  List<String> result = [];

  for (String item in list1) {
    if (!list2.contains(item)) {
      result.add(item);
    }
  }

  return result;
}

String formatScientificNotation(double value) {
  return value.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => ',',
      );
}

DateTime getCurrentDate() {
  return DateTime.now(); // Returns the full current date and time
}

DateTime getTomorrowDate() {
  return DateTime.now().toUtc().add(Duration(hours: 7)); // Adjust to UTC+7
  // now = DateTime.now().toUtc().add(Duration(hours: 7)); // Adjust to UTC+7
  //return now.add(Duration(days: 1)); // Add 1 day to the adjusted time
}

String formatTimestamp(String timestamp) {
  DateTime dateTime =
      DateTime.parse(timestamp); // Parse the ISO string into DateTime
  return DateFormat('yyyy-MM-dd HH:mm')
      .format(dateTime); // Format the DateTime in 24-hour format
}

List<String> convertTimeToHours(
  String? startTime,
  String? endTime,
) {
  List<String> hoursList = [];

  // Check for null values
  if (startTime == null || endTime == null) {
    return hoursList; // Return an empty list if any input is null
  }

  try {
    // Parse hours from HH:mm:ss format
    int startHour = int.parse(startTime.split(":")[0]);
    int endHour = int.parse(endTime.split(":")[0]);

    // Validate time range
    if (startHour > endHour) {
      return hoursList; // Return empty list if range is invalid
    }

    // Loop through hours and add to list
    for (int i = startHour; i <= endHour; i++) {
      hoursList.add(i.toString().padLeft(2, '0')); // Ensure two-digit format
    }
  } catch (e) {
    // Handle parsing errors gracefully
    return hoursList;
  }

  return hoursList;
}

String getCurrentDateString() {
  DateTime date = DateTime.now();
  // Set time to 00:00:00.000
  DateTime startOfDay =
      date.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0);

  // Format to the desired format with time zone +07
  DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'+07'");
  return dateFormat.format(startOfDay);
}

List<String> convertDayNumToString(List<int> inputDay) {
  final List<String> daysOfWeek = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  // Check if input is null or empty, return an empty list
  if (inputDay.isEmpty) {
    return [];
  }

  // Filter valid day indices and map to day names
  final List<String> result = inputDay
      .where((dayIndex) =>
          dayIndex >= 0 &&
          dayIndex <= 6) // Filter valid indices (0-6 for days of the week)
      .map((validIndex) => daysOfWeek[validIndex]) // Map to day names
      .toList(); // Return as list of strings

  // Return the formatted string
  return result.map((day) => '$day').toList();
}

String getTmrDateString() {
  // Get tomorrow's date
  DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  // Set time to 23:59:59.999 and adjust for +07 timezone
  DateTime tomorrowEnd =
      tomorrow.copyWith(hour: 23, minute: 59, second: 59, millisecond: 999);

  // Format to the desired format with time zone +07
  DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'+'00:00");
  return dateFormat
      .format(tomorrowEnd)
      .replaceFirst('00:00', '07'); // Replace timezone with +07
}

String convertListIntToListString(List<int> list) {
  final lst = list.map((e) => e.toString()).toList();
  return lst.toString();
}

dynamic convertToApiFormat(dynamic inputJson) {
  return inputJson.map((key, value) {
    // Define a mapping for the required keys
    final newKey = {
          "and": "_and",
          "or": "_or",
          "contains": "_contains",
          "gte": "_gte",
          "lte": "_lte"
        }[key] ??
        key; // Keep the key unchanged if not in the mapping

    // If the value is a Map, recursively apply the conversion
    if (value is Map<String, dynamic>) {
      return MapEntry(newKey, convertToApiFormat(value));
    }
    // If the value is a List, process each item
    else if (value is List) {
      return MapEntry(newKey, value.map((e) => convertToApiFormat(e)).toList());
    }
    return MapEntry(newKey, value);
  });
}

List<int> convertDaysToInt(List<String> days) {
  const Map<String, int> dayMap = {
    'Sun': 0,
    'Mon': 1,
    'Tue': 2,
    'Wed': 3,
    'Thu': 4,
    'Fri': 5,
    'Sat': 6,
  };

  // Convert the input list of day abbreviations to their corresponding integers
  return days.map((day) {
    // Check if the day abbreviation exists in the map
    if (dayMap.containsKey(day)) {
      return dayMap[day]!;
    } else {
      // Handle the case where the day abbreviation is not recognized
      throw ArgumentError('Invalid day abbreviation: $day');
    }
  }).toList();
}

dynamic createApiQuery(
  List<String>? unitsList,
  String? startDate,
  String? endDate,
  List<String>? phases,
  List<String>? apportionPolicies,
  List<String>? flowDirections,
) {
  // Initialize _and conditions list
  List<Map<String, dynamic>> andConditions = [];

  // Add Start Date filter (if provided)
  if (startDate != null && startDate.isNotEmpty) {
    andConditions.add({
      "Timestamp": {"_gte": startDate}
    });
  }

  // Add End Date filter (if provided)
  if (endDate != null && endDate.isNotEmpty) {
    andConditions.add({
      "Timestamp": {"_lte": endDate}
    });
  }

  // Function to create _or conditions dynamically
  Map<String, dynamic> buildOrCondition(String field, List<String> values) {
    if (values.isEmpty) return {};

    return {
      "_or": values.map((value) {
        return {
          "Labels": {
            "_contains": {field: value}
          }
        };
      }).toList()
    };
  }

  // Add filters only if the list is not empty
  if (unitsList != null && unitsList.isNotEmpty) {
    andConditions.add(buildOrCondition("Units", unitsList));
  }
  if (flowDirections != null && flowDirections.isNotEmpty) {
    andConditions.add(buildOrCondition("FlowDirection", flowDirections));
  }
  if (apportionPolicies != null && apportionPolicies.isNotEmpty) {
    andConditions.add(buildOrCondition("ApportionPolicy", apportionPolicies));
  }
  if (phases != null && phases.isNotEmpty) {
    andConditions.add(buildOrCondition("Phase", phases));
  }

  // Return only if _and has conditions
  return andConditions.isNotEmpty
      ? {
          "where": {
            "_and": andConditions,
          }
        }
      : {};
}

String formatTime(String time) {
  // Convert "HH:mm:ss" string to DateTime
  List<String> parts = time.split(":");
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);
  int seconds = int.parse(parts[2]);

  // Create DateTime object (dummy date, only time matters)
  DateTime parsedTime = DateTime(2024, 1, 1, hours, minutes, seconds);

  // Add 1 second
  DateTime adjustedTime = parsedTime.add(Duration(seconds: 1));

  // Format to "HH:mm" only
  String formattedTime = "${adjustedTime.hour.toString().padLeft(2, '0')}:"
      "${adjustedTime.minute.toString().padLeft(2, '0')}";

  return formattedTime;
}

dynamic buildOrCondition(List<String> unitsList) {
  if (unitsList.isEmpty) return {}; // Return empty if no data

  return {
    "or": unitsList.map((unit) {
      return {
        "Labels": {
          "contains": {"Units": unit}
        }
      };
    }).toList()
  };
}

String adjustEndTime(
  String endTime,
  bool isView,
) {
  // Convert "HH:mm:ss" string to DateTime
  List<String> parts = endTime.split(":");
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);
  int seconds = int.parse(parts[2]);

  // Create DateTime object (dummy date, only time matters)
  DateTime parsedTime = DateTime(2024, 1, 1, hours, minutes, seconds);
// Adjust time based on isView flag
  DateTime adjustedTime = isView
      ? parsedTime.add(Duration(seconds: 1)) // Add 1 second for view mode
      : parsedTime.subtract(Duration(seconds: 1)); // Subtract 1 second normally
  String formattedTime;

  if (isView == true) {
    // Convert to 12-hour format and append AM/PM
    int hour12 = adjustedTime.hour == 0
        ? 12 // Midnight (00:00) should be 12 AM
        : adjustedTime.hour > 12
            ? adjustedTime.hour - 12
            : adjustedTime.hour;
    String period = adjustedTime.hour >= 12 ? " PM" : " AM";

    formattedTime =
        "$hour12:${adjustedTime.minute.toString().padLeft(2, '0')} $period";
  } else {
    // Return normal 24-hour format
    formattedTime = "${adjustedTime.hour.toString().padLeft(2, '0')}:"
        "${adjustedTime.minute.toString().padLeft(2, '0')}:"
        "${adjustedTime.second.toString().padLeft(2, '0')}";
  }

  return formattedTime;
}

dynamic queryFilterDMetrics(
  String endDate,
  String startDate,
  List<String>? unitsList,
  List<String>? phaseList,
  List<String>? apportionPolicyList,
  List<String>? flowDirectionList,
) {
  List<Map<String, dynamic>> filters = [];

  // Add Timestamp Range
  filters.add({
    "Timestamp": {
      "_gte": startDate,
    }
  });

  filters.add({
    "Timestamp": {
      "_lte": endDate,
    }
  });

  // Add Units Filter if available
  if (unitsList != null && unitsList.isNotEmpty) {
    filters.add({
      "_or": unitsList.map((unit) {
        return {
          "Labels": {
            "_contains": {
              "Units": unit,
            },
          },
        };
      }).toList(),
    });
  }

  // Add FlowDirection Filter if available
  if (flowDirectionList != null && flowDirectionList.isNotEmpty) {
    filters.add({
      "_or": flowDirectionList.map((direction) {
        return {
          "Labels": {
            "_contains": {
              "FlowDirection": direction,
            },
          },
        };
      }).toList(),
    });
  }

  // Add ApportionPolicy Filter if available
  if (apportionPolicyList != null && apportionPolicyList.isNotEmpty) {
    filters.add({
      "_or": apportionPolicyList.map((policy) {
        return {
          "Labels": {
            "_contains": {
              "ApportionPolicy": policy,
            },
          },
        };
      }).toList(),
    });
  }

  // Add Phase Filter if available
  if (phaseList != null && phaseList.isNotEmpty) {
    filters.add({
      "_or": phaseList.map((phase) {
        return {
          "Labels": {
            "_contains": {
              "Phase": phase,
            },
          },
        };
      }).toList(),
    });
  }

  // Wrap in _and condition
  return {
    "_and": filters,
  };
}

String convertListStringToString(List<String> inputList) {
  return inputList.join(', ');
}

dynamic filterMetrics(
  dynamic jsonData,
  List<String>? listFilters,
  String? listLabels,
  int limit,
  int offset,
) {
  // Ensure that the jsonData contains the 'DeviceMetrics' key and the 'Metrics' array is present
  if (!jsonData.containsKey('DeviceMetrics') ||
      jsonData['DeviceMetrics']['Metrics'] == null) {
    print('Invalid JSON structure or Metrics not found');
    return jsonData; // Return the original JSON if the structure is invalid
  }

  // Get the list of metrics
  List<dynamic> metrics = jsonData['DeviceMetrics']['Metrics'];

  // Apply filtering only if both listLabels and listFilters are not null
  List<dynamic> filteredMetrics;
  if (listLabels == null || listFilters == null || listFilters.isEmpty) {
    filteredMetrics = metrics; // No filtering, return all metrics
  } else {
    filteredMetrics = metrics.where((item) {
      final labelsMap = item["Labels"];

      // Check if labels exist and are not null
      if (labelsMap == null) {
        print('No labels found in item: $item');
        return false;
      }

      // Get the value from the labels map using listLabels (single label)
      final labelValue = labelsMap[listLabels];

      // Debugging logs
      print(
          'Checking label: $listLabels with value: $labelValue against filters: $listFilters');

      // If the labelValue is not in the selected checkbox values, exclude it
      if (labelValue == null || !listFilters.contains(labelValue)) {
        print('Label $listLabels does not match any filter values');
        return false;
      }

      return true; // Keep this item if it matches one of the checkbox values
    }).toList();
  }

  // Debug: print the length of filtered metrics
  print("Filtered Metrics Length: ${filteredMetrics.length}");

  // Apply pagination: Slice the filtered list
  int endIndex = (offset + limit) > filteredMetrics.length
      ? filteredMetrics.length
      : (offset + limit);

  // Prevent error if offset exceeds the list length
  if (offset > filteredMetrics.length) {
    endIndex = filteredMetrics.length; // Avoid out-of-bounds error
  }

  List<dynamic> paginatedMetrics = filteredMetrics.sublist(offset, endIndex);

  // Debug: print the paginated metrics
  print("Paginated Metrics: $paginatedMetrics");

  // Ensure pagination returns total number of filtered items
  int total = filteredMetrics.length;

  // Debug: print the total before returning
  print("Total (filtered items): $total");

  // Return a new JSON object with the paginated and filtered metrics (keeping the original structure)
  return {
    "DeviceMetrics": {
      "Id": jsonData['DeviceMetrics']['Id'],
      "Model": jsonData['DeviceMetrics']['Model'],
      "Metrics": paginatedMetrics
    },
    "pagination": {
      "total": total, // Total number of filtered items before pagination
      "limit": limit,
      "offset": offset
    }
  };
}

List<int> splitTimeToIntList(String time) {
  List<String> parts = time.split(":"); // Splitting string by colon ":"
  int hours = int.parse(parts[0]); // Convert the first part to hours
  int minutes = int.parse(parts[1]); // Convert the second part to minutes
  return [hours, minutes]; // Return as list of integers
}

String calculateTimeDifference(
  String startTime,
  String endTime,
) {
  // Check if startTime or endTime are empty or null
  if (startTime.isEmpty || endTime.isEmpty) {
    return 'Please enter both start and end times.';
  }

  try {
    DateTime start = DateFormat("HH:mm").parse(startTime);
    DateTime end = DateFormat("HH:mm").parse(endTime);

    // If end time is earlier than start time, add 24 hours to the end time
    if (end.isBefore(start)) {
      end = end.add(Duration(days: 1));
    }

    // Special case: If start time and end time are the same but not exactly at midnight
    if (start == end && startTime != '00:00' && endTime != '00:00') {
      return '0 hours and 0 minutes';
    }

    // Special case: If start time and end time are the same and at midnight
    if (start == end) {
      return '24 hours and 0 minutes';
    }

    Duration duration = end.difference(start);

    // Format the difference
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;
    return '$hours hours and $minutes minutes';
  } catch (e) {
    // Return a message if there is an error in parsing the times
    return 'Invalid time format. Please use the format HH:mm.';
  }
}

String checkDayMessage(
  String uiDay,
  List<String> apiDays,
) {
  if (apiDays.contains(uiDay)) {
    return "$uiDay";
  } else {
    return "$uiDay";
  }
}

Color generateColorFromIndex(int numColor) {
  // Check if color already exists for the given index
  Map<int, Color> _colorCache = {};
  if (_colorCache.containsKey(numColor)) {
    return _colorCache[numColor]!;
  }

  // Generate dynamic color based on index
  final int red = (math.Random(numColor).nextDouble() * 255).toInt();
  final int green = (math.Random(numColor + 1).nextDouble() * 255).toInt();
  final int blue = (math.Random(numColor + 2).nextDouble() * 255).toInt();

  Color generatedColor = Color.fromRGBO(red, green, blue, 1.0);

  // Store the generated color
  _colorCache[numColor] = generatedColor;

  return generatedColor;
}

String validateTimeBand(List<TimeOfUseDetailsStruct> timeOfUseDetails) {
  /// ✅ **Fix: Function to Auto-Adjust `HH:59:59` → `HH+1:00:00`**
  String _adjustEndTime(String endTime) {
    List<String> parts = endTime.split(":");
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);

    if (minutes == 59 && seconds == 59) {
      hours = (hours + 1) % 24;
      minutes = 0;
      seconds = 0;
    }

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  // Group time bands by ChannelId
  Map<int, Map<int, int>> channelDailyHours =
      {}; // { ChannelId: { Day: HoursCovered } }
  Map<int, Map<int, List<String>>> channelDailyTimeBands =
      {}; // Track time band names per channel and day
  /// ✅ **Fix Helper Function: Converts "HH:mm:ss" to Seconds**
  int _timeToSeconds(String time) {
    List<String> parts = time.split(":");
    return (int.parse(parts[0]) * 3600) +
        (int.parse(parts[1]) * 60) +
        int.parse(parts[2]);
  }

  for (var timeBand in timeOfUseDetails) {
    List<int> dayOfWeek = [];

    // Extract dayOfWeek from TimeBandAttributes
    for (var attr in timeBand.timeBand.timeBandAttributes) {
      if (attr.key == "DayOfWeek") {
        dayOfWeek = attr.value;
        break; // Stop searching once "DayOfWeek" is found
      }
    }

    // ✅ Fix: Convert `HH:59:59` to `HH+1:00:00`
    String correctedEndTime = _adjustEndTime(timeBand.timeBand.endTime);

    int startSeconds = _timeToSeconds(timeBand.timeBand.startTime);
    int endSeconds = _timeToSeconds(correctedEndTime); // Use fixed time

    // ✅ Fix: Adjust when the start time is greater than the end time
    if (endSeconds <= startSeconds) {
      endSeconds +=
          86400; // Add 24 hours (handles cases where time wraps around)
    }

    // Calculate total hours covered in this time band
    int hoursCovered =
        (endSeconds - startSeconds) ~/ 3600; // Convert seconds to hours

    // Initialize channel maps if not exists
    channelDailyHours.putIfAbsent(timeBand.channelId, () => {});
    channelDailyTimeBands.putIfAbsent(timeBand.channelId, () => {});

    for (var day in dayOfWeek) {
      channelDailyHours[timeBand.channelId]![day] =
          (channelDailyHours[timeBand.channelId]![day] ?? 0) + hoursCovered;
      channelDailyTimeBands[timeBand.channelId]![day] =
          (channelDailyTimeBands[timeBand.channelId]![day] ?? [])
            ..add(timeBand.timeBand.name);
    }
  }

  // Error messages
  List<String> errors = [];

  // Validate each channel separately
  for (var channelId in channelDailyHours.keys) {
    bool hasError = false;
    for (int i = 0; i < 7; i++) {
      if (!channelDailyHours[channelId]!.containsKey(i)) {
        hasError = true;
        break;
      } else if (channelDailyHours[channelId]![i]! != 24) {
        hasError = true;
        break;
      }
    }
    if (hasError) {
      errors.add(
          "${timeOfUseDetails.firstWhere((tb) => tb.channelId == channelId).channel.code}");
    }
  }

  return errors.isEmpty ? "True" : errors.join(" , ");
}

DateTime decreaseDate(
  int seconds,
  DateTime date,
) {
  return date.subtract(Duration(seconds: seconds));
}

List<DeviceModelStruct> selectDevices(
  List<DeviceModelStruct> selectedDevices,
  List<DeviceModelStruct> existedSelectedDevice,
  SelectDeviceOption option,
) {
  final deviceIds = existedSelectedDevice.map((e) => e.id).toList();
  switch (option) {
    case SelectDeviceOption.selectAll:
      final canSelect = selectedDevices.where((device) {
        return !deviceIds.contains(device.id);
      }).toList();
      existedSelectedDevice.addAll(canSelect);
      return List.from(existedSelectedDevice);
    case SelectDeviceOption.removeAll:
      final removeDevices = selectedDevices.map((e) => e.id).toList();
      existedSelectedDevice
          .removeWhere((device) => removeDevices.contains(device.id));
      return List.from(existedSelectedDevice);
    default:
      return [];
  }
  // if (onSelectAll) {
  //   final canSelect = selectedDevices.where((device) {
  //     return !deviceIds.contains(device.id);
  //   }).toList();
  //   existedSelectedDevice.addAll(canSelect);
  //   return List.from(existedSelectedDevice);
  // } else {
  //   final removeDevices = selectedDevices.map((e) => e.id).toList();
  //   existedSelectedDevice
  //       .removeWhere((device) => removeDevices.contains(device.id));
  //   return List.from(existedSelectedDevice);
  // }
}

bool checkSelectAllDevice(
  List<DeviceModelStruct> selectedDevices,
  List<DeviceModelStruct> existedDevices,
) {
  final deviceIds = selectedDevices.map((e) => e.id).toList();
  final selectAll = existedDevices.every((e) => deviceIds.contains(e.id));
  return selectAll;
}

List<DeviceModelStruct> addOrRemoveDevices(
  List<DeviceModelStruct> selectedDevices,
  List<DeviceModelStruct> existedDevices,
) {
  return [...selectedDevices, ...existedDevices];
}

DeviceModelStruct? findExistedDevice(
  List<DeviceModelStruct>? devices,
  DeviceModelStruct item,
) {
  if (devices == null) return null;
  final device =
      devices.firstWhere((e) => e == item, orElse: () => DeviceModelStruct());
  if (device.id.isEmpty) return null;
  return device;
}

dynamic filterAndPaginateDevices(
  List<DeviceModelStruct> deviceList,
  String searchQuery,
  int limit,
  int offset,
) {
// Step 1: Apply Search Filter (if searchQuery is not empty)
  List<DeviceModelStruct> filteredDevices = deviceList.where((device) {
    String serialNumber = device.serialNumber.toString().toLowerCase();
    return serialNumber.contains(searchQuery.toLowerCase());
  }).toList();

  // Step 2: Get Total Count Before Pagination
  int totalItems = filteredDevices.length;

  // Step 3: Apply Pagination
  int endIndex = (offset + limit) > totalItems ? totalItems : (offset + limit);
  if (offset > totalItems) {
    endIndex = totalItems; // Avoid out-of-bounds error
  }
  List<DeviceModelStruct> paginatedDevices =
      filteredDevices.sublist(offset, endIndex);

  List<Map<String, dynamic>> jsonDevices =
      paginatedDevices.map((device) => device.toMap()).toList();
  // Debug Logs (for testing)
  print("Search Query: $searchQuery");
  print("Total Filtered: $totalItems");
  print("Showing Items: $offset to $endIndex");

  // Return Paginated Data
  return {
    "TotalItems": totalItems,
    "Devices": jsonDevices.isNotEmpty ? jsonDevices : [],
  };
}

dynamic filterJson(
  String? filter,
  int limit,
  int offset,
  dynamic jsonData,
) {
  if (jsonData == null || jsonData is! Map) {
    print('Invalid JSON structure');
    return jsonData;
  }

  // Clean the filter string to remove any leading/trailing whitespace
  String cleanFilter = filter?.trim() ?? '';

  // Function to check if an item matches the filter
  bool filterItem(dynamic item) {
    if (cleanFilter.isEmpty) {
      return true; // If no filter is provided, return all items
    }

    if (item is Map) {
      // If the item is a map, check each value for the filter
      return item.values.any((value) {
        return value != null && value.toString().contains(cleanFilter);
      });
    } else if (item is String ||
        item is int ||
        item is bool ||
        item is double) {
      // If the item is a basic type, just check if it contains the filter text
      return item.toString().contains(cleanFilter);
    }
    return false; // Return false if the item is not a string, int, bool, or map
  }

  // Recursive function to filter data
  dynamic filterItems(dynamic data) {
    if (data is List) {
      // If data is a list, filter the items
      return data.where((item) {
        return filterItem(item);
      }).toList();
    } else if (data is Map) {
      // If data is a map, apply filter recursively
      return data.map((key, value) {
        return MapEntry(key, filterItems(value));
      });
    }
    return data; // Return the value if it's neither a list nor a map
  }

  // Apply the filter to the JSON data
  dynamic filteredJsonData = filterItems(jsonData);

  // Pagination logic for 'Device' field (if needed)
  if (filteredJsonData is Map && filteredJsonData.containsKey('Device')) {
    List<dynamic> filteredDevices = filteredJsonData['Device'];
    int total = filteredDevices.length;
    int endIndex = (offset + limit) > total ? total : (offset + limit);
    if (offset > total) {
      endIndex = total;
    }
    List<dynamic> paginatedDevices = filteredDevices.sublist(offset, endIndex);

    // Return the filtered and paginated JSON structure
    return {
      "Paging": filteredJsonData["Paging"],
      "Device": paginatedDevices,
      "pagination": {"total": total, "limit": limit, "offset": offset}
    };
  }

  // If 'Device' field isn't found, return the filtered JSON without pagination
  return filteredJsonData;
}

String? latLngToString(LatLng? inputLocation) {
  // Help write latLngToString
  if (inputLocation != null) {
    return '${inputLocation.latitude},${inputLocation.longitude}';
  } else {
    return null;
  }
}

List<ScheduleStruct> combineListSchedule(
  List<ScheduleStruct> scheduleID,
  List<ScheduleStruct> schdeuleGroup,
) {
  return [...scheduleID, ...schdeuleGroup];
}

DateTime convertTimestamp(String timestamp) {
  DateTime dateTime =
      DateTime.parse(timestamp).toLocal(); // Parse the ISO string into DateTime

  return dateTime;
  // Format the DateTime in 24-hour format
}

LatLng convertDoubleTolatlng(
  double? lat,
  double? lng,
) {
  lat ??= 0.0;
  lng ??= 0.0;
  // write function convert Double Tolatlng
  return LatLng(lat, lng);
}

String convertLatLngToString(LatLng latLng) {
  return '${latLng.latitude},${latLng.longitude}';
}

String increaseDateByInterval(
  String dateString,
  String interval,
) {
  try {
    // Ensure the input date is in YYYY-MM-DD format
    print("Received dateString: $dateString");

    DateTime currentDate = DateTime.parse(dateString);

    DateTime newDate = currentDate;

    // Apply interval-based increment
    if (interval == "Daily") {
      newDate = currentDate.add(const Duration(days: 1)); // Add 1 day
    } else if (interval == "Weekly") {
      newDate = currentDate.add(const Duration(days: 7)); // Add 7 days
    } else if (interval == "Monthly") {
      int newMonth = currentDate.month + 1;
      int newYear = currentDate.year;

      if (newMonth > 12) {
        newMonth = 1;
        newYear += 1;
      }

      int maxDaysInNewMonth = DateTime(newYear, newMonth + 1, 0).day;
      int newDay = currentDate.day > maxDaysInNewMonth
          ? maxDaysInNewMonth
          : currentDate.day;

      newDate = DateTime(newYear, newMonth, newDay);
    }

    // Return formatted date as "YYYY-MM-DD"
    return DateFormat('yyyy-MM-dd').format(newDate);
  } catch (e) {
    print("Error: $e");
    return "Invalid Date";
  }
}

LatLng formatLatLng(
  double lat,
  double lng,
) {
  // Create a LatLng object
  LatLng location = LatLng(lat, lng);

  // Optionally log it or print it in the desired format
  print('LatLng: ${location.latitude},${location.longitude}');

  return location;
}
