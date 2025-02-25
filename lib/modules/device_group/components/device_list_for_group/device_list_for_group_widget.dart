import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button/primary_button_widget.dart';
import '/components/system_logic/secoundary_button/secoundary_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/deviecs/components/c_action_v1/c_action_v1_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'device_list_for_group_model.dart';
export 'device_list_for_group_model.dart';

class DeviceListForGroupWidget extends StatefulWidget {
  const DeviceListForGroupWidget({
    super.key,
    this.onConfirm,
    this.selectedDevices,
  });

  final Future Function(List<DeviceModelStruct> devices)? onConfirm;
  final List<DeviceModelStruct>? selectedDevices;

  @override
  State<DeviceListForGroupWidget> createState() =>
      _DeviceListForGroupWidgetState();
}

class _DeviceListForGroupWidgetState extends State<DeviceListForGroupWidget> {
  late DeviceListForGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceListForGroupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deviceSelete =
          widget.selectedDevices!.toList().cast<DeviceModelStruct>();
      safeSetState(() {});
      await _model.search(context);
      safeSetState(() {});
    });

    _model.textSearchTextController ??= TextEditingController();
    _model.textSearchFocusNode ??= FocusNode();

    _model.currentPageTextController ??=
        TextEditingController(text: _model.currentPage.toString());
    _model.currentPageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<epower_library_llyhdh_app_state.FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 1200.0,
        height: 800.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'f4hknbof' /* Device */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 100.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        hoverColor: FlutterFlowTheme.of(context).alternate,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Visibility(
                    visible: responsiveVisibility(
                      context: context,
                      phone: false,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 300.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model
                                                  .textSearchTextController,
                                              focusNode:
                                                  _model.textSearchFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textSearchTextController',
                                                Duration(milliseconds: 300),
                                                () async {
                                                  await _model.search(context);
                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0y2wghtl' /* Search */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                suffixIcon: _model
                                                        .textSearchTextController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .textSearchTextController
                                                              ?.clear();
                                                          await _model
                                                              .search(context);
                                                          safeSetState(() {});
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textSearchTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.showDeviceSelect) {
                                      _model.showDeviceSelect = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.showDeviceSelect = true;
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MouseRegion(
                                        opaque: false,
                                        cursor: MouseCursor.defer ??
                                            MouseCursor.defer,
                                        child: Container(
                                          height: 28.81,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Total Choose: ${_model.deviceSelete.length.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .blue,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              if (_model.mouseRegionHovered ??
                                                  true)
                                                SizedBox(
                                                  width: 98.0,
                                                  child: Divider(
                                                    height: 1.0,
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .blue,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        onEnter: ((event) async {
                                          safeSetState(() =>
                                              _model.mouseRegionHovered = true);
                                        }),
                                        onExit: ((event) async {
                                          safeSetState(() => _model
                                              .mouseRegionHovered = false);
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (functions
                                                        .checkSelectAllDevice(
                                                            _model.deviceSelete
                                                                .toList(),
                                                            _model.devicemodels
                                                                .toList())) {
                                                      return FlutterFlowIconButton(
                                                        borderRadius: 100.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.check_box,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.deviceSelete = functions
                                                              .selectDevices(
                                                                  _model
                                                                      .devicemodels
                                                                      .toList(),
                                                                  _model
                                                                      .deviceSelete
                                                                      .toList(),
                                                                  SelectDeviceOption
                                                                      .removeAll)
                                                              .toList()
                                                              .cast<
                                                                  DeviceModelStruct>();
                                                          safeSetState(() {});
                                                        },
                                                      );
                                                    } else {
                                                      return FlutterFlowIconButton(
                                                        borderRadius: 100.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.deviceSelete = functions
                                                              .selectDevices(
                                                                  _model
                                                                      .devicemodels
                                                                      .toList(),
                                                                  _model
                                                                      .deviceSelete
                                                                      .toList(),
                                                                  SelectDeviceOption
                                                                      .selectAll)
                                                              .toList()
                                                              .cast<
                                                                  DeviceModelStruct>();
                                                          safeSetState(() {});
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Container(
                                                  width: 46.0,
                                                  height: 46.0,
                                                  decoration: BoxDecoration(),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 100.0,
                                                    buttonSize: 46.0,
                                                    fillColor:
                                                        Colors.transparent,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.slidersH,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                              Container(
                                                width: 50.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '834neh7o' /* No */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '20twao5o' /* Serial Number */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dgavhfhj' /* DeviceType */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5eovhw18' /* Model */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jik6z8l0' /* Manufacturer */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'uvb549a3' /* Status */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'sgeg4ni9' /* Link Status */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final devicemodel = _model
                                                  .devicemodels
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.serialNumber,
                                                      desc: false)
                                                  .toList();
                                              if (devicemodel.isEmpty) {
                                                return NoDataFoundedWidget();
                                              }

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: devicemodel.length,
                                                itemBuilder: (context,
                                                    devicemodelIndex) {
                                                  final devicemodelItem =
                                                      devicemodel[
                                                          devicemodelIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (devicemodelItem.id ==
                                                          _model.deviceSelete
                                                              .where((e) =>
                                                                  e.id ==
                                                                  devicemodelItem
                                                                      .id)
                                                              .toList()
                                                              .firstOrNull
                                                              ?.id) {
                                                        _model
                                                            .removeFromDeviceSelete(
                                                                devicemodelItem);
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.addToDeviceSelete(
                                                            devicemodelItem);
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    child:
                                                        SingleChildScrollView(
                                                      primary: false,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: functions
                                                                      .isOdd(
                                                                          devicemodelIndex)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (devicemodelItem.id ==
                                                                            _model.deviceSelete.where((e) => e.id == devicemodelItem.id).toList().firstOrNull?.id) {
                                                                          return FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                100.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.check_box,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              _model.removeFromDeviceSelete(devicemodelItem);
                                                                              safeSetState(() {});
                                                                            },
                                                                          );
                                                                        } else {
                                                                          return FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                100.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.check_box_outline_blank,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              _model.addToDeviceSelete(devicemodelItem);
                                                                              safeSetState(() {});
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      children: [
                                                                        Builder(
                                                                          builder: (context) =>
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                100.0,
                                                                            buttonSize:
                                                                                46.0,
                                                                            hoverColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            hoverIconColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              await showAlignedDialog(
                                                                                barrierColor: Colors.transparent,
                                                                                context: context,
                                                                                isGlobal: false,
                                                                                avoidOverflow: true,
                                                                                targetAnchor: AlignmentDirectional(1.0, 1.0).resolve(Directionality.of(context)),
                                                                                followerAnchor: AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                                                                                builder: (dialogContext) {
                                                                                  return Material(
                                                                                    color: Colors.transparent,
                                                                                    child: CActionV1Widget(
                                                                                      actionDelete: () async {
                                                                                        Navigator.pop(context);

                                                                                        context.pushNamed(
                                                                                          PDeviceDetailsWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'type': serializeParam(
                                                                                              Flag.Delete,
                                                                                              ParamType.Enum,
                                                                                            ),
                                                                                            'deviceId': serializeParam(
                                                                                              devicemodelItem.id,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 0),
                                                                                            ),
                                                                                          },
                                                                                        );

                                                                                        FFAppState().isclicktab = false;
                                                                                        FFAppState().switch1 = true;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      actionEdit: () async {
                                                                                        Navigator.pop(context);

                                                                                        context.pushNamed(
                                                                                          PDeviceDetailsWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'type': serializeParam(
                                                                                              Flag.Update,
                                                                                              ParamType.Enum,
                                                                                            ),
                                                                                            'deviceId': serializeParam(
                                                                                              devicemodelItem.id,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 0),
                                                                                            ),
                                                                                          },
                                                                                        );

                                                                                        FFAppState().isclicktab = false;
                                                                                        FFAppState().switch1 = true;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      actionView: () async {
                                                                                        Navigator.pop(context);

                                                                                        context.pushNamed(
                                                                                          PDeviceDetailsWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'type': serializeParam(
                                                                                              Flag.View,
                                                                                              ParamType.Enum,
                                                                                            ),
                                                                                            'deviceId': serializeParam(
                                                                                              devicemodelItem.id,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.fade,
                                                                                              duration: Duration(milliseconds: 0),
                                                                                            ),
                                                                                          },
                                                                                        );

                                                                                        FFAppState().isclicktab = false;
                                                                                        FFAppState().switch1 = true;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        if (FFAppState().storeSerialNum ==
                                                                            devicemodelItem.serialNumber)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-0.91, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 12.0,
                                                                              height: 12.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF50EAA2),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  Container(
                                                                    width: 50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      (_model.offset +
                                                                              devicemodelIndex +
                                                                              1)
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                13,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      devicemodelItem
                                                                          .serialNumber,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (devicemodelItem.deviceType ==
                                                                            'IoT')
                                                                          Container(
                                                                            width:
                                                                                28.0,
                                                                            height:
                                                                                28.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: Image.asset(
                                                                                  Theme.of(context).brightness == Brightness.dark ? 'assets/images/device_(1).png' : 'assets/images/device.png',
                                                                                  width: 25.0,
                                                                                  height: 25.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (devicemodelItem.deviceType ==
                                                                            'Smart Meter')
                                                                          Container(
                                                                            width:
                                                                                28.0,
                                                                            height:
                                                                                28.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: Image.asset(
                                                                                  Theme.of(context).brightness == Brightness.dark ? 'assets/images/meter_(1).png' : 'assets/images/meter.png',
                                                                                  width: 25.0,
                                                                                  height: 25.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      devicemodelItem
                                                                          .model,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      devicemodelItem
                                                                          .manufacturer,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              25.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                () {
                                                                              if (devicemodelItem.status == StatusDevice.None.name) {
                                                                                return FlutterFlowTheme.of(context).alternate;
                                                                              } else if (devicemodelItem.status == StatusDevice.Commissioned.name) {
                                                                                return Color(0xFFD7EBD8);
                                                                              } else {
                                                                                return Color(0xFFFADDD4);
                                                                              }
                                                                            }(),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  devicemodelItem.status,
                                                                                  '-',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: () {
                                                                                        if (devicemodelItem.status == StatusDevice.None.name) {
                                                                                          return FlutterFlowTheme.of(context).primaryText;
                                                                                        } else if (devicemodelItem.status == StatusDevice.Commissioned.name) {
                                                                                          return Color(0xFF60B863);
                                                                                        } else {
                                                                                          return Color(0xFFFF6E40);
                                                                                        }
                                                                                      }(),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              25.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: devicemodelItem.linkStatus == StatusDevice.None.name
                                                                                ? FlutterFlowTheme.of(context).alternate
                                                                                : Color(0xFFD7EBD8),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  devicemodelItem.linkStatus,
                                                                                  '-',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: devicemodelItem.linkStatus == StatusDevice.None.name ? FlutterFlowTheme.of(context).primaryText : Color(0xFF60B863),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (_model.showDeviceSelect)
                                  Container(
                                    width: 300.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Container(
                                                  width: 46.0,
                                                  height: 46.0,
                                                  decoration: BoxDecoration(),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 100.0,
                                                    buttonSize: 46.0,
                                                    fillColor:
                                                        Colors.transparent,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.slidersH,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'sxtuddl1' /* Serial Number */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final model = _model.deviceSelete
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.serialNumber,
                                                      desc: false)
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: model.length,
                                                itemBuilder:
                                                    (context, modelIndex) {
                                                  final modelItem =
                                                      model[modelIndex];
                                                  return SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      1.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: functions
                                                                      .isOdd(
                                                                          modelIndex)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      modelItem
                                                                          .serialNumber,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.removeFromDeviceSelete(
                                                                          modelItem);
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete_forever,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 3.0, 16.0, 3.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'lqvj6x89' /* Rows per page */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    FlutterFlowDropDown<int>(
                                      controller:
                                          _model.limitValueController ??=
                                              FormFieldController<int>(
                                        _model.limitValue ??= 25,
                                      ),
                                      options: List<int>.from([25, 50, 100]),
                                      optionLabels: [
                                        FFLocalizations.of(context).getText(
                                          'jbn5f7w7' /* 25 */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '2534qjps' /* 50 */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'vui6w67z' /* 100 */,
                                        )
                                      ],
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.limitValue = val);
                                        _model.currentPage = 1;
                                        safeSetState(() {});
                                        safeSetState(() {
                                          _model.currentPageTextController
                                                  ?.text =
                                              _model.currentPage.toString();
                                        });
                                        await _model.calculateOffset(context);
                                        await _model.search(context);
                                        safeSetState(() {});
                                      },
                                      width: 90.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'mous6rba' /* 25 */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 36.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: (_model.currentPage == 1)
                                          ? null
                                          : () async {
                                              _model.currentPage =
                                                  _model.currentPage + -1;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.currentPageTextController
                                                        ?.text =
                                                    _model.currentPage
                                                        .toString();
                                              });
                                              await _model
                                                  .calculateOffset(context);
                                              await _model.search(context);
                                              safeSetState(() {});
                                            },
                                    ),
                                    Container(
                                      width: 50.0,
                                      child: TextFormField(
                                        controller:
                                            _model.currentPageTextController,
                                        focusNode: _model.currentPageFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.currentPageTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            safeSetState(() {
                                              _model.currentPageTextController?.text =
                                                  functions
                                                      .validatePageNumber(
                                                          _model
                                                              .currentPageTextController
                                                              .text,
                                                          _model.totalPage)
                                                      .toString();
                                            });
                                            _model.currentPage = int.parse(
                                                _model.currentPageTextController
                                                    .text);
                                            safeSetState(() {});
                                            await _model
                                                .calculateOffset(context);
                                            await _model.search(context);
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '49on34he' /* 1 */,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        textAlign: TextAlign.center,
                                        minLines: 1,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .currentPageTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '3px2fgmo' /* of */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      _model.totalPage.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 36.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      disabledIconColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: (_model.currentPage ==
                                              _model.totalPage)
                                          ? null
                                          : () async {
                                              _model.currentPage =
                                                  _model.currentPage + 1;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.currentPageTextController
                                                        ?.text =
                                                    _model.currentPage
                                                        .toString();
                                              });
                                              await _model
                                                  .calculateOffset(context);
                                              await _model.search(context);
                                              safeSetState(() {});
                                            },
                                    ),
                                  ].divide(SizedBox(width: 7.0)),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wrapWithModel(
                    model: _model.secoundaryButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SecoundaryButtonWidget(
                      btName: 'Cancel',
                      btAction: () async {
                        context.safePop();
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.primaryButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: PrimaryButtonWidget(
                      tbName: 'OK',
                      font: FlutterFlowTheme.of(context).primaryBackground,
                      fillcolor: FlutterFlowTheme.of(context).primary,
                      btAction: () async {
                        await widget.onConfirm?.call(
                          _model.deviceSelete,
                        );
                      },
                      exception: () async {},
                    ),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
