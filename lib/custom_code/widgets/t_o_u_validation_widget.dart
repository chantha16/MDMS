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

class TOUValidationWidget extends StatefulWidget {
  const TOUValidationWidget({
    super.key,
    this.width,
    this.height,
    required this.timeOfUseDetails,
  });

  final double? width;
  final double? height;
  final List<TimeOfUseDetailsStruct> timeOfUseDetails;

  @override
  State<TOUValidationWidget> createState() => _TOUValidationWidgetState();
}

class _TOUValidationWidgetState extends State<TOUValidationWidget> {
  int? selectedChannelId;

  @override
  Widget build(BuildContext context) {
    // Filter out invalid data where timeBand or channel is null
    final validTimeOfUseDetails = widget.timeOfUseDetails
        .where((detail) => detail.timeBand != null && detail.channel != null)
        .toList();

    // If no valid data exists, show a message instead of a blank table
    if (validTimeOfUseDetails.isEmpty) {
      return const Center(
        child: Text(
          "No valid time band data available",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

    // Group TimeBands by Channel
    final Map<int, String> channels = {
      for (var detail in validTimeOfUseDetails)
        detail.channelId: detail.timeBand!.name
    };

    // Filtered TimeOfUseDetails based on selected channel
    final filteredTimeOfUseDetails = selectedChannelId == null
        ? validTimeOfUseDetails
        : validTimeOfUseDetails
            .where((detail) => detail.channelId == selectedChannelId)
            .toList();

    final Map<String, Color> timeBandColors =
        _generateLegendColors(validTimeOfUseDetails);
    final Map<int, Map<int, String>> gridData =
        _generateGridData(filteredTimeOfUseDetails);
    final ScrollController _scrollController = ScrollController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Legend grouped by Channel
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Scrollbar(
                  controller:
                      _scrollController, // Attach controller for active thumb
                  thumbVisibility:
                      true, // Ensure the scrollbar is visible when scrolling
                  trackVisibility: true, // Show track for better UI
                  child: SingleChildScrollView(
                    controller: _scrollController, // Assign the same controller
                    scrollDirection:
                        Axis.horizontal, // Enable horizontal scrolling
                    child: Wrap(
                      spacing: 15, // Spacing between columns
                      runSpacing: 8, // Spacing between rows if wrapped
                      alignment: WrapAlignment.start,
                      children: channels.keys.map((id) {
                        final channelTimeBands = widget.timeOfUseDetails
                            .where((detail) => detail.channelId == id)
                            .map((detail) => detail.timeBand.name)
                            .toSet();

                        return Container(
                          width: 350, // Limit width to fit 3 columns normally
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.timeOfUseDetails
                                    .firstWhere(
                                        (detail) => detail.channelId == id)
                                    .channel!
                                    .code,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: channelTimeBands.map((timeBandName) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          color: timeBandColors[timeBandName] ??
                                              Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          timeBandName.length > 40
                                              ? '${timeBandName.substring(0, 10)}'
                                              : timeBandName,
                                          maxLines: 1,
                                          // overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      )
                                    ],
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              if (channels.length > 1)
                PopupMenuButton<int>(
                  icon: const Icon(Icons.filter_list), // Popup icon
                  onSelected: (value) {
                    setState(() {
                      selectedChannelId = value; // Update selected channel
                    });
                  },
                  itemBuilder: (context) => channels.entries.map((entry) {
                    final isSelected = selectedChannelId == entry.key;
                    if (channels.isNotEmpty) {
                      selectedChannelId = channels.keys
                          .first; // Set default selection to the first channel
                    }

                    return PopupMenuItem<int>(
                      value: entry.key,
                      padding: EdgeInsets.zero, // Remove default padding
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            color: isSelected
                                ? Colors.blue.withOpacity(0.2)
                                : Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Text(
                              validTimeOfUseDetails
                                  .firstWhere(
                                      (detail) => detail.channelId == entry.key)
                                  .channel!
                                  .code,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal, // Bold selected item
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.black, // Change text color
                              ),
                            ),
                          ),
                          if (isSelected)
                            Positioned(
                              right: 10, // Align to the end
                              top: 0,
                              bottom: 0,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: const Icon(Icons.check,
                                    color: Colors.blue,
                                    size: 18), // Checkmark icon
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                )
            ]),
        SizedBox(height: 8),
        Expanded(
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(color: Colors.grey.shade300),
              children: [
                _buildTableHeader(),
                for (int hour = 0; hour < 24; hour++)
                  _buildTableRow(hour, gridData, timeBandColors),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _tableCell("Hour", bold: true),
        _tableCell("Sun", bold: true),
        _tableCell("Mon", bold: true),
        _tableCell("Tue", bold: true),
        _tableCell("Wed", bold: true),
        _tableCell("Thu", bold: true),
        _tableCell("Fri", bold: true),
        _tableCell("Sat", bold: true),
      ],
    );
  }

  TableRow _buildTableRow(int hour, Map<int, Map<int, String>> gridData,
      Map<String, Color> timeBandColors) {
    return TableRow(
      children: [
        _tableCell("${_formatHour(hour)}:00", bold: true),
        for (int day = 0; day < 7; day++)
          Container(
            width: 30,
            height: 20,
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey.shade400, width: 0.5),
            // ),
            child: Column(
              children: [
                for (int i = 0; i < 4; i++) // 15-minute slots
                  Expanded(
                    child: Container(
                      color: _getTimeBandColorForQuarter(
                          gridData, hour, day, i, timeBandColors),
                      width: double.infinity,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Color _getTimeBandColorForQuarter(Map<int, Map<int, String>> gridData,
      int hour, int day, int quarter, Map<String, Color> timeBandColors) {
    String? timeBand =
        gridData[hour]?[day * 4 + quarter]; // Get specific 15-min block
    return timeBandColors[timeBand] ?? Colors.white; // Assign color if found
  }

  Widget _tableCell(String text, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.all(4.0), // Reduce padding
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10, // Reduce font size
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Map<String, Color> _generateLegendColors(
      List<TimeOfUseDetailsStruct> allDetails) {
    final Map<String, Color> timeBandColors = {};
    int colorIndex = 0;
    const List<Color> availableColors = [
      Color(0x80FF0000), // Red with 50% transparency
      Color(0x8033CC33), // Green with 50% transparency
      Color(0x803366FF), // Blue with 50% transparency
      Color(0x80FF9933), // Orange with 50% transparency
      Color(0x80B266FF), // Purple with 50% transparency
      Color(0x8033CCCC), // Cyan with 50% transparency
      Color(0x80FFCC00), // Yellow with 50% transparency
    ];

    for (var detail in allDetails) {
      final timeBandName = detail.timeBand.name;
      if (!timeBandColors.containsKey(timeBandName)) {
        timeBandColors[timeBandName] =
            availableColors[colorIndex % availableColors.length];
        colorIndex++;
      }
    }

    return timeBandColors;
  }

  Map<int, Map<int, String>> _generateGridData(
      List<TimeOfUseDetailsStruct> filteredDetails) {
    final Map<int, Map<int, String>> gridData = {};

    for (var detail in filteredDetails) {
      int startTime = _timeToSeconds(detail.timeBand.startTime);
      int endTime = _timeToSeconds(detail.timeBand.endTime);

      final List<int> daysOfWeek = detail.timeBand.timeBandAttributes
          .firstWhere((attr) => attr.key == "DayOfWeek",
              orElse: () =>
                  TimeBandAttributesModelStruct(key: "DayOfWeek", value: []))
          .value;

      // Handle time bands crossing midnight
      if (endTime < startTime) {
        // Fill the part of the time band before midnight
        _fillGrid(gridData, detail, startTime, 86400, daysOfWeek);

        // Fill the part of the time band after midnight (shift to next day)
        _fillGrid(
            gridData,
            detail,
            0,
            endTime,
            daysOfWeek
                .map((d) => d == 5 ? 1 : (d + 1))
                .where((d) => d < 5)
                .toList());

        // FIX: Fill missing early morning hours (00:00 - 06:14) on the correct day
        _fillGrid(gridData, detail, 0, endTime, daysOfWeek);
      } else {
        _fillGrid(gridData, detail, startTime, endTime, daysOfWeek);
      }
    }

    return gridData;
  }

  void _fillGrid(
      Map<int, Map<int, String>> gridData,
      TimeOfUseDetailsStruct detail,
      int startTime,
      int endTime,
      List<int> daysOfWeek) {
    // Round up endTime to the next 15-minute interval
    if (endTime % 900 != 0) {
      endTime = ((endTime ~/ 900) + 1) * 900;
    }

    for (int seconds = startTime; seconds < endTime; seconds += 900) {
      // Every 15 minutes
      int hour = (seconds ~/ 3600) % 24;
      int quarter =
          ((seconds % 3600) ~/ 900); // Calculate the 15-min segment (0-3)

      for (int day in daysOfWeek) {
        gridData.putIfAbsent(hour, () => {});

        // Ensure all 15-min blocks are correctly assigned
        gridData[hour]![day * 4 + quarter] = detail.timeBand.name;
      }
    }
  }

  int _timeToSeconds(String time) {
    final parts = time.split(":").map(int.parse).toList();
    return parts[0] * 3600 + parts[1] * 60 + parts[2];
  }

  String _formatHour(int hour) {
    final adjustedHour = hour % 24;
    return adjustedHour.toString().padLeft(2, '0');
  }
}
