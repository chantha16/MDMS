import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/system_logic/no_data_founded/no_data_founded_widget.dart';
import '/components/system_logic/primary_button_with_icon/primary_button_with_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/special_day_action/special_day_action_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
import 'special_day_side_bar_model.dart';
export 'special_day_side_bar_model.dart';

class SpecialDaySideBarWidget extends StatefulWidget {
  const SpecialDaySideBarWidget({
    super.key,
    this.type,
    this.types,
    this.details,
    this.specialDayId,
    this.detailsSpecial,
  });

  final Flag? type;
  final FlagStruct? types;
  final SpecialDayDetailsModelStruct? details;
  final int? specialDayId;
  final SpecialDayModelStruct? detailsSpecial;

  @override
  State<SpecialDaySideBarWidget> createState() =>
      _SpecialDaySideBarWidgetState();
}

class _SpecialDaySideBarWidgetState extends State<SpecialDaySideBarWidget> {
  late SpecialDaySideBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialDaySideBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = false;
      safeSetState(() {});
      _model.apiResultSpecialDaySideBarView =
          await SpecialDayGroup.sepcialDayIdCall.call(
        id: widget.specialDayId,
        includeSpecialDayDetail: true,
      );

      if ((_model.apiResultSpecialDaySideBarView?.succeeded ?? true)) {
        _model.specialDayDetail = (getJsonField(
          (_model.apiResultSpecialDaySideBarView?.jsonBody ?? ''),
          r'''$.SpecialDay[:].SpecialDayDetails''',
          true,
        )!
                .toList()
                .map<SpecialDayDetailsModelStruct?>(
                    SpecialDayDetailsModelStruct.maybeFromMap)
                .toList() as Iterable<SpecialDayDetailsModelStruct?>)
            .withoutNulls
            .toList()
            .cast<SpecialDayDetailsModelStruct>();
        _model.specailDay = SpecialDayModelStruct.maybeFromMap(getJsonField(
          (_model.apiResultSpecialDaySideBarView?.jsonBody ?? ''),
          r'''$.SpecailDay''',
        ));
        safeSetState(() {});
        _model.isLoading = true;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 82.0, 0.0, 0.0),
        child: Container(
          width: 550.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '7ik0x8cn' /* Calendars */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200.0,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  width: 300.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController',
                                                      Duration(
                                                          milliseconds: 300),
                                                      () async {
                                                        FFAppState().loading =
                                                            false;
                                                        safeSetState(() {});
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    600));
                                                        _model.searchTabar =
                                                            await SpecialDayGroup
                                                                .sepcialDayIdCall
                                                                .call(
                                                          id: widget
                                                              .specialDayId,
                                                          includeSpecialDayDetail:
                                                              true,
                                                          search:
                                                              '%${_model.textController.text}%',
                                                        );

