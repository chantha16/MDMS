import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/time_bands/components/time_band_seasonltem_select/time_band_seasonltem_select_widget.dart';
import '/modules/time_bands/components/time_band_specialltem_select/time_band_specialltem_select_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'time_band_detail_view_widget.dart' show TimeBandDetailViewWidget;
import 'package:flutter/material.dart';

class TimeBandDetailViewModel
    extends FlutterFlowModel<TimeBandDetailViewWidget> {
  ///  Local state fields for this component.

  HandleErrorStruct? handleError;
  void updateHandleErrorStruct(Function(HandleErrorStruct) updateFn) {
    updateFn(handleError ??= HandleErrorStruct());
  }

  bool? isPickStartTime = false;

  bool? isPickEndTime = false;

  TimeBandModelStruct? timeBandModel;
  void updateTimeBandModelStruct(Function(TimeBandModelStruct) updateFn) {
    updateFn(timeBandModel ??= TimeBandModelStruct());
  }

  List<TimeBandAttributesModelStruct> timeBandAttributesModel = [];
  void addToTimeBandAttributesModel(TimeBandAttributesModelStruct item) =>
      timeBandAttributesModel.add(item);
  void removeFromTimeBandAttributesModel(TimeBandAttributesModelStruct item) =>
      timeBandAttributesModel.remove(item);
  void removeAtIndexFromTimeBandAttributesModel(int index) =>
      timeBandAttributesModel.removeAt(index);
  void insertAtIndexInTimeBandAttributesModel(
          int index, TimeBandAttributesModelStruct item) =>
      timeBandAttributesModel.insert(index, item);
  void updateTimeBandAttributesModelAtIndex(
          int index, Function(TimeBandAttributesModelStruct) updateFn) =>
      timeBandAttributesModel[index] = updateFn(timeBandAttributesModel[index]);

  List<SeasonModelStruct> seasonModel = [];
  void addToSeasonModel(SeasonModelStruct item) => seasonModel.add(item);
  void removeFromSeasonModel(SeasonModelStruct item) =>
      seasonModel.remove(item);
  void removeAtIndexFromSeasonModel(int index) => seasonModel.removeAt(index);
  void insertAtIndexInSeasonModel(int index, SeasonModelStruct item) =>
      seasonModel.insert(index, item);
  void updateSeasonModelAtIndex(
          int index, Function(SeasonModelStruct) updateFn) =>
      seasonModel[index] = updateFn(seasonModel[index]);

  List<SpecialDayModelStruct> specialDayModel = [];
  void addToSpecialDayModel(SpecialDayModelStruct item) =>
      specialDayModel.add(item);
  void removeFromSpecialDayModel(SpecialDayModelStruct item) =>
      specialDayModel.remove(item);
  void removeAtIndexFromSpecialDayModel(int index) =>
      specialDayModel.removeAt(index);
  void insertAtIndexInSpecialDayModel(int index, SpecialDayModelStruct item) =>
      specialDayModel.insert(index, item);
  void updateSpecialDayModelAtIndex(
          int index, Function(SpecialDayModelStruct) updateFn) =>
      specialDayModel[index] = updateFn(specialDayModel[index]);

  List<int> dayOfWeekState = [];
  void addToDayOfWeekState(int item) => dayOfWeekState.add(item);
  void removeFromDayOfWeekState(int item) => dayOfWeekState.remove(item);
  void removeAtIndexFromDayOfWeekState(int index) =>
      dayOfWeekState.removeAt(index);
  void insertAtIndexInDayOfWeekState(int index, int item) =>
      dayOfWeekState.insert(index, item);
  void updateDayOfWeekStateAtIndex(int index, Function(int) updateFn) =>
      dayOfWeekState[index] = updateFn(dayOfWeekState[index]);

  List<int> monthOfYearState = [];
  void addToMonthOfYearState(int item) => monthOfYearState.add(item);
  void removeFromMonthOfYearState(int item) => monthOfYearState.remove(item);
  void removeAtIndexFromMonthOfYearState(int index) =>
      monthOfYearState.removeAt(index);
  void insertAtIndexInMonthOfYearState(int index, int item) =>
      monthOfYearState.insert(index, item);
  void updateMonthOfYearStateAtIndex(int index, Function(int) updateFn) =>
      monthOfYearState[index] = updateFn(monthOfYearState[index]);

  AttributeModelStruct? dayOfWeekAttribute;
  void updateDayOfWeekAttributeStruct(Function(AttributeModelStruct) updateFn) {
    updateFn(dayOfWeekAttribute ??= AttributeModelStruct());
  }

  AttributeModelStruct? monthOfYearAttribute;
  void updateMonthOfYearAttributeStruct(
      Function(AttributeModelStruct) updateFn) {
    updateFn(monthOfYearAttribute ??= AttributeModelStruct());
  }

  AttributeModelStruct? seasonAttribute;
  void updateSeasonAttributeStruct(Function(AttributeModelStruct) updateFn) {
    updateFn(seasonAttribute ??= AttributeModelStruct());
  }

  AttributeModelStruct? specialDayAttribute;
  void updateSpecialDayAttributeStruct(
      Function(AttributeModelStruct) updateFn) {
    updateFn(specialDayAttribute ??= AttributeModelStruct());
  }

  DateTime? startTime;

  String? genDescription;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Read TimeBand by Id)] action in TimeBandDetailView widget.
  ApiCallResponse? seasonRes;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kxfd3zz6' /* Please input name! */,
      );
    }

    return null;
  }

  // State field(s) for startTime widget.
  FocusNode? startTimeFocusNode;
  TextEditingController? startTimeTextController;
  String? Function(BuildContext, String?)? startTimeTextControllerValidator;
  // State field(s) for endTime widget.
  FocusNode? endTimeFocusNode;
  TextEditingController? endTimeTextController;
  String? Function(BuildContext, String?)? endTimeTextControllerValidator;
  // State field(s) for DayOfWeekChoichchip widget.
  FormFieldController<List<String>>? dayOfWeekChoichchipValueController;
  List<String>? get dayOfWeekChoichchipValues =>
      dayOfWeekChoichchipValueController?.value;
  set dayOfWeekChoichchipValues(List<String>? val) =>
      dayOfWeekChoichchipValueController?.value = val;
  // Stores action output result for [Action Block - checkAttributeExisted] action in DayOfWeekChoichchip widget.
  bool? dayOfWeekExisted;
  // State field(s) for MonthOfYearChoichchip widget.
  FormFieldController<List<String>>? monthOfYearChoichchipValueController;
  List<String>? get monthOfYearChoichchipValues =>
      monthOfYearChoichchipValueController?.value;
  set monthOfYearChoichchipValues(List<String>? val) =>
      monthOfYearChoichchipValueController?.value = val;
  // Stores action output result for [Action Block - checkAttributeExisted] action in MonthOfYearChoichchip widget.
  bool? monthOfYearExisted;
  // Model for TimeBandSeasonltemSelect component.
  late TimeBandSeasonltemSelectModel timeBandSeasonltemSelectModel;
  // Stores action output result for [Action Block - checkAttributeExisted] action in TimeBandSeasonltemSelect widget.
  bool? attributeExisted;
  // Model for TimeBandSpecialltemSelect component.
  late TimeBandSpecialltemSelectModel timeBandSpecialltemSelectModel;
  // Stores action output result for [Action Block - checkAttributeExisted] action in TimeBandSpecialltemSelect widget.
  bool? specialDayAttributeExisted;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for SecoundaryButton component.
  late SecoundaryButtonModel secoundaryButtonModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Backend Call - API (Create TimeBand)] action in PrimaryButton widget.
  ApiCallResponse? apiResultfbl;
  // Stores action output result for [Backend Call - API (Update TimeBand)] action in PrimaryButton widget.
  ApiCallResponse? apiResultpe5;
  // Stores action output result for [Backend Call - API (Delete TimeBand)] action in PrimaryButton widget.
  ApiCallResponse? apiResultlcw;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    timeBandSeasonltemSelectModel =
        createModel(context, () => TimeBandSeasonltemSelectModel());
    timeBandSpecialltemSelectModel =
        createModel(context, () => TimeBandSpecialltemSelectModel());
    secoundaryButtonModel = createModel(context, () => SecoundaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    startTimeFocusNode?.dispose();
    startTimeTextController?.dispose();

    endTimeFocusNode?.dispose();
    endTimeTextController?.dispose();

    timeBandSeasonltemSelectModel.dispose();
    timeBandSpecialltemSelectModel.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    secoundaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks.
  /// Check list of attribute by key in timeBandDataState on App State
  Future<bool?> checkAttributeExisted(
    BuildContext context, {
    required TimeBandAttributeKey? key,
  }) async {
    if ((FFAppState().timebandDataState.isNotEmpty) == true) {
      if ((FFAppState()
              .timebandDataState
              .where((e) => e.key == key?.name)
              .toList()
              .isNotEmpty) ==
          true) {
        return true;
      }

      return false;
    } else {
      return false;
    }
  }

  Future initExistedAttribute(BuildContext context) async {
    if (FFAppState().timebandDataState.isNotEmpty) {
      await Future.wait([
        Future(() async {
          if (FFAppState()
              .timebandDataState
              .where((e) => e.key == TimeBandAttributeKey.Season.name)
              .toList()
              .isNotEmpty) {
            seasonAttribute = FFAppState()
                .timebandDataState
                .where((e) => e.key == TimeBandAttributeKey.Season.name)
                .toList()
                .firstOrNull;
            if ((seasonAttribute?.value != null &&
                    (seasonAttribute?.value)!.isNotEmpty) ==
                false) {
              updateSeasonAttributeStruct(
                (e) => e..active = false,
              );
            }
          }
        }),
        Future(() async {
          if (FFAppState()
              .timebandDataState
              .where((e) => e.key == TimeBandAttributeKey.SpecialDay.name)
              .toList()
              .isNotEmpty) {
            specialDayAttribute = FFAppState()
                .timebandDataState
                .where((e) => e.key == TimeBandAttributeKey.SpecialDay.name)
                .toList()
                .firstOrNull;
            if ((seasonAttribute?.value != null &&
                    (seasonAttribute?.value)!.isNotEmpty) ==
                false) {
              updateSpecialDayAttributeStruct(
                (e) => e..active = false,
              );
            }
          }
        }),
        Future(() async {
          if (FFAppState()
              .timebandDataState
              .where((e) => e.key == TimeBandAttributeKey.DayOfWeek.name)
              .toList()
              .isNotEmpty) {
            dayOfWeekAttribute = FFAppState()
                .timebandDataState
                .where((e) => e.key == TimeBandAttributeKey.DayOfWeek.name)
                .toList()
                .firstOrNull;
            if ((dayOfWeekAttribute?.value != null &&
                    (dayOfWeekAttribute?.value)!.isNotEmpty) ==
                false) {
              updateDayOfWeekAttributeStruct(
                (e) => e..active = false,
              );
            }
          }
        }),
        Future(() async {
          if (FFAppState()
              .timebandDataState
              .where((e) => e.key == TimeBandAttributeKey.MonthOfYear.name)
              .toList()
              .isNotEmpty) {
            dayOfWeekAttribute = FFAppState()
                .timebandDataState
                .where((e) => e.key == TimeBandAttributeKey.DayOfWeek.name)
                .toList()
                .firstOrNull;
            monthOfYearAttribute = FFAppState()
                .timebandDataState
                .where((e) => e.key == TimeBandAttributeKey.MonthOfYear.name)
                .toList()
                .firstOrNull;
            if ((monthOfYearAttribute?.value != null &&
                    (monthOfYearAttribute?.value)!.isNotEmpty) ==
                false) {
              updateMonthOfYearAttributeStruct(
                (e) => e..active = false,
              );
            }
          }
        }),
      ]);
    }
  }

  Future invalid(BuildContext context) async {
    if (FFAppState().selectedStartTime == '') {
      isPickStartTime = true;
    } else {
      isPickStartTime = false;
    }

    if (FFAppState().selectedEndTime == '') {
      isPickEndTime = true;
    } else {
      isPickEndTime = false;
    }
  }

  Future generateDescription(BuildContext context) async {
    if ((FFAppState().selectedStartTime != '') &&
        (FFAppState().selectedEndTime != '')) {
      genDescription =
          'The time band is active from ${FFAppState().selectedStartTime} to ${FFAppState().selectedEndTime}, lasting ${functions.calculateTimeDifference(FFAppState().selectedStartTime, FFAppState().selectedEndTime)}${(dayOfWeekAttribute?.value != null && (dayOfWeekAttribute?.value)!.isNotEmpty) == false ? '' : ' on ${functions.convertListStringToString(functions.splitStringByCommaDayofWeek(dayOfWeekAttribute!.value.sortedList(keyOf: (e) => e, desc: false).toList()).toList())}'}${(monthOfYearAttribute?.value != null && (monthOfYearAttribute?.value)!.isNotEmpty) == false ? '' : ' during ${functions.convertListStringToString(functions.splitStringByCommaMonthofYear(monthOfYearAttribute!.value.sortedList(keyOf: (e) => e, desc: false).toList()).toList())}'}${(FFAppState().seasonState.isNotEmpty) == false ? '' : ' and applies to the season \"${functions.convertListStringToString(FFAppState().seasonState.map((e) => e.name).toList().toList())}\"'}${(FFAppState().specialDayState.isNotEmpty) == false ? '' : ' with special consideration for \"${functions.convertListStringToString(FFAppState().specialDayState.map((e) => e.name).toList().toList())}\"'}${(dayOfWeekAttribute?.value != null && (dayOfWeekAttribute?.value)!.isNotEmpty) == false ? '' : ' . It includes ${dayOfWeekAttribute?.value.length.toString()} days of the week'}${(monthOfYearAttribute?.value != null && (monthOfYearAttribute?.value)!.isNotEmpty) == false ? '' : ' and ${monthOfYearAttribute?.value.length.toString()} months'}.';
    } else {
      genDescription = '';
    }
  }
}
