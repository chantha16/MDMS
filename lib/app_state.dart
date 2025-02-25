import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _toggle = await secureStorage.getBool('ff_toggle') ?? _toggle;
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
      _touManagementMenu =
          await secureStorage.getBool('ff_touManagementMenu') ??
              _touManagementMenu;
    });
    await _safeInitAsync(() async {
      _settingsMenu =
          await secureStorage.getBool('ff_settingsMenu') ?? _settingsMenu;
    });
    await _safeInitAsync(() async {
      _IsDrawer = await secureStorage.getBool('ff_IsDrawer') ?? _IsDrawer;
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
      _endDate = await secureStorage.read(key: 'ff_endDate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_endDate'))!)
          : _endDate;
    });
    await _safeInitAsync(() async {
      _selectedOptions = await secureStorage.getString('ff_selectedOptions') ??
          _selectedOptions;
    });
    await _safeInitAsync(() async {
      _itemAddToList = (await secureStorage.getStringList('ff_itemAddToList'))
              ?.map((x) {
                try {
                  return AddToListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _itemAddToList;
    });
    await _safeInitAsync(() async {
      _billingIntegration =
          (await secureStorage.getStringList('ff_billingIntegration'))
                  ?.map((x) {
                    try {
                      return BillingIntegrationStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _billingIntegration;
    });
    await _safeInitAsync(() async {
      _colorsPickOffPick =
          (await secureStorage.getStringList('ff_colorsPickOffPick'))
                  ?.map((x) => Color(int.tryParse(x) ?? 0))
                  .toList() ??
              _colorsPickOffPick;
    });
    await _safeInitAsync(() async {
      _specialDayNameStore =
          await secureStorage.getString('ff_specialDayNameStore') ??
              _specialDayNameStore;
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

  bool _isContainerVisible = false;
  bool get isContainerVisible => _isContainerVisible;
  set isContainerVisible(bool value) {
    _isContainerVisible = value;
  }

  int _currentPage = 25;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
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

  List<SpecialDayModelStruct> _specialDayState = [];
  List<SpecialDayModelStruct> get specialDayState => _specialDayState;
  set specialDayState(List<SpecialDayModelStruct> value) {
    _specialDayState = value;
  }

  void addToSpecialDayState(SpecialDayModelStruct value) {
    specialDayState.add(value);
  }

  void removeFromSpecialDayState(SpecialDayModelStruct value) {
    specialDayState.remove(value);
  }

  void removeAtIndexFromSpecialDayState(int index) {
    specialDayState.removeAt(index);
  }

  void updateSpecialDayStateAtIndex(
    int index,
    SpecialDayModelStruct Function(SpecialDayModelStruct) updateFn,
  ) {
    specialDayState[index] = updateFn(_specialDayState[index]);
  }

  void insertAtIndexInSpecialDayState(int index, SpecialDayModelStruct value) {
    specialDayState.insert(index, value);
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

  List<String> _selectedChip = [''];
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

  bool _isselected = false;
  bool get isselected => _isselected;
  set isselected(bool value) {
    _isselected = value;
  }

  String _selectedmonthrage = '';
  String get selectedmonthrage => _selectedmonthrage;
  set selectedmonthrage(String value) {
    _selectedmonthrage = value;
  }

  Color _unselectedcolor = Color(0);
  Color get unselectedcolor => _unselectedcolor;
  set unselectedcolor(Color value) {
    _unselectedcolor = value;
  }

  Color _selectedcolor = Color(4288243353);
  Color get selectedcolor => _selectedcolor;
  set selectedcolor(Color value) {
    _selectedcolor = value;
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

  int _pageSize = 25;
  int get pageSize => _pageSize;
  set pageSize(int value) {
    _pageSize = value;
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

  bool _view = false;
  bool get view => _view;
  set view(bool value) {
    _view = value;
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

  bool _isAscending = false;
  bool get isAscending => _isAscending;
  set isAscending(bool value) {
    _isAscending = value;
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

  bool _touManagementMenu = false;
  bool get touManagementMenu => _touManagementMenu;
  set touManagementMenu(bool value) {
    _touManagementMenu = value;
    secureStorage.setBool('ff_touManagementMenu', value);
  }

  void deleteTouManagementMenu() {
    secureStorage.delete(key: 'ff_touManagementMenu');
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

  bool _isContainerVisible2 = false;
  bool get isContainerVisible2 => _isContainerVisible2;
  set isContainerVisible2(bool value) {
    _isContainerVisible2 = value;
  }

  int _No = 1;
  int get No => _No;
  set No(int value) {
    _No = value;
  }

  int _hoverIndex = -1;
  int get hoverIndex => _hoverIndex;
  set hoverIndex(int value) {
    _hoverIndex = value;
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

  bool _IsDrawer = false;
  bool get IsDrawer => _IsDrawer;
  set IsDrawer(bool value) {
    _IsDrawer = value;
    secureStorage.setBool('ff_IsDrawer', value);
  }

  void deleteIsDrawer() {
    secureStorage.delete(key: 'ff_IsDrawer');
  }

  bool _isRefresh = false;
  bool get isRefresh => _isRefresh;
  set isRefresh(bool value) {
    _isRefresh = value;
  }

  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
  }

  int _rowIndex = 0;
  int get rowIndex => _rowIndex;
  set rowIndex(int value) {
    _rowIndex = value;
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

  int _offset = 0;
  int get offset => _offset;
  set offset(int value) {
    _offset = value;
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

  bool _isContainerVisible3 = false;
  bool get isContainerVisible3 => _isContainerVisible3;
  set isContainerVisible3(bool value) {
    _isContainerVisible3 = value;
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

  String _selectedItem = '';
  String get selectedItem => _selectedItem;
  set selectedItem(String value) {
    _selectedItem = value;
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  DateTime? _endDate = DateTime.fromMillisecondsSinceEpoch(1737112440000);
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

  int _totalItems = 0;
  int get totalItems => _totalItems;
  set totalItems(int value) {
    _totalItems = value;
  }

  bool _selectedchip = false;
  bool get selectedchip => _selectedchip;
  set selectedchip(bool value) {
    _selectedchip = value;
  }

  bool _ValidateDropdown = false;
  bool get ValidateDropdown => _ValidateDropdown;
  set ValidateDropdown(bool value) {
    _ValidateDropdown = value;
  }

  bool _refreshData = false;
  bool get refreshData => _refreshData;
  set refreshData(bool value) {
    _refreshData = value;
  }

  bool _ShowEdit = false;
  bool get ShowEdit => _ShowEdit;
  set ShowEdit(bool value) {
    _ShowEdit = value;
  }

  int _dataperpage = 0;
  int get dataperpage => _dataperpage;
  set dataperpage(int value) {
    _dataperpage = value;
  }

  bool _EachRow = false;
  bool get EachRow => _EachRow;
  set EachRow(bool value) {
    _EachRow = value;
  }

  bool _isSelectAll = false;
  bool get isSelectAll => _isSelectAll;
  set isSelectAll(bool value) {
    _isSelectAll = value;
  }

  bool _isChecked = false;
  bool get isChecked => _isChecked;
  set isChecked(bool value) {
    _isChecked = value;
  }

  bool _subclickbyid = false;
  bool get subclickbyid => _subclickbyid;
  set subclickbyid(bool value) {
    _subclickbyid = value;
  }

  String _searchtext = '';
  String get searchtext => _searchtext;
  set searchtext(String value) {
    _searchtext = value;
  }

  bool _onTab = false;
  bool get onTab => _onTab;
  set onTab(bool value) {
    _onTab = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  String _pageRebuild = '';
  String get pageRebuild => _pageRebuild;
  set pageRebuild(String value) {
    _pageRebuild = value;
  }

  bool _triggerRefresh = true;
  bool get triggerRefresh => _triggerRefresh;
  set triggerRefresh(bool value) {
    _triggerRefresh = value;
  }

  List<SubSiteModelStruct> _sitemodel = [];
  List<SubSiteModelStruct> get sitemodel => _sitemodel;
  set sitemodel(List<SubSiteModelStruct> value) {
    _sitemodel = value;
  }

  void addToSitemodel(SubSiteModelStruct value) {
    sitemodel.add(value);
  }

  void removeFromSitemodel(SubSiteModelStruct value) {
    sitemodel.remove(value);
  }

  void removeAtIndexFromSitemodel(int index) {
    sitemodel.removeAt(index);
  }

  void updateSitemodelAtIndex(
    int index,
    SubSiteModelStruct Function(SubSiteModelStruct) updateFn,
  ) {
    sitemodel[index] = updateFn(_sitemodel[index]);
  }

  void insertAtIndexInSitemodel(int index, SubSiteModelStruct value) {
    sitemodel.insert(index, value);
  }

  List<SubSiteModelStruct> _subSiteModel = [];
  List<SubSiteModelStruct> get subSiteModel => _subSiteModel;
  set subSiteModel(List<SubSiteModelStruct> value) {
    _subSiteModel = value;
  }

  void addToSubSiteModel(SubSiteModelStruct value) {
    subSiteModel.add(value);
  }

  void removeFromSubSiteModel(SubSiteModelStruct value) {
    subSiteModel.remove(value);
  }

  void removeAtIndexFromSubSiteModel(int index) {
    subSiteModel.removeAt(index);
  }

  void updateSubSiteModelAtIndex(
    int index,
    SubSiteModelStruct Function(SubSiteModelStruct) updateFn,
  ) {
    subSiteModel[index] = updateFn(_subSiteModel[index]);
  }

  void insertAtIndexInSubSiteModel(int index, SubSiteModelStruct value) {
    subSiteModel.insert(index, value);
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _sitId = 0;
  int get sitId => _sitId;
  set sitId(int value) {
    _sitId = value;
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

  dynamic _dataFromJson;
  dynamic get dataFromJson => _dataFromJson;
  set dataFromJson(dynamic value) {
    _dataFromJson = value;
  }

  int _currentpage = 0;
  int get currentpage => _currentpage;
  set currentpage(int value) {
    _currentpage = value;
  }

  List<TimeOfUseDetailsStruct> _timeOfUseDetail = [];
  List<TimeOfUseDetailsStruct> get timeOfUseDetail => _timeOfUseDetail;
  set timeOfUseDetail(List<TimeOfUseDetailsStruct> value) {
    _timeOfUseDetail = value;
  }

  void addToTimeOfUseDetail(TimeOfUseDetailsStruct value) {
    timeOfUseDetail.add(value);
  }

  void removeFromTimeOfUseDetail(TimeOfUseDetailsStruct value) {
    timeOfUseDetail.remove(value);
  }

  void removeAtIndexFromTimeOfUseDetail(int index) {
    timeOfUseDetail.removeAt(index);
  }

  void updateTimeOfUseDetailAtIndex(
    int index,
    TimeOfUseDetailsStruct Function(TimeOfUseDetailsStruct) updateFn,
  ) {
    timeOfUseDetail[index] = updateFn(_timeOfUseDetail[index]);
  }

  void insertAtIndexInTimeOfUseDetail(int index, TimeOfUseDetailsStruct value) {
    timeOfUseDetail.insert(index, value);
  }

  String _errorhandel = 'constraint-violation';
  String get errorhandel => _errorhandel;
  set errorhandel(String value) {
    _errorhandel = value;
  }

  List<TimeBandModelStruct> _timeBand = [];
  List<TimeBandModelStruct> get timeBand => _timeBand;
  set timeBand(List<TimeBandModelStruct> value) {
    _timeBand = value;
  }

  void addToTimeBand(TimeBandModelStruct value) {
    timeBand.add(value);
  }

  void removeFromTimeBand(TimeBandModelStruct value) {
    timeBand.remove(value);
  }

  void removeAtIndexFromTimeBand(int index) {
    timeBand.removeAt(index);
  }

  void updateTimeBandAtIndex(
    int index,
    TimeBandModelStruct Function(TimeBandModelStruct) updateFn,
  ) {
    timeBand[index] = updateFn(_timeBand[index]);
  }

  void insertAtIndexInTimeBand(int index, TimeBandModelStruct value) {
    timeBand.insert(index, value);
  }

  List<AddToListStruct> _itemAddToList = [];
  List<AddToListStruct> get itemAddToList => _itemAddToList;
  set itemAddToList(List<AddToListStruct> value) {
    _itemAddToList = value;
    secureStorage.setStringList(
        'ff_itemAddToList', value.map((x) => x.serialize()).toList());
  }

  void deleteItemAddToList() {
    secureStorage.delete(key: 'ff_itemAddToList');
  }

  void addToItemAddToList(AddToListStruct value) {
    itemAddToList.add(value);
    secureStorage.setStringList(
        'ff_itemAddToList', _itemAddToList.map((x) => x.serialize()).toList());
  }

  void removeFromItemAddToList(AddToListStruct value) {
    itemAddToList.remove(value);
    secureStorage.setStringList(
        'ff_itemAddToList', _itemAddToList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromItemAddToList(int index) {
    itemAddToList.removeAt(index);
    secureStorage.setStringList(
        'ff_itemAddToList', _itemAddToList.map((x) => x.serialize()).toList());
  }

  void updateItemAddToListAtIndex(
    int index,
    AddToListStruct Function(AddToListStruct) updateFn,
  ) {
    itemAddToList[index] = updateFn(_itemAddToList[index]);
    secureStorage.setStringList(
        'ff_itemAddToList', _itemAddToList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInItemAddToList(int index, AddToListStruct value) {
    itemAddToList.insert(index, value);
    secureStorage.setStringList(
        'ff_itemAddToList', _itemAddToList.map((x) => x.serialize()).toList());
  }

  List<dynamic> _season = [];
  List<dynamic> get season => _season;
  set season(List<dynamic> value) {
    _season = value;
  }

  void addToSeason(dynamic value) {
    season.add(value);
  }

  void removeFromSeason(dynamic value) {
    season.remove(value);
  }

  void removeAtIndexFromSeason(int index) {
    season.removeAt(index);
  }

  void updateSeasonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    season[index] = updateFn(_season[index]);
  }

  void insertAtIndexInSeason(int index, dynamic value) {
    season.insert(index, value);
  }

  List<BillingIntegrationStruct> _billingIntegration = [
    BillingIntegrationStruct.fromSerializableMap(
        jsonDecode('{\"url\":\"E-power Billing\"}')),
    BillingIntegrationStruct.fromSerializableMap(
        jsonDecode('{\"url\":\"Other Billing\"}'))
  ];
  List<BillingIntegrationStruct> get billingIntegration => _billingIntegration;
  set billingIntegration(List<BillingIntegrationStruct> value) {
    _billingIntegration = value;
    secureStorage.setStringList(
        'ff_billingIntegration', value.map((x) => x.serialize()).toList());
  }

  void deleteBillingIntegration() {
    secureStorage.delete(key: 'ff_billingIntegration');
  }

  void addToBillingIntegration(BillingIntegrationStruct value) {
    billingIntegration.add(value);
    secureStorage.setStringList('ff_billingIntegration',
        _billingIntegration.map((x) => x.serialize()).toList());
  }

  void removeFromBillingIntegration(BillingIntegrationStruct value) {
    billingIntegration.remove(value);
    secureStorage.setStringList('ff_billingIntegration',
        _billingIntegration.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBillingIntegration(int index) {
    billingIntegration.removeAt(index);
    secureStorage.setStringList('ff_billingIntegration',
        _billingIntegration.map((x) => x.serialize()).toList());
  }

  void updateBillingIntegrationAtIndex(
    int index,
    BillingIntegrationStruct Function(BillingIntegrationStruct) updateFn,
  ) {
    billingIntegration[index] = updateFn(_billingIntegration[index]);
    secureStorage.setStringList('ff_billingIntegration',
        _billingIntegration.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBillingIntegration(
      int index, BillingIntegrationStruct value) {
    billingIntegration.insert(index, value);
    secureStorage.setStringList('ff_billingIntegration',
        _billingIntegration.map((x) => x.serialize()).toList());
  }

  List<String> _seasons = [];
  List<String> get seasons => _seasons;
  set seasons(List<String> value) {
    _seasons = value;
  }

  void addToSeasons(String value) {
    seasons.add(value);
  }

  void removeFromSeasons(String value) {
    seasons.remove(value);
  }

  void removeAtIndexFromSeasons(int index) {
    seasons.removeAt(index);
  }

  void updateSeasonsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seasons[index] = updateFn(_seasons[index]);
  }

  void insertAtIndexInSeasons(int index, String value) {
    seasons.insert(index, value);
  }

  List<String> _tou = ['TOU 01', 'TOU 02'];
  List<String> get tou => _tou;
  set tou(List<String> value) {
    _tou = value;
  }

  void addToTou(String value) {
    tou.add(value);
  }

  void removeFromTou(String value) {
    tou.remove(value);
  }

  void removeAtIndexFromTou(int index) {
    tou.removeAt(index);
  }

  void updateTouAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tou[index] = updateFn(_tou[index]);
  }

  void insertAtIndexInTou(int index, String value) {
    tou.insert(index, value);
  }

  List<TimeBandAttributesModelStruct> _timeBandAttributes = [];
  List<TimeBandAttributesModelStruct> get timeBandAttributes =>
      _timeBandAttributes;
  set timeBandAttributes(List<TimeBandAttributesModelStruct> value) {
    _timeBandAttributes = value;
  }

  void addToTimeBandAttributes(TimeBandAttributesModelStruct value) {
    timeBandAttributes.add(value);
  }

  void removeFromTimeBandAttributes(TimeBandAttributesModelStruct value) {
    timeBandAttributes.remove(value);
  }

  void removeAtIndexFromTimeBandAttributes(int index) {
    timeBandAttributes.removeAt(index);
  }

  void updateTimeBandAttributesAtIndex(
    int index,
    TimeBandAttributesModelStruct Function(TimeBandAttributesModelStruct)
        updateFn,
  ) {
    timeBandAttributes[index] = updateFn(_timeBandAttributes[index]);
  }

  void insertAtIndexInTimeBandAttributes(
      int index, TimeBandAttributesModelStruct value) {
    timeBandAttributes.insert(index, value);
  }

  List<String> _channel = ['Channel 01', 'Channel 02'];
  List<String> get channel => _channel;
  set channel(List<String> value) {
    _channel = value;
  }

  void addToChannel(String value) {
    channel.add(value);
  }

  void removeFromChannel(String value) {
    channel.remove(value);
  }

  void removeAtIndexFromChannel(int index) {
    channel.removeAt(index);
  }

  void updateChannelAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    channel[index] = updateFn(_channel[index]);
  }

  void insertAtIndexInChannel(int index, String value) {
    channel.insert(index, value);
  }

  List<AttributeModelStruct> _timebandDataState = [
    AttributeModelStruct.fromSerializableMap(
        jsonDecode('{\"Key\":\"DayOfWeek\",\"Value\":\"[]\"}')),
    AttributeModelStruct.fromSerializableMap(
        jsonDecode('{\"Key\":\"MonthOfYear\",\"Value\":\"[]\"}')),
    AttributeModelStruct.fromSerializableMap(
        jsonDecode('{\"Key\":\"Season\",\"Value\":\"[]\"}')),
    AttributeModelStruct.fromSerializableMap(
        jsonDecode('{\"Key\":\"SpecialDay\",\"Value\":\"[]\"}'))
  ];
  List<AttributeModelStruct> get timebandDataState => _timebandDataState;
  set timebandDataState(List<AttributeModelStruct> value) {
    _timebandDataState = value;
  }

  void addToTimebandDataState(AttributeModelStruct value) {
    timebandDataState.add(value);
  }

  void removeFromTimebandDataState(AttributeModelStruct value) {
    timebandDataState.remove(value);
  }

  void removeAtIndexFromTimebandDataState(int index) {
    timebandDataState.removeAt(index);
  }

  void updateTimebandDataStateAtIndex(
    int index,
    AttributeModelStruct Function(AttributeModelStruct) updateFn,
  ) {
    timebandDataState[index] = updateFn(_timebandDataState[index]);
  }

  void insertAtIndexInTimebandDataState(int index, AttributeModelStruct value) {
    timebandDataState.insert(index, value);
  }

  List<String> _deviceStatus = ['None', 'Commissioned', 'Decommissioning'];
  List<String> get deviceStatus => _deviceStatus;
  set deviceStatus(List<String> value) {
    _deviceStatus = value;
  }

  void addToDeviceStatus(String value) {
    deviceStatus.add(value);
  }

  void removeFromDeviceStatus(String value) {
    deviceStatus.remove(value);
  }

  void removeAtIndexFromDeviceStatus(int index) {
    deviceStatus.removeAt(index);
  }

  void updateDeviceStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    deviceStatus[index] = updateFn(_deviceStatus[index]);
  }

  void insertAtIndexInDeviceStatus(int index, String value) {
    deviceStatus.insert(index, value);
  }

  String _storeName = '';
  String get storeName => _storeName;
  set storeName(String value) {
    _storeName = value;
  }

  List<String> _linkStatus = ['None', 'E-POWER', 'MULTIDRIVE'];
  List<String> get linkStatus => _linkStatus;
  set linkStatus(List<String> value) {
    _linkStatus = value;
  }

  void addToLinkStatus(String value) {
    linkStatus.add(value);
  }

  void removeFromLinkStatus(String value) {
    linkStatus.remove(value);
  }

  void removeAtIndexFromLinkStatus(int index) {
    linkStatus.removeAt(index);
  }

  void updateLinkStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    linkStatus[index] = updateFn(_linkStatus[index]);
  }

  void insertAtIndexInLinkStatus(int index, String value) {
    linkStatus.insert(index, value);
  }

  String _selectedStartTime = '';
  String get selectedStartTime => _selectedStartTime;
  set selectedStartTime(String value) {
    _selectedStartTime = value;
  }

  List<DeviceModelStruct> _deviceModel = [];
  List<DeviceModelStruct> get deviceModel => _deviceModel;
  set deviceModel(List<DeviceModelStruct> value) {
    _deviceModel = value;
  }

  void addToDeviceModel(DeviceModelStruct value) {
    deviceModel.add(value);
  }

  void removeFromDeviceModel(DeviceModelStruct value) {
    deviceModel.remove(value);
  }

  void removeAtIndexFromDeviceModel(int index) {
    deviceModel.removeAt(index);
  }

  void updateDeviceModelAtIndex(
    int index,
    DeviceModelStruct Function(DeviceModelStruct) updateFn,
  ) {
    deviceModel[index] = updateFn(_deviceModel[index]);
  }

  void insertAtIndexInDeviceModel(int index, DeviceModelStruct value) {
    deviceModel.insert(index, value);
  }

  String _selectedEndTime = '';
  String get selectedEndTime => _selectedEndTime;
  set selectedEndTime(String value) {
    _selectedEndTime = value;
  }

  List<UserObjectStruct> _EmailListTamp = [
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shoppir-dashboard-kra943/assets/rlfb04uklwtz/SCR-20240229-muwj.png\",\"email\":\"E-power Billing\",\"displayName\":\"DZy\"}')),
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shoppir-dashboard-kra943/assets/pakxml7gwpto/avatar03.png\",\"email\":\"Oone Billing\",\"displayName\":\"Zubal\"}')),
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"https://picsum.photos/seed/302/600\",\"email\":\"Other Billing\",\"displayName\":\"Test Ue\"}')),
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"https://picsum.photos/seed/226/600\",\"email\":\"fdsfsggas@gmail.com\",\"displayName\":\"dfsf\"}'))
  ];
  List<UserObjectStruct> get EmailListTamp => _EmailListTamp;
  set EmailListTamp(List<UserObjectStruct> value) {
    _EmailListTamp = value;
  }

  void addToEmailListTamp(UserObjectStruct value) {
    EmailListTamp.add(value);
  }

  void removeFromEmailListTamp(UserObjectStruct value) {
    EmailListTamp.remove(value);
  }

  void removeAtIndexFromEmailListTamp(int index) {
    EmailListTamp.removeAt(index);
  }

  void updateEmailListTampAtIndex(
    int index,
    UserObjectStruct Function(UserObjectStruct) updateFn,
  ) {
    EmailListTamp[index] = updateFn(_EmailListTamp[index]);
  }

  void insertAtIndexInEmailListTamp(int index, UserObjectStruct value) {
    EmailListTamp.insert(index, value);
  }

  List<SeasonModelStruct> _seasonState = [];
  List<SeasonModelStruct> get seasonState => _seasonState;
  set seasonState(List<SeasonModelStruct> value) {
    _seasonState = value;
  }

  void addToSeasonState(SeasonModelStruct value) {
    seasonState.add(value);
  }

  void removeFromSeasonState(SeasonModelStruct value) {
    seasonState.remove(value);
  }

  void removeAtIndexFromSeasonState(int index) {
    seasonState.removeAt(index);
  }

  void updateSeasonStateAtIndex(
    int index,
    SeasonModelStruct Function(SeasonModelStruct) updateFn,
  ) {
    seasonState[index] = updateFn(_seasonState[index]);
  }

  void insertAtIndexInSeasonState(int index, SeasonModelStruct value) {
    seasonState.insert(index, value);
  }

  List<String> _initialItem = [];
  List<String> get initialItem => _initialItem;
  set initialItem(List<String> value) {
    _initialItem = value;
  }

  void addToInitialItem(String value) {
    initialItem.add(value);
  }

  void removeFromInitialItem(String value) {
    initialItem.remove(value);
  }

  void removeAtIndexFromInitialItem(int index) {
    initialItem.removeAt(index);
  }

  void updateInitialItemAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    initialItem[index] = updateFn(_initialItem[index]);
  }

  void insertAtIndexInInitialItem(int index, String value) {
    initialItem.insert(index, value);
  }

  List<TimeOfUseStruct> _timeOfUse = [];
  List<TimeOfUseStruct> get timeOfUse => _timeOfUse;
  set timeOfUse(List<TimeOfUseStruct> value) {
    _timeOfUse = value;
  }

  void addToTimeOfUse(TimeOfUseStruct value) {
    timeOfUse.add(value);
  }

  void removeFromTimeOfUse(TimeOfUseStruct value) {
    timeOfUse.remove(value);
  }

  void removeAtIndexFromTimeOfUse(int index) {
    timeOfUse.removeAt(index);
  }

  void updateTimeOfUseAtIndex(
    int index,
    TimeOfUseStruct Function(TimeOfUseStruct) updateFn,
  ) {
    timeOfUse[index] = updateFn(_timeOfUse[index]);
  }

  void insertAtIndexInTimeOfUse(int index, TimeOfUseStruct value) {
    timeOfUse.insert(index, value);
  }

  List<UserObjectStruct> _HesList = [
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"\",\"email\":\"E-Power HES\",\"displayName\":\"Hello World\"}')),
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"https://picsum.photos/seed/926/600\",\"email\":\"Oone HES\",\"displayName\":\"Hello World\"}')),
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"https://picsum.photos/seed/249/600\",\"email\":\"Other HES\",\"displayName\":\"Hello World\"}')),
    UserObjectStruct.fromSerializableMap(jsonDecode(
        '{\"avatar\":\"https://picsum.photos/seed/114/600\",\"email\":\"Multidrive HES\",\"displayName\":\"Hello World\"}'))
  ];
  List<UserObjectStruct> get HesList => _HesList;
  set HesList(List<UserObjectStruct> value) {
    _HesList = value;
  }

  void addToHesList(UserObjectStruct value) {
    HesList.add(value);
  }

  void removeFromHesList(UserObjectStruct value) {
    HesList.remove(value);
  }

  void removeAtIndexFromHesList(int index) {
    HesList.removeAt(index);
  }

  void updateHesListAtIndex(
    int index,
    UserObjectStruct Function(UserObjectStruct) updateFn,
  ) {
    HesList[index] = updateFn(_HesList[index]);
  }

  void insertAtIndexInHesList(int index, UserObjectStruct value) {
    HesList.insert(index, value);
  }

  List<String> _timeTouList = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23'
  ];
  List<String> get timeTouList => _timeTouList;
  set timeTouList(List<String> value) {
    _timeTouList = value;
  }

  void addToTimeTouList(String value) {
    timeTouList.add(value);
  }

  void removeFromTimeTouList(String value) {
    timeTouList.remove(value);
  }

  void removeAtIndexFromTimeTouList(int index) {
    timeTouList.removeAt(index);
  }

  void updateTimeTouListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    timeTouList[index] = updateFn(_timeTouList[index]);
  }

  void insertAtIndexInTimeTouList(int index, String value) {
    timeTouList.insert(index, value);
  }

  List<ChannelStruct> _DeviceChannel = [];
  List<ChannelStruct> get DeviceChannel => _DeviceChannel;
  set DeviceChannel(List<ChannelStruct> value) {
    _DeviceChannel = value;
  }

  void addToDeviceChannel(ChannelStruct value) {
    DeviceChannel.add(value);
  }

  void removeFromDeviceChannel(ChannelStruct value) {
    DeviceChannel.remove(value);
  }

  void removeAtIndexFromDeviceChannel(int index) {
    DeviceChannel.removeAt(index);
  }

  void updateDeviceChannelAtIndex(
    int index,
    ChannelStruct Function(ChannelStruct) updateFn,
  ) {
    DeviceChannel[index] = updateFn(_DeviceChannel[index]);
  }

  void insertAtIndexInDeviceChannel(int index, ChannelStruct value) {
    DeviceChannel.insert(index, value);
  }

  List<String> _DayTou = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  List<String> get DayTou => _DayTou;
  set DayTou(List<String> value) {
    _DayTou = value;
  }

  void addToDayTou(String value) {
    DayTou.add(value);
  }

  void removeFromDayTou(String value) {
    DayTou.remove(value);
  }

  void removeAtIndexFromDayTou(int index) {
    DayTou.removeAt(index);
  }

  void updateDayTouAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    DayTou[index] = updateFn(_DayTou[index]);
  }

  void insertAtIndexInDayTou(int index, String value) {
    DayTou.insert(index, value);
  }

  List<String> _DeviceType = ['Smart Meter', 'IoT'];
  List<String> get DeviceType => _DeviceType;
  set DeviceType(List<String> value) {
    _DeviceType = value;
  }

  void addToDeviceType(String value) {
    DeviceType.add(value);
  }

  void removeFromDeviceType(String value) {
    DeviceType.remove(value);
  }

  void removeAtIndexFromDeviceType(int index) {
    DeviceType.removeAt(index);
  }

  void updateDeviceTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    DeviceType[index] = updateFn(_DeviceType[index]);
  }

  void insertAtIndexInDeviceType(int index, String value) {
    DeviceType.insert(index, value);
  }

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
  }

  bool _Isnew = false;
  bool get Isnew => _Isnew;
  set Isnew(bool value) {
    _Isnew = value;
  }

  List<Color> _listColor = [];
  List<Color> get listColor => _listColor;
  set listColor(List<Color> value) {
    _listColor = value;
  }

  void addToListColor(Color value) {
    listColor.add(value);
  }

  void removeFromListColor(Color value) {
    listColor.remove(value);
  }

  void removeAtIndexFromListColor(int index) {
    listColor.removeAt(index);
  }

  void updateListColorAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    listColor[index] = updateFn(_listColor[index]);
  }

  void insertAtIndexInListColor(int index, Color value) {
    listColor.insert(index, value);
  }

  String _storeSerialNum = '';
  String get storeSerialNum => _storeSerialNum;
  set storeSerialNum(String value) {
    _storeSerialNum = value;
  }

  Color _storeColor = Colors.transparent;
  Color get storeColor => _storeColor;
  set storeColor(Color value) {
    _storeColor = value;
  }

  DeviceListStruct _deviceList = DeviceListStruct();
  DeviceListStruct get deviceList => _deviceList;
  set deviceList(DeviceListStruct value) {
    _deviceList = value;
  }

  void updateDeviceListStruct(Function(DeviceListStruct) updateFn) {
    updateFn(_deviceList);
  }

  int _indexColor = 0;
  int get indexColor => _indexColor;
  set indexColor(int value) {
    _indexColor = value;
  }

  bool _piechart = false;
  bool get piechart => _piechart;
  set piechart(bool value) {
    _piechart = value;
  }

  List<int> _listIndexColor = [];
  List<int> get listIndexColor => _listIndexColor;
  set listIndexColor(List<int> value) {
    _listIndexColor = value;
  }

  void addToListIndexColor(int value) {
    listIndexColor.add(value);
  }

  void removeFromListIndexColor(int value) {
    listIndexColor.remove(value);
  }

  void removeAtIndexFromListIndexColor(int index) {
    listIndexColor.removeAt(index);
  }

  void updateListIndexColorAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    listIndexColor[index] = updateFn(_listIndexColor[index]);
  }

  void insertAtIndexInListIndexColor(int index, int value) {
    listIndexColor.insert(index, value);
  }

  bool _tablepie = false;
  bool get tablepie => _tablepie;
  set tablepie(bool value) {
    _tablepie = value;
  }

  String _storeCode = '';
  String get storeCode => _storeCode;
  set storeCode(String value) {
    _storeCode = value;
  }

  List<String> _Chartdata = ['K1', 'K2', 'K3', 'K4', 'K5'];
  List<String> get Chartdata => _Chartdata;
  set Chartdata(List<String> value) {
    _Chartdata = value;
  }

  void addToChartdata(String value) {
    Chartdata.add(value);
  }

  void removeFromChartdata(String value) {
    Chartdata.remove(value);
  }

  void removeAtIndexFromChartdata(int index) {
    Chartdata.removeAt(index);
  }

  void updateChartdataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Chartdata[index] = updateFn(_Chartdata[index]);
  }

  void insertAtIndexInChartdata(int index, String value) {
    Chartdata.insert(index, value);
  }

  List<Color> _colorsPickOffPick = [
    Color(4292030255),
    Color(4294278144),
    Color(4294688813),
    Color(4281896508),
    Color(4278221163),
    Color(4279858898),
    Color(4286259106),
    Color(4290910299),
    Color(4284301367),
    Color(4294954450),
    Color(4294959282),
    Color(4294965700),
    Color(4291356361),
    Color(4289912795),
    Color(4290502395),
    Color(4292984551),
    Color(4294491088),
    Color(4292332744)
  ];
  List<Color> get colorsPickOffPick => _colorsPickOffPick;
  set colorsPickOffPick(List<Color> value) {
    _colorsPickOffPick = value;
    secureStorage.setStringList(
        'ff_colorsPickOffPick', value.map((x) => x.value.toString()).toList());
  }

  void deleteColorsPickOffPick() {
    secureStorage.delete(key: 'ff_colorsPickOffPick');
  }

  void addToColorsPickOffPick(Color value) {
    colorsPickOffPick.add(value);
    secureStorage.setStringList('ff_colorsPickOffPick',
        _colorsPickOffPick.map((x) => x.value.toString()).toList());
  }

  void removeFromColorsPickOffPick(Color value) {
    colorsPickOffPick.remove(value);
    secureStorage.setStringList('ff_colorsPickOffPick',
        _colorsPickOffPick.map((x) => x.value.toString()).toList());
  }

  void removeAtIndexFromColorsPickOffPick(int index) {
    colorsPickOffPick.removeAt(index);
    secureStorage.setStringList('ff_colorsPickOffPick',
        _colorsPickOffPick.map((x) => x.value.toString()).toList());
  }

  void updateColorsPickOffPickAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    colorsPickOffPick[index] = updateFn(_colorsPickOffPick[index]);
    secureStorage.setStringList('ff_colorsPickOffPick',
        _colorsPickOffPick.map((x) => x.value.toString()).toList());
  }

  void insertAtIndexInColorsPickOffPick(int index, Color value) {
    colorsPickOffPick.insert(index, value);
    secureStorage.setStringList('ff_colorsPickOffPick',
        _colorsPickOffPick.map((x) => x.value.toString()).toList());
  }

  bool _isclicktab = false;
  bool get isclicktab => _isclicktab;
  set isclicktab(bool value) {
    _isclicktab = value;
  }

  List<String> _TimeSlot = [
    '00:00',
    '00:15',
    '00:30',
    '00:45',
    '01:00',
    '01:15',
    '01:30',
    '01:45',
    '02:00',
    '02:15',
    '02:30',
    '02:45',
    '03:00',
    '03:15',
    '03:30',
    '03:45',
    '04:00',
    '04:15',
    '04:30',
    '04:45',
    '05:00',
    '05:15',
    '05:30',
    '05:45',
    '06:00',
    '06:15',
    '06:30',
    '06:45',
    '07:00',
    '07:15',
    '07:30',
    '07:45',
    '08:00',
    '08:15',
    '08:30',
    '08:45',
    '09:00',
    '09:15',
    '09:30',
    '09:45',
    '10:00',
    '10:15',
    '10:30',
    '10:45',
    '11:00',
    '11:15',
    '11:30',
    '11:45',
    '12:00',
    '12:15',
    '12:30',
    '12:45',
    '13:00',
    '13:15',
    '13:30',
    '13:45',
    '14:00',
    '14:15',
    '14:30',
    '14:45',
    '15:00',
    '15:15',
    '15:30',
    '15:45',
    '16:00',
    '16:15',
    '16:30',
    '16:45',
    '17:00',
    '17:15',
    '17:30',
    '17:45',
    '18:00',
    '18:15',
    '18:30',
    '18:45',
    '19:00',
    '19:15',
    '19:30',
    '19:45',
    '20:00',
    '20:15',
    '20:30',
    '20:45',
    '21:00',
    '21:15',
    '21:30',
    '21:45',
    '22:00',
    '22:15',
    '22:30',
    '22:45',
    '23:00',
    '23:15',
    '23:30',
    '23:45',
    '24:00'
  ];
  List<String> get TimeSlot => _TimeSlot;
  set TimeSlot(List<String> value) {
    _TimeSlot = value;
  }

  void addToTimeSlot(String value) {
    TimeSlot.add(value);
  }

  void removeFromTimeSlot(String value) {
    TimeSlot.remove(value);
  }

  void removeAtIndexFromTimeSlot(int index) {
    TimeSlot.removeAt(index);
  }

  void updateTimeSlotAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    TimeSlot[index] = updateFn(_TimeSlot[index]);
  }

  void insertAtIndexInTimeSlot(int index, String value) {
    TimeSlot.insert(index, value);
  }

  String _dStartDate = '';
  String get dStartDate => _dStartDate;
  set dStartDate(String value) {
    _dStartDate = value;
  }

  List<TimeOfUseDetailListStruct> _TimeOfUseDetailList = [];
  List<TimeOfUseDetailListStruct> get TimeOfUseDetailList =>
      _TimeOfUseDetailList;
  set TimeOfUseDetailList(List<TimeOfUseDetailListStruct> value) {
    _TimeOfUseDetailList = value;
  }

  void addToTimeOfUseDetailList(TimeOfUseDetailListStruct value) {
    TimeOfUseDetailList.add(value);
  }

  void removeFromTimeOfUseDetailList(TimeOfUseDetailListStruct value) {
    TimeOfUseDetailList.remove(value);
  }

  void removeAtIndexFromTimeOfUseDetailList(int index) {
    TimeOfUseDetailList.removeAt(index);
  }

  void updateTimeOfUseDetailListAtIndex(
    int index,
    TimeOfUseDetailListStruct Function(TimeOfUseDetailListStruct) updateFn,
  ) {
    TimeOfUseDetailList[index] = updateFn(_TimeOfUseDetailList[index]);
  }

  void insertAtIndexInTimeOfUseDetailList(
      int index, TimeOfUseDetailListStruct value) {
    TimeOfUseDetailList.insert(index, value);
  }

  String _dEndDate = '';
  String get dEndDate => _dEndDate;
  set dEndDate(String value) {
    _dEndDate = value;
  }

  String _specialDayNameStore = '';
  String get specialDayNameStore => _specialDayNameStore;
  set specialDayNameStore(String value) {
    _specialDayNameStore = value;
    secureStorage.setString('ff_specialDayNameStore', value);
  }

  void deleteSpecialDayNameStore() {
    secureStorage.delete(key: 'ff_specialDayNameStore');
  }

  bool _clickdefault = false;
  bool get clickdefault => _clickdefault;
  set clickdefault(bool value) {
    _clickdefault = value;
  }

  DateTime? _currentDate;
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
  }

  bool _switch1 = false;
  bool get switch1 => _switch1;
  set switch1(bool value) {
    _switch1 = value;
  }

  bool _switch2 = false;
  bool get switch2 => _switch2;
  set switch2(bool value) {
    _switch2 = value;
  }

  JsonLabelStruct _jsonLabeldMetrics = JsonLabelStruct();
  JsonLabelStruct get jsonLabeldMetrics => _jsonLabeldMetrics;
  set jsonLabeldMetrics(JsonLabelStruct value) {
    _jsonLabeldMetrics = value;
  }

  void updateJsonLabeldMetricsStruct(Function(JsonLabelStruct) updateFn) {
    updateFn(_jsonLabeldMetrics);
  }

  List<String> _listName = [];
  List<String> get listName => _listName;
  set listName(List<String> value) {
    _listName = value;
  }

  void addToListName(String value) {
    listName.add(value);
  }

  void removeFromListName(String value) {
    listName.remove(value);
  }

  void removeAtIndexFromListName(int index) {
    listName.removeAt(index);
  }

  void updateListNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listName[index] = updateFn(_listName[index]);
  }

  void insertAtIndexInListName(int index, String value) {
    listName.insert(index, value);
  }

  List<MetricsStruct> _dMetricsModel = [];
  List<MetricsStruct> get dMetricsModel => _dMetricsModel;
  set dMetricsModel(List<MetricsStruct> value) {
    _dMetricsModel = value;
  }

  void addToDMetricsModel(MetricsStruct value) {
    dMetricsModel.add(value);
  }

  void removeFromDMetricsModel(MetricsStruct value) {
    dMetricsModel.remove(value);
  }

  void removeAtIndexFromDMetricsModel(int index) {
    dMetricsModel.removeAt(index);
  }

  void updateDMetricsModelAtIndex(
    int index,
    MetricsStruct Function(MetricsStruct) updateFn,
  ) {
    dMetricsModel[index] = updateFn(_dMetricsModel[index]);
  }

  void insertAtIndexInDMetricsModel(int index, MetricsStruct value) {
    dMetricsModel.insert(index, value);
  }

  String _selectedTab = '';
  String get selectedTab => _selectedTab;
  set selectedTab(String value) {
    _selectedTab = value;
  }

  WhereStruct _jsonRequestDmetrics = WhereStruct();
  WhereStruct get jsonRequestDmetrics => _jsonRequestDmetrics;
  set jsonRequestDmetrics(WhereStruct value) {
    _jsonRequestDmetrics = value;
  }

  void updateJsonRequestDmetricsStruct(Function(WhereStruct) updateFn) {
    updateFn(_jsonRequestDmetrics);
  }

  LabelsStruct _labelsdMetrics = LabelsStruct();
  LabelsStruct get labelsdMetrics => _labelsdMetrics;
  set labelsdMetrics(LabelsStruct value) {
    _labelsdMetrics = value;
  }

  void updateLabelsdMetricsStruct(Function(LabelsStruct) updateFn) {
    updateFn(_labelsdMetrics);
  }

  List<WheresStruct> _requestOr = [];
  List<WheresStruct> get requestOr => _requestOr;
  set requestOr(List<WheresStruct> value) {
    _requestOr = value;
  }

  void addToRequestOr(WheresStruct value) {
    requestOr.add(value);
  }

  void removeFromRequestOr(WheresStruct value) {
    requestOr.remove(value);
  }

  void removeAtIndexFromRequestOr(int index) {
    requestOr.removeAt(index);
  }

  void updateRequestOrAtIndex(
    int index,
    WheresStruct Function(WheresStruct) updateFn,
  ) {
    requestOr[index] = updateFn(_requestOr[index]);
  }

  void insertAtIndexInRequestOr(int index, WheresStruct value) {
    requestOr.insert(index, value);
  }

  dynamic _storeJsonData;
  dynamic get storeJsonData => _storeJsonData;
  set storeJsonData(dynamic value) {
    _storeJsonData = value;
  }

  DeviceMetricsStruct _DeviceMetricsFromJS = DeviceMetricsStruct();
  DeviceMetricsStruct get DeviceMetricsFromJS => _DeviceMetricsFromJS;
  set DeviceMetricsFromJS(DeviceMetricsStruct value) {
    _DeviceMetricsFromJS = value;
  }

  void updateDeviceMetricsFromJSStruct(Function(DeviceMetricsStruct) updateFn) {
    updateFn(_DeviceMetricsFromJS);
  }

  List<String> _nameList = [];
  List<String> get nameList => _nameList;
  set nameList(List<String> value) {
    _nameList = value;
  }

  void addToNameList(String value) {
    nameList.add(value);
  }

  void removeFromNameList(String value) {
    nameList.remove(value);
  }

  void removeAtIndexFromNameList(int index) {
    nameList.removeAt(index);
  }

  void updateNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nameList[index] = updateFn(_nameList[index]);
  }

  void insertAtIndexInNameList(int index, String value) {
    nameList.insert(index, value);
  }

  dynamic _jsonbodyStore;
  dynamic get jsonbodyStore => _jsonbodyStore;
  set jsonbodyStore(dynamic value) {
    _jsonbodyStore = value;
  }

  List<String> _listLabels = ['Units'];
  List<String> get listLabels => _listLabels;
  set listLabels(List<String> value) {
    _listLabels = value;
  }

  void addToListLabels(String value) {
    listLabels.add(value);
  }

  void removeFromListLabels(String value) {
    listLabels.remove(value);
  }

  void removeAtIndexFromListLabels(int index) {
    listLabels.removeAt(index);
  }

  void updateListLabelsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listLabels[index] = updateFn(_listLabels[index]);
  }

  void insertAtIndexInListLabels(int index, String value) {
    listLabels.insert(index, value);
  }

  List<MetricsStruct> _storFilterMetrics = [];
  List<MetricsStruct> get storFilterMetrics => _storFilterMetrics;
  set storFilterMetrics(List<MetricsStruct> value) {
    _storFilterMetrics = value;
  }

  void addToStorFilterMetrics(MetricsStruct value) {
    storFilterMetrics.add(value);
  }

  void removeFromStorFilterMetrics(MetricsStruct value) {
    storFilterMetrics.remove(value);
  }

  void removeAtIndexFromStorFilterMetrics(int index) {
    storFilterMetrics.removeAt(index);
  }

  void updateStorFilterMetricsAtIndex(
    int index,
    MetricsStruct Function(MetricsStruct) updateFn,
  ) {
    storFilterMetrics[index] = updateFn(_storFilterMetrics[index]);
  }

  void insertAtIndexInStorFilterMetrics(int index, MetricsStruct value) {
    storFilterMetrics.insert(index, value);
  }

  List<ChannelStruct> _dChannelModel = [];
  List<ChannelStruct> get dChannelModel => _dChannelModel;
  set dChannelModel(List<ChannelStruct> value) {
    _dChannelModel = value;
  }

  void addToDChannelModel(ChannelStruct value) {
    dChannelModel.add(value);
  }

  void removeFromDChannelModel(ChannelStruct value) {
    dChannelModel.remove(value);
  }

  void removeAtIndexFromDChannelModel(int index) {
    dChannelModel.removeAt(index);
  }

  void updateDChannelModelAtIndex(
    int index,
    ChannelStruct Function(ChannelStruct) updateFn,
  ) {
    dChannelModel[index] = updateFn(_dChannelModel[index]);
  }

  void insertAtIndexInDChannelModel(int index, ChannelStruct value) {
    dChannelModel.insert(index, value);
  }

  List<DeviceAttributesStruct> _dAttributesMdel = [];
  List<DeviceAttributesStruct> get dAttributesMdel => _dAttributesMdel;
  set dAttributesMdel(List<DeviceAttributesStruct> value) {
    _dAttributesMdel = value;
  }

  void addToDAttributesMdel(DeviceAttributesStruct value) {
    dAttributesMdel.add(value);
  }

  void removeFromDAttributesMdel(DeviceAttributesStruct value) {
    dAttributesMdel.remove(value);
  }

  void removeAtIndexFromDAttributesMdel(int index) {
    dAttributesMdel.removeAt(index);
  }

  void updateDAttributesMdelAtIndex(
    int index,
    DeviceAttributesStruct Function(DeviceAttributesStruct) updateFn,
  ) {
    dAttributesMdel[index] = updateFn(_dAttributesMdel[index]);
  }

  void insertAtIndexInDAttributesMdel(int index, DeviceAttributesStruct value) {
    dAttributesMdel.insert(index, value);
  }

  List<dynamic> _filteredDevices = [];
  List<dynamic> get filteredDevices => _filteredDevices;
  set filteredDevices(List<dynamic> value) {
    _filteredDevices = value;
  }

  void addToFilteredDevices(dynamic value) {
    filteredDevices.add(value);
  }

  void removeFromFilteredDevices(dynamic value) {
    filteredDevices.remove(value);
  }

  void removeAtIndexFromFilteredDevices(int index) {
    filteredDevices.removeAt(index);
  }

  void updateFilteredDevicesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    filteredDevices[index] = updateFn(_filteredDevices[index]);
  }

  void insertAtIndexInFilteredDevices(int index, dynamic value) {
    filteredDevices.insert(index, value);
  }

  GenerateDataDeviceStruct _generateDataDevice = GenerateDataDeviceStruct();
  GenerateDataDeviceStruct get generateDataDevice => _generateDataDevice;
  set generateDataDevice(GenerateDataDeviceStruct value) {
    _generateDataDevice = value;
  }

  void updateGenerateDataDeviceStruct(
      Function(GenerateDataDeviceStruct) updateFn) {
    updateFn(_generateDataDevice);
  }

  bool _formvalidation = false;
  bool get formvalidation => _formvalidation;
  set formvalidation(bool value) {
    _formvalidation = value;
  }

  bool _checkBoxSelect = false;
  bool get checkBoxSelect => _checkBoxSelect;
  set checkBoxSelect(bool value) {
    _checkBoxSelect = value;
  }

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int value) {
    _tabIndex = value;
  }

  List<ScheduleStruct> _dScheduleModel = [];
  List<ScheduleStruct> get dScheduleModel => _dScheduleModel;
  set dScheduleModel(List<ScheduleStruct> value) {
    _dScheduleModel = value;
  }

  void addToDScheduleModel(ScheduleStruct value) {
    dScheduleModel.add(value);
  }

  void removeFromDScheduleModel(ScheduleStruct value) {
    dScheduleModel.remove(value);
  }

  void removeAtIndexFromDScheduleModel(int index) {
    dScheduleModel.removeAt(index);
  }

  void updateDScheduleModelAtIndex(
    int index,
    ScheduleStruct Function(ScheduleStruct) updateFn,
  ) {
    dScheduleModel[index] = updateFn(_dScheduleModel[index]);
  }

  void insertAtIndexInDScheduleModel(int index, ScheduleStruct value) {
    dScheduleModel.insert(index, value);
  }

  List<DeviceGroupModelStruct> _dropDownGroupDevice = [];
  List<DeviceGroupModelStruct> get dropDownGroupDevice => _dropDownGroupDevice;
  set dropDownGroupDevice(List<DeviceGroupModelStruct> value) {
    _dropDownGroupDevice = value;
  }

  void addToDropDownGroupDevice(DeviceGroupModelStruct value) {
    dropDownGroupDevice.add(value);
  }

  void removeFromDropDownGroupDevice(DeviceGroupModelStruct value) {
    dropDownGroupDevice.remove(value);
  }

  void removeAtIndexFromDropDownGroupDevice(int index) {
    dropDownGroupDevice.removeAt(index);
  }

  void updateDropDownGroupDeviceAtIndex(
    int index,
    DeviceGroupModelStruct Function(DeviceGroupModelStruct) updateFn,
  ) {
    dropDownGroupDevice[index] = updateFn(_dropDownGroupDevice[index]);
  }

  void insertAtIndexInDropDownGroupDevice(
      int index, DeviceGroupModelStruct value) {
    dropDownGroupDevice.insert(index, value);
  }

  List<StatusDevice> _dDeviceStatus = [];
  List<StatusDevice> get dDeviceStatus => _dDeviceStatus;
  set dDeviceStatus(List<StatusDevice> value) {
    _dDeviceStatus = value;
  }

  void addToDDeviceStatus(StatusDevice value) {
    dDeviceStatus.add(value);
  }

  void removeFromDDeviceStatus(StatusDevice value) {
    dDeviceStatus.remove(value);
  }

  void removeAtIndexFromDDeviceStatus(int index) {
    dDeviceStatus.removeAt(index);
  }

  void updateDDeviceStatusAtIndex(
    int index,
    StatusDevice Function(StatusDevice) updateFn,
  ) {
    dDeviceStatus[index] = updateFn(_dDeviceStatus[index]);
  }

  void insertAtIndexInDDeviceStatus(int index, StatusDevice value) {
    dDeviceStatus.insert(index, value);
  }

  bool _statusSwitch = false;
  bool get statusSwitch => _statusSwitch;
  set statusSwitch(bool value) {
    _statusSwitch = value;
  }

  List<String> _listCheckBox = [];
  List<String> get listCheckBox => _listCheckBox;
  set listCheckBox(List<String> value) {
    _listCheckBox = value;
  }

  void addToListCheckBox(String value) {
    listCheckBox.add(value);
  }

  void removeFromListCheckBox(String value) {
    listCheckBox.remove(value);
  }

  void removeAtIndexFromListCheckBox(int index) {
    listCheckBox.removeAt(index);
  }

  void updateListCheckBoxAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listCheckBox[index] = updateFn(_listCheckBox[index]);
  }

  void insertAtIndexInListCheckBox(int index, String value) {
    listCheckBox.insert(index, value);
  }

  LatLng? _StoreMap = LatLng(11.5945062, 104.8577052);
  LatLng? get StoreMap => _StoreMap;
  set StoreMap(LatLng? value) {
    _StoreMap = value;
  }

  bool _isCheckAlls = false;
  bool get isCheckAlls => _isCheckAlls;
  set isCheckAlls(bool value) {
    _isCheckAlls = value;
  }

  List<DeviceGroupModelStruct> _deviceGroups = [];
  List<DeviceGroupModelStruct> get deviceGroups => _deviceGroups;
  set deviceGroups(List<DeviceGroupModelStruct> value) {
    _deviceGroups = value;
  }

  void addToDeviceGroups(DeviceGroupModelStruct value) {
    deviceGroups.add(value);
  }

  void removeFromDeviceGroups(DeviceGroupModelStruct value) {
    deviceGroups.remove(value);
  }

  void removeAtIndexFromDeviceGroups(int index) {
    deviceGroups.removeAt(index);
  }

  void updateDeviceGroupsAtIndex(
    int index,
    DeviceGroupModelStruct Function(DeviceGroupModelStruct) updateFn,
  ) {
    deviceGroups[index] = updateFn(_deviceGroups[index]);
  }

  void insertAtIndexInDeviceGroups(int index, DeviceGroupModelStruct value) {
    deviceGroups.insert(index, value);
  }

  double _latitude = 0.0;
  double get latitude => _latitude;
  set latitude(double value) {
    _latitude = value;
  }

  double _longitude = 0.0;
  double get longitude => _longitude;
  set longitude(double value) {
    _longitude = value;
  }

  bool _isTrigger = false;
  bool get isTrigger => _isTrigger;
  set isTrigger(bool value) {
    _isTrigger = value;
  }

  String _address = '';
  String get address => _address;
  set address(String value) {
    _address = value;
  }

  String _storLatLng = '';
  String get storLatLng => _storLatLng;
  set storLatLng(String value) {
    _storLatLng = value;
  }

  String _storMapString = '';
  String get storMapString => _storMapString;
  set storMapString(String value) {
    _storMapString = value;
  }

  int _totalPage = 0;
  int get totalPage => _totalPage;
  set totalPage(int value) {
    _totalPage = value;
  }

  List<ScheduleStruct> _Schedule = [];
  List<ScheduleStruct> get Schedule => _Schedule;
  set Schedule(List<ScheduleStruct> value) {
    _Schedule = value;
  }

  void addToSchedule(ScheduleStruct value) {
    Schedule.add(value);
  }

  void removeFromSchedule(ScheduleStruct value) {
    Schedule.remove(value);
  }

  void removeAtIndexFromSchedule(int index) {
    Schedule.removeAt(index);
  }

  void updateScheduleAtIndex(
    int index,
    ScheduleStruct Function(ScheduleStruct) updateFn,
  ) {
    Schedule[index] = updateFn(_Schedule[index]);
  }

  void insertAtIndexInSchedule(int index, ScheduleStruct value) {
    Schedule.insert(index, value);
  }

  String _storeSchedule = '';
  String get storeSchedule => _storeSchedule;
  set storeSchedule(String value) {
    _storeSchedule = value;
  }

  String _storLat = '';
  String get storLat => _storLat;
  set storLat(String value) {
    _storLat = value;
  }

  List<ScheduleStruct> _schecduleDeviceGroup = [];
  List<ScheduleStruct> get schecduleDeviceGroup => _schecduleDeviceGroup;
  set schecduleDeviceGroup(List<ScheduleStruct> value) {
    _schecduleDeviceGroup = value;
  }

  void addToSchecduleDeviceGroup(ScheduleStruct value) {
    schecduleDeviceGroup.add(value);
  }

  void removeFromSchecduleDeviceGroup(ScheduleStruct value) {
    schecduleDeviceGroup.remove(value);
  }

  void removeAtIndexFromSchecduleDeviceGroup(int index) {
    schecduleDeviceGroup.removeAt(index);
  }

  void updateSchecduleDeviceGroupAtIndex(
    int index,
    ScheduleStruct Function(ScheduleStruct) updateFn,
  ) {
    schecduleDeviceGroup[index] = updateFn(_schecduleDeviceGroup[index]);
  }

  void insertAtIndexInSchecduleDeviceGroup(int index, ScheduleStruct value) {
    schecduleDeviceGroup.insert(index, value);
  }

  List<String> _StoreMapList = [];
  List<String> get StoreMapList => _StoreMapList;
  set StoreMapList(List<String> value) {
    _StoreMapList = value;
  }

  void addToStoreMapList(String value) {
    StoreMapList.add(value);
  }

  void removeFromStoreMapList(String value) {
    StoreMapList.remove(value);
  }

  void removeAtIndexFromStoreMapList(int index) {
    StoreMapList.removeAt(index);
  }

  void updateStoreMapListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    StoreMapList[index] = updateFn(_StoreMapList[index]);
  }

  void insertAtIndexInStoreMapList(int index, String value) {
    StoreMapList.insert(index, value);
  }

  List<String> _listMaps = [];
  List<String> get listMaps => _listMaps;
  set listMaps(List<String> value) {
    _listMaps = value;
  }

  void addToListMaps(String value) {
    listMaps.add(value);
  }

  void removeFromListMaps(String value) {
    listMaps.remove(value);
  }

  void removeAtIndexFromListMaps(int index) {
    listMaps.removeAt(index);
  }

  void updateListMapsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listMaps[index] = updateFn(_listMaps[index]);
  }

  void insertAtIndexInListMaps(int index, String value) {
    listMaps.insert(index, value);
  }

  AddressStruct _newListMap = AddressStruct();
  AddressStruct get newListMap => _newListMap;
  set newListMap(AddressStruct value) {
    _newListMap = value;
  }

  void updateNewListMapStruct(Function(AddressStruct) updateFn) {
    updateFn(_newListMap);
  }
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
