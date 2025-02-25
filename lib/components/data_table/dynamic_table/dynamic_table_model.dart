import '/flutter_flow/flutter_flow_util.dart';
import 'dynamic_table_widget.dart' show DynamicTableWidget;
import 'package:flutter/material.dart';

class DynamicTableModel extends FlutterFlowModel<DynamicTableWidget> {
  ///  Local state fields for this component.
  /// Mon - Sun
  List<String> dayOfWeeks = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  void addToDayOfWeeks(String item) => dayOfWeeks.add(item);
  void removeFromDayOfWeeks(String item) => dayOfWeeks.remove(item);
  void removeAtIndexFromDayOfWeeks(int index) => dayOfWeeks.removeAt(index);
  void insertAtIndexInDayOfWeeks(int index, String item) =>
      dayOfWeeks.insert(index, item);
  void updateDayOfWeeksAtIndex(int index, Function(String) updateFn) =>
      dayOfWeeks[index] = updateFn(dayOfWeeks[index]);

  List<String> timeOfDays = [
    '00:00',
    '00:15',
    '00:30',
    '00:45',
    '01:00',
    '01:15'
  ];
  void addToTimeOfDays(String item) => timeOfDays.add(item);
  void removeFromTimeOfDays(String item) => timeOfDays.remove(item);
  void removeAtIndexFromTimeOfDays(int index) => timeOfDays.removeAt(index);
  void insertAtIndexInTimeOfDays(int index, String item) =>
      timeOfDays.insert(index, item);
  void updateTimeOfDaysAtIndex(int index, Function(String) updateFn) =>
      timeOfDays[index] = updateFn(timeOfDays[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
