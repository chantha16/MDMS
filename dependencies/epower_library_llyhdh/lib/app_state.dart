import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<SeasonModelStruct> _seasonResponse = [];
  List<SeasonModelStruct> get seasonResponse => _seasonResponse;
  set seasonResponse(List<SeasonModelStruct> value) {
    _seasonResponse = value;
  }

  void addToSeasonResponse(SeasonModelStruct value) {
    seasonResponse.add(value);
  }

  void removeFromSeasonResponse(SeasonModelStruct value) {
    seasonResponse.remove(value);
  }

  void removeAtIndexFromSeasonResponse(int index) {
    seasonResponse.removeAt(index);
  }

  void updateSeasonResponseAtIndex(
    int index,
    SeasonModelStruct Function(SeasonModelStruct) updateFn,
  ) {
    seasonResponse[index] = updateFn(_seasonResponse[index]);
  }

  void insertAtIndexInSeasonResponse(int index, SeasonModelStruct value) {
    seasonResponse.insert(index, value);
  }
}
