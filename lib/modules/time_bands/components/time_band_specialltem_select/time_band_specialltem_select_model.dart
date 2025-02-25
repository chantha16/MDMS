import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_band_specialltem_select_widget.dart'
    show TimeBandSpecialltemSelectWidget;
import 'package:flutter/material.dart';

class TimeBandSpecialltemSelectModel
    extends FlutterFlowModel<TimeBandSpecialltemSelectWidget> {
  ///  Local state fields for this component.

  List<SpecialDayModelStruct> specialDay = [];
  void addToSpecialDay(SpecialDayModelStruct item) => specialDay.add(item);
  void removeFromSpecialDay(SpecialDayModelStruct item) =>
      specialDay.remove(item);
  void removeAtIndexFromSpecialDay(int index) => specialDay.removeAt(index);
  void insertAtIndexInSpecialDay(int index, SpecialDayModelStruct item) =>
      specialDay.insert(index, item);
  void updateSpecialDayAtIndex(
          int index, Function(SpecialDayModelStruct) updateFn) =>
      specialDay[index] = updateFn(specialDay[index]);

  List<SpecialDayModelStruct> specialModelFromAppState = [];
  void addToSpecialModelFromAppState(SpecialDayModelStruct item) =>
      specialModelFromAppState.add(item);
  void removeFromSpecialModelFromAppState(SpecialDayModelStruct item) =>
      specialModelFromAppState.remove(item);
  void removeAtIndexFromSpecialModelFromAppState(int index) =>
      specialModelFromAppState.removeAt(index);
  void insertAtIndexInSpecialModelFromAppState(
          int index, SpecialDayModelStruct item) =>
      specialModelFromAppState.insert(index, item);
  void updateSpecialModelFromAppStateAtIndex(
          int index, Function(SpecialDayModelStruct) updateFn) =>
      specialModelFromAppState[index] =
          updateFn(specialModelFromAppState[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
