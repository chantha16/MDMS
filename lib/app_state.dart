import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _toggle = await secureStorage.getBool('ff_toggle') ?? _toggle;
    });
    await _safeInitAsync(() async {
      _isLoggedIn = await secureStorage.getBool('ff_isLoggedIn') ?? _isLoggedIn;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_token') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_token') ?? '{}';
          _token = TokenResponseModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_profile') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_profile') ?? '{}';
          _profile = GetProfileResponseModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _loadprofiledata =
          await secureStorage.getStringList('ff_loadprofiledata') ??
              _loadprofiledata;
    });
    await _safeInitAsync(() async {
      _SampleDummyJson1 =
          (await secureStorage.getStringList('ff_SampleDummyJson1'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _SampleDummyJson1;
    });
    await _safeInitAsync(() async {
      _SampleDummyJson2 =
          (await secureStorage.getStringList('ff_SampleDummyJson2'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _SampleDummyJson2;
    });
    await _safeInitAsync(() async {
      _dataTableDetail =
          await secureStorage.getStringList('ff_dataTableDetail') ??
              _dataTableDetail;
    });
    await _safeInitAsync(() async {
      _numberRow = await secureStorage.getInt('ff_numberRow') ?? _numberRow;
    });
    await _safeInitAsync(() async {
      _deviceManagementMenu =
          await secureStorage.getBool('ff_deviceManagementMenu') ??
              _deviceManagementMenu;
    });
    await _safeInitAsync(() async {
      _IsDrawer = await secureStorage.getBool('ff_IsDrawer') ?? _IsDrawer;
    });
    await _safeInitAsync(() async {
      _touManagementMenu =
          await secureStorage.getBool('ff_touManagementMenu') ??
              _touManagementMenu;
    });
    await _safeInitAsync(() async {
      _settingsMenu =
          await secureStorage.getBool('ff_settingsMenu') ?? _settingsMenu;
    });
    await _safeInitAsync(() async {
      _itemSpecialDayDetials =
          (await secureStorage.getStringList('ff_itemSpecialDayDetials'))
                  ?.map((x) {
                    try {
                      return SpecialDayDetailsModelStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _itemSpecialDayDetials;
    });
    await _safeInitAsync(() async {
      _startDate = await secureStorage.read(key: 'ff_startDate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_startDate'))!)
          : _startDate;
    });
    await _safeInitAsync(() async {
      _endDate = await secureStorage.read(key: 'ff_endDate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_endDate'))!)
          : _endDate;
    });
    await _safeInitAsync(() async {
      _selectedOptions = await secureStorage.getString('ff_selectedOptions') ??
          _selectedOptions;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  Color _bgColor = Color(4288378515);
  Color get bgColor => _bgColor;
  set bgColor(Color value) {
    _bgColor = value;
  }

  bool _toggle = true;
  bool get toggle => _toggle;
  set toggle(bool value) {
    _toggle = value;
    secureStorage.setBool('ff_toggle', value);
  }

  void deleteToggle() {
    secureStorage.delete(key: 'ff_toggle');
  }

  bool _reportview = false;
  bool get reportview => _reportview;
  set reportview(bool value) {
    _reportview = value;
  }

  String _exchangeCode = '';
  String get exchangeCode => _exchangeCode;
  set exchangeCode(String value) {
    _exchangeCode = value;
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    secureStorage.setBool('ff_isLoggedIn', value);
  }

  void deleteIsLoggedIn() {
    secureStorage.delete(key: 'ff_isLoggedIn');
  }

  bool _isHovered = false;
  bool get isHovered => _isHovered;
  set isHovered(bool value) {
    _isHovered = value;
  }

  bool _zoomIn = false;
  bool get zoomIn => _zoomIn;
  set zoomIn(bool value) {
    _zoomIn = value;
  }

  bool _ZoomOut = false;
  bool get ZoomOut => _ZoomOut;
  set ZoomOut(bool value) {
    _ZoomOut = value;
  }

  List<int> _btTable = [1, 2];
  List<int> get btTable => _btTable;
  set btTable(List<int> value) {
    _btTable = value;
  }

  void addToBtTable(int value) {
    btTable.add(value);
  }

  void removeFromBtTable(int value) {
    btTable.remove(value);
  }

  void removeAtIndexFromBtTable(int index) {
    btTable.removeAt(index);
  }

  void updateBtTableAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    btTable[index] = updateFn(_btTable[index]);
  }

  void insertAtIndexInBtTable(int index, int value) {
    btTable.insert(index, value);
  }

  List<int> _chart = [1, 2];
  List<int> get chart => _chart;
  set chart(List<int> value) {
    _chart = value;
  }

  void addToChart(int value) {
    chart.add(value);
  }

  void removeFromChart(int value) {
    chart.remove(value);
  }

  void removeAtIndexFromChart(int index) {
    chart.removeAt(index);
  }

  void updateChartAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    chart[index] = updateFn(_chart[index]);
  }

  void insertAtIndexInChart(int index, int value) {
    chart.insert(index, value);
  }

  String _urlPath = '';
  String get urlPath => _urlPath;
  set urlPath(String value) {
    _urlPath = value;
  }

  TokenResponseModelStruct _token = TokenResponseModelStruct();
  TokenResponseModelStruct get token => _token;
  set token(TokenResponseModelStruct value) {
    _token = value;
    secureStorage.setString('ff_token', value.serialize());
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  void updateTokenStruct(Function(TokenResponseModelStruct) updateFn) {
    updateFn(_token);
    secureStorage.setString('ff_token', _token.serialize());
  }

  GetProfileResponseModelStruct _profile = GetProfileResponseModelStruct();
  GetProfileResponseModelStruct get profile => _profile;
  set profile(GetProfileResponseModelStruct value) {
    _profile = value;
    secureStorage.setString('ff_profile', value.serialize());
  }

  void deleteProfile() {
    secureStorage.delete(key: 'ff_profile');
  }

  void updateProfileStruct(Function(GetProfileResponseModelStruct) updateFn) {
    updateFn(_profile);
    secureStorage.setString('ff_profile', _profile.serialize());
  }

  List<String> _loadprofiledata = ['Name ', 'Value'];
  List<String> get loadprofiledata => _loadprofiledata;
  set loadprofiledata(List<String> value) {
    _loadprofiledata = value;
    secureStorage.setStringList('ff_loadprofiledata', value);
  }

  void deleteLoadprofiledata() {
    secureStorage.delete(key: 'ff_loadprofiledata');
  }

  void addToLoadprofiledata(String value) {
    loadprofiledata.add(value);
    secureStorage.setStringList('ff_loadprofiledata', _loadprofiledata);
  }

  void removeFromLoadprofiledata(String value) {
    loadprofiledata.remove(value);
    secureStorage.setStringList('ff_loadprofiledata', _loadprofiledata);
  }

  void removeAtIndexFromLoadprofiledata(int index) {
    loadprofiledata.removeAt(index);
    secureStorage.setStringList('ff_loadprofiledata', _loadprofiledata);
  }

  void updateLoadprofiledataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    loadprofiledata[index] = updateFn(_loadprofiledata[index]);
    secureStorage.setStringList('ff_loadprofiledata', _loadprofiledata);
  }

  void insertAtIndexInLoadprofiledata(int index, String value) {
    loadprofiledata.insert(index, value);
    secureStorage.setStringList('ff_loadprofiledata', _loadprofiledata);
  }

  bool _isPinned = false;
  bool get isPinned => _isPinned;
  set isPinned(bool value) {
    _isPinned = value;
  }

  bool _isSidebarPinned = false;
  bool get isSidebarPinned => _isSidebarPinned;
  set isSidebarPinned(bool value) {
    _isSidebarPinned = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  List<dynamic> _SampleDummyJson1 = [
    jsonDecode(
        '{\"id\":1,\"name\":\"lyhoung\",\"note\":\"test lg ng nah\",\"isSort\":false}'),
    jsonDecode(
        '{\"id\":2,\"name\":\"ice-bear\",\"note\":\"test lg ng nah ddel kran add thaem\",\"isSort\":true}')
  ];
  List<dynamic> get SampleDummyJson1 => _SampleDummyJson1;
  set SampleDummyJson1(List<dynamic> value) {
    _SampleDummyJson1 = value;
    secureStorage.setStringList(
        'ff_SampleDummyJson1', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteSampleDummyJson1() {
    secureStorage.delete(key: 'ff_SampleDummyJson1');
  }

  void addToSampleDummyJson1(dynamic value) {
    SampleDummyJson1.add(value);
    secureStorage.setStringList('ff_SampleDummyJson1',
        _SampleDummyJson1.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSampleDummyJson1(dynamic value) {
    SampleDummyJson1.remove(value);
    secureStorage.setStringList('ff_SampleDummyJson1',
        _SampleDummyJson1.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSampleDummyJson1(int index) {
    SampleDummyJson1.removeAt(index);
    secureStorage.setStringList('ff_SampleDummyJson1',
        _SampleDummyJson1.map((x) => jsonEncode(x)).toList());
  }

  void updateSampleDummyJson1AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    SampleDummyJson1[index] = updateFn(_SampleDummyJson1[index]);
    secureStorage.setStringList('ff_SampleDummyJson1',
        _SampleDummyJson1.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSampleDummyJson1(int index, dynamic value) {
    SampleDummyJson1.insert(index, value);
    secureStorage.setStringList('ff_SampleDummyJson1',
        _SampleDummyJson1.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _SampleDummyJson2 = [
    jsonDecode(
        '{\"id\":1,\"name\":\"big boy\",\"note\":\"test lg ng nah sak add thaem jong dg overflow ort ng nah sss\",\"isSort\":false,\"date\":\"11/11/2024\",\"role\":\"tester\"}'),
    jsonDecode(
        '{\"id\":2,\"name\":\"small boy\",\"note\":\"test lg ng nah \",\"isSort\":true,\"date\":\"11/11/2025\",\"role\":\"ux/ui\"}')
  ];
  List<dynamic> get SampleDummyJson2 => _SampleDummyJson2;
  set SampleDummyJson2(List<dynamic> value) {
    _SampleDummyJson2 = value;
    secureStorage.setStringList(
        'ff_SampleDummyJson2', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteSampleDummyJson2() {
    secureStorage.delete(key: 'ff_SampleDummyJson2');
  }

  void addToSampleDummyJson2(dynamic value) {
    SampleDummyJson2.add(value);
    secureStorage.setStringList('ff_SampleDummyJson2',
        _SampleDummyJson2.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSampleDummyJson2(dynamic value) {
    SampleDummyJson2.remove(value);
    secureStorage.setStringList('ff_SampleDummyJson2',
        _SampleDummyJson2.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSampleDummyJson2(int index) {
    SampleDummyJson2.removeAt(index);
    secureStorage.setStringList('ff_SampleDummyJson2',
        _SampleDummyJson2.map((x) => jsonEncode(x)).toList());
  }

  void updateSampleDummyJson2AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    SampleDummyJson2[index] = updateFn(_SampleDummyJson2[index]);
    secureStorage.setStringList('ff_SampleDummyJson2',
        _SampleDummyJson2.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSampleDummyJson2(int index, dynamic value) {
    SampleDummyJson2.insert(index, value);
    secureStorage.setStringList('ff_SampleDummyJson2',
        _SampleDummyJson2.map((x) => jsonEncode(x)).toList());
  }

  List<Flag> _typeenum = [Flag.Add, Flag.Update, Flag.Delete, Flag.View];
  List<Flag> get typeenum => _typeenum;
  set typeenum(List<Flag> value) {
    _typeenum = value;
  }

  void addToTypeenum(Flag value) {
    typeenum.add(value);
  }

  void removeFromTypeenum(Flag value) {
    typeenum.remove(value);
  }

  void removeAtIndexFromTypeenum(int index) {
    typeenum.removeAt(index);
  }

  void updateTypeenumAtIndex(
    int index,
    Flag Function(Flag) updateFn,
  ) {
    typeenum[index] = updateFn(_typeenum[index]);
  }

  void insertAtIndexInTypeenum(int index, Flag value) {
    typeenum.insert(index, value);
  }

  String _selectedmonthrage = '';
  String get selectedmonthrage => _selectedmonthrage;
  set selectedmonthrage(String value) {
    _selectedmonthrage = value;
  }

  List<String> _dataSpecailDay = [
    'No.',
    'Name',
    'Special Day',
    'Start Date',
    'End Date',
    'Note',
    'Action'
  ];
  List<String> get dataSpecailDay => _dataSpecailDay;
  set dataSpecailDay(List<String> value) {
    _dataSpecailDay = value;
  }

  void addToDataSpecailDay(String value) {
    dataSpecailDay.add(value);
  }

  void removeFromDataSpecailDay(String value) {
    dataSpecailDay.remove(value);
  }

  void removeAtIndexFromDataSpecailDay(int index) {
    dataSpecailDay.removeAt(index);
  }

  void updateDataSpecailDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dataSpecailDay[index] = updateFn(_dataSpecailDay[index]);
  }

  void insertAtIndexInDataSpecailDay(int index, String value) {
    dataSpecailDay.insert(index, value);
  }

  List<String> _columnNameState = [];
  List<String> get columnNameState => _columnNameState;
  set columnNameState(List<String> value) {
    _columnNameState = value;
  }

  void addToColumnNameState(String value) {
    columnNameState.add(value);
  }

  void removeFromColumnNameState(String value) {
    columnNameState.remove(value);
  }

  void removeAtIndexFromColumnNameState(int index) {
    columnNameState.removeAt(index);
  }

  void updateColumnNameStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    columnNameState[index] = updateFn(_columnNameState[index]);
  }

  void insertAtIndexInColumnNameState(int index, String value) {
    columnNameState.insert(index, value);
  }

  List<dynamic> _rowItemState = [];
  List<dynamic> get rowItemState => _rowItemState;
  set rowItemState(List<dynamic> value) {
    _rowItemState = value;
  }

  void addToRowItemState(dynamic value) {
    rowItemState.add(value);
  }

  void removeFromRowItemState(dynamic value) {
    rowItemState.remove(value);
  }

  void removeAtIndexFromRowItemState(int index) {
    rowItemState.removeAt(index);
  }

  void updateRowItemStateAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    rowItemState[index] = updateFn(_rowItemState[index]);
  }

  void insertAtIndexInRowItemState(int index, dynamic value) {
    rowItemState.insert(index, value);
  }

  bool _isselected = false;
  bool get isselected => _isselected;
  set isselected(bool value) {
    _isselected = value;
  }

  List<String> _dataTableDetail = [
    '1',
    'Khmer Holiday',
    'Khmer New Year',
    '09/01/2025',
    '10/01/2025',
    'Action',
    'Note'
  ];
  List<String> get dataTableDetail => _dataTableDetail;
  set dataTableDetail(List<String> value) {
    _dataTableDetail = value;
    secureStorage.setStringList('ff_dataTableDetail', value);
  }

  void deleteDataTableDetail() {
    secureStorage.delete(key: 'ff_dataTableDetail');
  }

  void addToDataTableDetail(String value) {
    dataTableDetail.add(value);
    secureStorage.setStringList('ff_dataTableDetail', _dataTableDetail);
  }

  void removeFromDataTableDetail(String value) {
    dataTableDetail.remove(value);
    secureStorage.setStringList('ff_dataTableDetail', _dataTableDetail);
  }

  void removeAtIndexFromDataTableDetail(int index) {
    dataTableDetail.removeAt(index);
    secureStorage.setStringList('ff_dataTableDetail', _dataTableDetail);
  }

  void updateDataTableDetailAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dataTableDetail[index] = updateFn(_dataTableDetail[index]);
    secureStorage.setStringList('ff_dataTableDetail', _dataTableDetail);
  }

  void insertAtIndexInDataTableDetail(int index, String value) {
    dataTableDetail.insert(index, value);
    secureStorage.setStringList('ff_dataTableDetail', _dataTableDetail);
  }

  List<String> _selectedChip = ['\"\"'];
  List<String> get selectedChip => _selectedChip;
  set selectedChip(List<String> value) {
    _selectedChip = value;
  }

  void addToSelectedChip(String value) {
    selectedChip.add(value);
  }

  void removeFromSelectedChip(String value) {
    selectedChip.remove(value);
  }

  void removeAtIndexFromSelectedChip(int index) {
    selectedChip.removeAt(index);
  }

  void updateSelectedChipAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedChip[index] = updateFn(_selectedChip[index]);
  }

  void insertAtIndexInSelectedChip(int index, String value) {
    selectedChip.insert(index, value);
  }

  Color _selectedcolor = Color(4288243353);
  Color get selectedcolor => _selectedcolor;
  set selectedcolor(Color value) {
    _selectedcolor = value;
  }

  List<ItemModelStruct> _itemResponseState = [];
  List<ItemModelStruct> get itemResponseState => _itemResponseState;
  set itemResponseState(List<ItemModelStruct> value) {
    _itemResponseState = value;
  }

  void addToItemResponseState(ItemModelStruct value) {
    itemResponseState.add(value);
  }

  void removeFromItemResponseState(ItemModelStruct value) {
    itemResponseState.remove(value);
  }

  void removeAtIndexFromItemResponseState(int index) {
    itemResponseState.removeAt(index);
  }

  void updateItemResponseStateAtIndex(
    int index,
    ItemModelStruct Function(ItemModelStruct) updateFn,
  ) {
    itemResponseState[index] = updateFn(_itemResponseState[index]);
  }

  void insertAtIndexInItemResponseState(int index, ItemModelStruct value) {
    itemResponseState.insert(index, value);
  }

  Color _unselectedcolor = Color(0);
  Color get unselectedcolor => _unselectedcolor;
  set unselectedcolor(Color value) {
    _unselectedcolor = value;
  }

  bool _view = false;
  bool get view => _view;
  set view(bool value) {
    _view = value;
  }

  bool _isAscending = false;
  bool get isAscending => _isAscending;
  set isAscending(bool value) {
    _isAscending = value;
  }

  int _pageSize = 25;
  int get pageSize => _pageSize;
  set pageSize(int value) {
    _pageSize = value;
  }

  List<String> _hidenColumn = [];
  List<String> get hidenColumn => _hidenColumn;
  set hidenColumn(List<String> value) {
    _hidenColumn = value;
  }

  void addToHidenColumn(String value) {
    hidenColumn.add(value);
  }

  void removeFromHidenColumn(String value) {
    hidenColumn.remove(value);
  }

  void removeAtIndexFromHidenColumn(int index) {
    hidenColumn.removeAt(index);
  }

  void updateHidenColumnAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    hidenColumn[index] = updateFn(_hidenColumn[index]);
  }

  void insertAtIndexInHidenColumn(int index, String value) {
    hidenColumn.insert(index, value);
  }

  int _totalItems = 0;
  int get totalItems => _totalItems;
  set totalItems(int value) {
    _totalItems = value;
  }

  int _numberRow = 6;
  int get numberRow => _numberRow;
  set numberRow(int value) {
    _numberRow = value;
    secureStorage.setInt('ff_numberRow', value);
  }

  void deleteNumberRow() {
    secureStorage.delete(key: 'ff_numberRow');
  }

  bool _ValidateDropdown = false;
  bool get ValidateDropdown => _ValidateDropdown;
  set ValidateDropdown(bool value) {
    _ValidateDropdown = value;
  }

  bool _deviceManagementMenu = false;
  bool get deviceManagementMenu => _deviceManagementMenu;
  set deviceManagementMenu(bool value) {
    _deviceManagementMenu = value;
    secureStorage.setBool('ff_deviceManagementMenu', value);
  }

  void deleteDeviceManagementMenu() {
    secureStorage.delete(key: 'ff_deviceManagementMenu');
  }

  bool _selectedchip = false;
  bool get selectedchip => _selectedchip;
  set selectedchip(bool value) {
    _selectedchip = value;
  }

  bool _IsDrawer = false;
  bool get IsDrawer => _IsDrawer;
  set IsDrawer(bool value) {
    _IsDrawer = value;
    secureStorage.setBool('ff_IsDrawer', value);
  }

  void deleteIsDrawer() {
    secureStorage.delete(key: 'ff_IsDrawer');
  }

  bool _refreshData = false;
  bool get refreshData => _refreshData;
  set refreshData(bool value) {
    _refreshData = value;
  }

  List<dynamic> _datas = [
    jsonDecode(
        '[{\"No\":1,\"Name\":\"John Doe\",\"Special Day\":\"Birthday\",\"Start Date\":\"2025-01-10\",\"End Date\":\"2025-01-10\",\"Action\":\"Celebrate\",\"Note\":\"Surprise party planned\"},{\"No\":2,\"Name\":\"Jane Smith\",\"Special Day\":\"Anniversary\",\"Start Date\":\"2025-02-14\",\"End Date\":\"2025-02-14\",\"Action\":\"Dinner\",\"Note\":\"Restaurant reservation at 7 PM\"},{\"No\":3,\"Name\":\"Alice Johnson\",\"Special Day\":\"Graduation\",\"Start Date\":\"2025-05-20\",\"End Date\":\"2025-05-20\",\"Action\":\"Celebrate\",\"Note\":\"Party at home\"},{\"No\":4,\"Name\":\"Bob Lee\",\"Special Day\":\"Job Promotion\",\"Start Date\":\"2025-03-01\",\"End Date\":\"2025-03-01\",\"Action\":\"Celebration\",\"Note\":\"Take the day off\"}]')
  ];
  List<dynamic> get datas => _datas;
  set datas(List<dynamic> value) {
    _datas = value;
  }

  void addToDatas(dynamic value) {
    datas.add(value);
  }

  void removeFromDatas(dynamic value) {
    datas.remove(value);
  }

  void removeAtIndexFromDatas(int index) {
    datas.removeAt(index);
  }

  void updateDatasAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    datas[index] = updateFn(_datas[index]);
  }

  void insertAtIndexInDatas(int index, dynamic value) {
    datas.insert(index, value);
  }

  int _totalpage = 0;
  int get totalpage => _totalpage;
  set totalpage(int value) {
    _totalpage = value;
  }

  bool _touManagementMenu = false;
  bool get touManagementMenu => _touManagementMenu;
  set touManagementMenu(bool value) {
    _touManagementMenu = value;
    secureStorage.setBool('ff_touManagementMenu', value);
  }

  void deleteTouManagementMenu() {
    secureStorage.delete(key: 'ff_touManagementMenu');
  }

  int _currentpage = 0;
  int get currentpage => _currentpage;
  set currentpage(int value) {
    _currentpage = value;
  }

  bool _settingsMenu = false;
  bool get settingsMenu => _settingsMenu;
  set settingsMenu(bool value) {
    _settingsMenu = value;
    secureStorage.setBool('ff_settingsMenu', value);
  }

  void deleteSettingsMenu() {
    secureStorage.delete(key: 'ff_settingsMenu');
  }

  int _dataperpage = 0;
  int get dataperpage => _dataperpage;
  set dataperpage(int value) {
    _dataperpage = value;
  }

  List<String> _dataMain = ['1', 'Khmer Holiday', 'Importain Day'];
  List<String> get dataMain => _dataMain;
  set dataMain(List<String> value) {
    _dataMain = value;
  }

  void addToDataMain(String value) {
    dataMain.add(value);
  }

  void removeFromDataMain(String value) {
    dataMain.remove(value);
  }

  void removeAtIndexFromDataMain(int index) {
    dataMain.removeAt(index);
  }

  void updateDataMainAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dataMain[index] = updateFn(_dataMain[index]);
  }

  void insertAtIndexInDataMain(int index, String value) {
    dataMain.insert(index, value);
  }

  int _hoverIndex = -1;
  int get hoverIndex => _hoverIndex;
  set hoverIndex(int value) {
    _hoverIndex = value;
  }

  int _No = 1;
  int get No => _No;
  set No(int value) {
    _No = value;
  }

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;
  set pageNumber(int value) {
    _pageNumber = value;
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
  }

  int _currentPage = 25;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
  }

  bool _isRefresh = false;
  bool get isRefresh => _isRefresh;
  set isRefresh(bool value) {
    _isRefresh = value;
  }

  int _offset = 0;
  int get offset => _offset;
  set offset(int value) {
    _offset = value;
  }

  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
  }

  List<String> _rowLists = ['Name', 'StartDate', 'EndDate', 'Desctiption'];
  List<String> get rowLists => _rowLists;
  set rowLists(List<String> value) {
    _rowLists = value;
  }

  void addToRowLists(String value) {
    rowLists.add(value);
  }

  void removeFromRowLists(String value) {
    rowLists.remove(value);
  }

  void removeAtIndexFromRowLists(int index) {
    rowLists.removeAt(index);
  }

  void updateRowListsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    rowLists[index] = updateFn(_rowLists[index]);
  }

  void insertAtIndexInRowLists(int index, String value) {
    rowLists.insert(index, value);
  }

  int _rowIndex = 0;
  int get rowIndex => _rowIndex;
  set rowIndex(int value) {
    _rowIndex = value;
  }

  List<SpecialDayDetailsModelStruct> _itemSpecialDayDetials = [];
  List<SpecialDayDetailsModelStruct> get itemSpecialDayDetials =>
      _itemSpecialDayDetials;
  set itemSpecialDayDetials(List<SpecialDayDetailsModelStruct> value) {
    _itemSpecialDayDetials = value;
    secureStorage.setStringList(
        'ff_itemSpecialDayDetials', value.map((x) => x.serialize()).toList());
  }

  void deleteItemSpecialDayDetials() {
    secureStorage.delete(key: 'ff_itemSpecialDayDetials');
  }

  void addToItemSpecialDayDetials(SpecialDayDetailsModelStruct value) {
    itemSpecialDayDetials.add(value);
    secureStorage.setStringList('ff_itemSpecialDayDetials',
        _itemSpecialDayDetials.map((x) => x.serialize()).toList());
  }

  void removeFromItemSpecialDayDetials(SpecialDayDetailsModelStruct value) {
    itemSpecialDayDetials.remove(value);
    secureStorage.setStringList('ff_itemSpecialDayDetials',
        _itemSpecialDayDetials.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromItemSpecialDayDetials(int index) {
    itemSpecialDayDetials.removeAt(index);
    secureStorage.setStringList('ff_itemSpecialDayDetials',
        _itemSpecialDayDetials.map((x) => x.serialize()).toList());
  }

  void updateItemSpecialDayDetialsAtIndex(
    int index,
    SpecialDayDetailsModelStruct Function(SpecialDayDetailsModelStruct)
        updateFn,
  ) {
    itemSpecialDayDetials[index] = updateFn(_itemSpecialDayDetials[index]);
    secureStorage.setStringList('ff_itemSpecialDayDetials',
        _itemSpecialDayDetials.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInItemSpecialDayDetials(
      int index, SpecialDayDetailsModelStruct value) {
    itemSpecialDayDetials.insert(index, value);
    secureStorage.setStringList('ff_itemSpecialDayDetials',
        _itemSpecialDayDetials.map((x) => x.serialize()).toList());
  }

  DateTime? _startDate = DateTime.fromMillisecondsSinceEpoch(1737366960000);
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
    value != null
        ? secureStorage.setInt('ff_startDate', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_startDate');
  }

  void deleteStartDate() {
    secureStorage.delete(key: 'ff_startDate');
  }

  DateTime? _endDate = DateTime.fromMillisecondsSinceEpoch(1737366960000);
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
    value != null
        ? secureStorage.setInt('ff_endDate', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_endDate');
  }

  void deleteEndDate() {
    secureStorage.delete(key: 'ff_endDate');
  }

  String _selectedOptions = '';
  String get selectedOptions => _selectedOptions;
  set selectedOptions(String value) {
    _selectedOptions = value;
    secureStorage.setString('ff_selectedOptions', value);
  }

  void deleteSelectedOptions() {
    secureStorage.delete(key: 'ff_selectedOptions');
  }

  int _nameMaxLength = 200;
  int get nameMaxLength => _nameMaxLength;
  set nameMaxLength(int value) {
    _nameMaxLength = value;
  }

  int _deMaxLength = 2000;
  int get deMaxLength => _deMaxLength;
  set deMaxLength(int value) {
    _deMaxLength = value;
  }

  bool _isPickStartDate = false;
  bool get isPickStartDate => _isPickStartDate;
  set isPickStartDate(bool value) {
    _isPickStartDate = value;
  }

  List<bool> _language = [];
  List<bool> get language => _language;
  set language(List<bool> value) {
    _language = value;
  }

  void addToLanguage(bool value) {
    language.add(value);
  }

  void removeFromLanguage(bool value) {
    language.remove(value);
  }

  void removeAtIndexFromLanguage(int index) {
    language.removeAt(index);
  }

  void updateLanguageAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    language[index] = updateFn(_language[index]);
  }

  void insertAtIndexInLanguage(int index, bool value) {
    language.insert(index, value);
  }

  String _searchtext = '';
  String get searchtext => _searchtext;
  set searchtext(String value) {
    _searchtext = value;
  }

  List<int> _monthcode = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> get monthcode => _monthcode;
  set monthcode(List<int> value) {
    _monthcode = value;
  }

  void addToMonthcode(int value) {
    monthcode.add(value);
  }

  void removeFromMonthcode(int value) {
    monthcode.remove(value);
  }

  void removeAtIndexFromMonthcode(int index) {
    monthcode.removeAt(index);
  }

  void updateMonthcodeAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    monthcode[index] = updateFn(_monthcode[index]);
  }

  void insertAtIndexInMonthcode(int index, int value) {
    monthcode.insert(index, value);
  }

  String _Selectedrequired = '';
  String get Selectedrequired => _Selectedrequired;
  set Selectedrequired(String value) {
    _Selectedrequired = value;
  }

  final _searchManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> search({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _searchManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSearchCache() => _searchManager.clear();
  void clearSearchCacheKey(String? uniqueKey) =>
      _searchManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