                                                        if ((_model.searchTabar
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.specialDayDetail =
                                                              (getJsonField(
                                                            (_model.searchTabar
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.SpecialDay[:].SpecialDayDetails''',
                                                            true,
                                                          )!
                                                                          .toList()
                                                                          .map<SpecialDayDetailsModelStruct?>(SpecialDayDetailsModelStruct
                                                                              .maybeFromMap)
                                                                          .toList()
                                                                      as Iterable<
                                                                          SpecialDayDetailsModelStruct?>)
                                                                  .withoutNulls
                                                                  .toList()
                                                                  .cast<
                                                                      SpecialDayDetailsModelStruct>();
                                                          _model.updatePage(
                                                              () {});
                                                          FFAppState().loading =
                                                              true;
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '9gyi0lym' /* Search */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      prefixIcon: Icon(
                                                        Icons.search_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      suffixIcon: _model
                                                              .textController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                                FFAppState()
                                                                        .loading =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            600));
                                                                _model.searchTabar =
                                                                    await SpecialDayGroup
                                                                        .sepcialDayIdCall
                                                                        .call(
                                                                  id: widget
                                                                      .specialDayId,
                                                                  includeSpecialDayDetail:
                                                                      true,
                                                                  search:
                                                                      '%${_model.textController.text}%',
                                                                );

                                                                if ((_model
                                                                        .searchTabar
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  _model
                                                                      .specialDayDetail = (getJsonField(
                                                                    (_model.searchTabar
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.SpecialDay[:].SpecialDayDetails''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .map<SpecialDayDetailsModelStruct?>(SpecialDayDetailsModelStruct.maybeFromMap)
                                                                          .toList() as Iterable<SpecialDayDetailsModelStruct?>)
                                                                      .withoutNulls
                                                                      .toList()
                                                                      .cast<SpecialDayDetailsModelStruct>();
                                                                  _model
                                                                      .updatePage(
                                                                          () {});
                                                                  FFAppState()
                                                                          .loading =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .primaryButtonWithIconModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  PrimaryButtonWithIconWidget(
                                                tbName: 'Add',
                                                btIcon: Icon(
                                                  Icons.add_box,
                                                ),
                                                btAction: () async {
                                                  Navigator.pop(context);

                                                  context.pushNamed(
                                                    SpecialDayDetailPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'types': serializeParam(
                                                        Flag.Add,
                                                        ParamType.Enum,
                                                      ),
                                                      'id': serializeParam(
                                                        widget.specialDayId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.slidersH,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .dataSpecailDay
                                                          .elementAtOrNull(0),
                                                      'No.',
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
                                                  flex: 2,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '9hi900q8' /* Name */,
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
                                                  flex: 2,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '80r0uu60' /* Start Date */,
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
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '2jpx8y77' /* End Date */,
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
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (FFAppState()
                                                          .loading) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final specialDayDetials =
                                                                _model
                                                                    .specialDayDetail
                                                                    .toList();
                                                            if (specialDayDetials
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    NoDataFoundedWidget(),
                                                              );
                                                            }

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  specialDayDetials
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  specialDayDetialsIndex) {
                                                                final specialDayDetialsItem =
                                                                    specialDayDetials[
                                                                        specialDayDetialsIndex];
                                                                return Container(
                                                                  height: 45.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: functions.isOdd(
                                                                            specialDayDetialsIndex)
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryBackground
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              100.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          hoverColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.more_vert,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await showAlignedDialog(
                                                                              barrierColor: Colors.transparent,
                                                                              context: context,
                                                                              isGlobal: false,
                                                                              avoidOverflow: true,
                                                                              targetAnchor: AlignmentDirectional(1.0, 1.0).resolve(Directionality.of(context)),
                                                                              followerAnchor: AlignmentDirectional(-1.0, -1.0).resolve(Directionality.of(context)),
                                                                              builder: (dialogContext) {
                                                                                return Material(
                                                                                  color: Colors.transparent,
                                                                                  child: SpecialDayActionWidget(
                                                                                    actionEdit: () async {
                                                                                      Navigator.pop(context);

                                                                                      context.pushNamed(
                                                                                        SpecialDayDetailPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'types': serializeParam(
                                                                                            Flag.Update,
                                                                                            ParamType.Enum,
                                                                                          ),
                                                                                          'detailsSpecial': serializeParam(
                                                                                            specialDayDetialsItem,
                                                                                            ParamType.DataStruct,
                                                                                          ),
                                                                                          'id': serializeParam(
                                                                                            specialDayDetialsItem.id,
                                                                                            ParamType.int,
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
                                                                                    },
                                                                                    actionDelete: () async {
                                                                                      Navigator.pop(context);

                                                                                      context.pushNamed(
                                                                                        SpecialDayDetailPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'types': serializeParam(
                                                                                            Flag.Delete,
                                                                                            ParamType.Enum,
                                                                                          ),
                                                                                          'id': serializeParam(
                                                                                            specialDayDetialsItem.id,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'detailsSpecial': serializeParam(
                                                                                            specialDayDetialsItem,
                                                                                            ParamType.DataStruct,
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
                                                                                    },
                                                                                    actionView: () async {
                                                                                      context.pushNamed(
                                                                                        SpecialDayDetailPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'types': serializeParam(
                                                                                            Flag.View,
                                                                                            ParamType.Enum,
                                                                                          ),
                                                                                          'id': serializeParam(
                                                                                            specialDayDetialsItem.id,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'detailsSpecial': serializeParam(
                                                                                            specialDayDetialsItem,
                                                                                            ParamType.DataStruct,
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
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          (specialDayDetialsIndex + 1)
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            specialDayDetialsItem.specialDayId,
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            specialDayDetialsItem.startDate,
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            specialDayDetialsItem.endDate,
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            child: custom_widgets
                                                                .LoadingIndicatorWidget(
                                                              width: 30.0,
                                                              height: 30.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
