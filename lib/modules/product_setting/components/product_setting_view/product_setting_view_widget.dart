import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/animation_item/animation_item_widget.dart';
import '/components/row_header/row_header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modules/product_setting/components/row_header_widget/row_header_widget_widget.dart';
import '/modules/product_setting/components/row_item_widget/row_item_widget_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'product_setting_view_model.dart';
export 'product_setting_view_model.dart';

class ProductSettingViewWidget extends StatefulWidget {
  const ProductSettingViewWidget({
    super.key,
    this.onSearchChangedQuery,
  });

  final Future Function(List<dynamic> response)? onSearchChangedQuery;

  @override
  State<ProductSettingViewWidget> createState() =>
      _ProductSettingViewWidgetState();
}

class _ProductSettingViewWidgetState extends State<ProductSettingViewWidget> {
  late ProductSettingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductSettingViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultv1n = await SpecialDayGroup.readAllSpecialDaysCall.call(
        includeSpecialDayDetail: false,
      );

      if ((_model.apiResultv1n?.succeeded ?? true)) {
        _model.specialDayState = (getJsonField(
          (_model.apiResultv1n?.jsonBody ?? ''),
          r'''$.SpecialDay''',
          true,
        )!
                .toList()
                .map<SpecialDayModelStruct?>(SpecialDayModelStruct.maybeFromMap)
                .toList() as Iterable<SpecialDayModelStruct?>)
            .withoutNulls
            .toList()
            .cast<SpecialDayModelStruct>();
        _model.totalPage = getJsonField(
          (_model.apiResultv1n?.jsonBody ?? ''),
          r'''$.Paging.Item.Total''',
        );
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (_model.apiResultv1n?.exceptionMessage ?? ''),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).cerise,
          ),
        );
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.pageNumTFTextController ??= TextEditingController();
    _model.pageNumTFFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.pageNumTFTextController?.text =
              FFLocalizations.of(context).getText(
            '4ir9c54y' /* 1 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '5ubf06ta' /* Sample API Call */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController1',
                          Duration(milliseconds: 300),
                          () async {
                            await Future.delayed(
                                const Duration(milliseconds: 600));
                            _model.apiResult3b4 = await SpecialDayGroup
                                .readAllSpecialDaysCall
                                .call(
                              search: '%${_model.textController1.text}%',
                              includeSpecialDayDetail: false,
                            );

                            if ((_model.apiResult3b4?.succeeded ?? true)) {
                              _model.specialDayState = (getJsonField(
                                (_model.apiResult3b4?.jsonBody ?? ''),
                                r'''$.SpecialDay''',
                                true,
                              )!
                                          .toList()
                                          .map<SpecialDayModelStruct?>(
                                              SpecialDayModelStruct.maybeFromMap)
                                          .toList()
                                      as Iterable<SpecialDayModelStruct?>)
                                  .withoutNulls
                                  .toList()
                                  .cast<SpecialDayModelStruct>();
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    (_model.apiResult3b4?.exceptionMessage ??
                                        ''),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).cerise,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: FFLocalizations.of(context).getText(
                            'lfxqeq6h' /* Search .... */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          suffixIcon: _model.textController1!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController1?.clear();
                                    await Future.delayed(
                                        const Duration(milliseconds: 600));
                                    _model.apiResult3b4 = await SpecialDayGroup
                                        .readAllSpecialDaysCall
                                        .call(
                                      search:
                                          '%${_model.textController1.text}%',
                                      includeSpecialDayDetail: false,
                                    );

                                    if ((_model.apiResult3b4?.succeeded ??
                                        true)) {
                                      _model.specialDayState = (getJsonField(
                                        (_model.apiResult3b4?.jsonBody ?? ''),
                                        r'''$.SpecialDay''',
                                        true,
                                      )!
                                                  .toList()
                                                  .map<SpecialDayModelStruct?>(
                                                      SpecialDayModelStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  SpecialDayModelStruct?>)
                                          .withoutNulls
                                          .toList()
                                          .cast<SpecialDayModelStruct>();
                                      safeSetState(() {});
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            (_model.apiResult3b4
                                                    ?.exceptionMessage ??
                                                ''),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .cerise,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        'uuqwfarv' /* Options */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        '48cu76nm' /* Add */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.tune,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'd6ejze12' /* No */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'detvzfph' /* Name */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'nu6y838r' /* Descriptions */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'thjk8lwh' /* Start Date */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'l5do3v85' /* End Date */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                final specialDays = _model.specialDayState.toList();
                if (specialDays.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/no-data_(1).gif',
                      fit: BoxFit.contain,
                    ),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    12.0,
                    0,
                    0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: specialDays.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.0),
                  itemBuilder: (context, specialDaysIndex) {
                    final specialDaysItem = specialDays[specialDaysIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.keyboard_control_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  specialDaysIndex.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  valueOrDefault<String>(
                                    specialDaysItem.name,
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
                                flex: 3,
                                child: Text(
                                  valueOrDefault<String>(
                                    specialDaysItem.description,
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
                                flex: 3,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'hi8kayjq' /* Start Date */,
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
                                flex: 3,
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zr1fam28' /* End Date */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '4fhwcvbv' /* Sample API Call V2 */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController2',
                              Duration(milliseconds: 300),
                              () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 600));
                                _model.specialDayRes = await SpecialDayGroup
                                    .readAllSpecialDaysCall
                                    .call(
                                  search: '%${_model.textController2.text}%',
                                  includeSpecialDayDetail: false,
                                  limit: _model.dropDownValue,
                                );

                                if ((_model.specialDayRes?.succeeded ?? true)) {
                                  _model.specialDayState = (getJsonField(
                                    (_model.specialDayRes?.jsonBody ?? ''),
                                    r'''$.SpecialDay''',
                                    true,
                                  )!
                                              .toList()
                                              .map<SpecialDayModelStruct?>(
                                                  SpecialDayModelStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<SpecialDayModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<SpecialDayModelStruct>();
                                  safeSetState(() {});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        (_model.specialDayRes
                                                ?.exceptionMessage ??
                                            ''),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).cerise,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'wy97rnok' /* Search .... */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              suffixIcon: _model
                                      .textController2!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textController2?.clear();
                                        await Future.delayed(
                                            const Duration(milliseconds: 600));
                                        _model.specialDayRes =
                                            await SpecialDayGroup
                                                .readAllSpecialDaysCall
                                                .call(
                                          search:
                                              '%${_model.textController2.text}%',
                                          includeSpecialDayDetail: false,
                                          limit: _model.dropDownValue,
                                        );

                                        if ((_model.specialDayRes?.succeeded ??
                                            true)) {
                                          _model
                                              .specialDayState = (getJsonField(
                                            (_model.specialDayRes?.jsonBody ??
                                                ''),
                                            r'''$.SpecialDay''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<SpecialDayModelStruct?>(
                                                          SpecialDayModelStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      SpecialDayModelStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<SpecialDayModelStruct>();
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                (_model.specialDayRes
                                                        ?.exceptionMessage ??
                                                    ''),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .cerise,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.rowHeaderModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: RowHeaderWidget(
                      rowHeader: () => RowHeaderWidgetWidget(),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final specialDay = _model.specialDayState.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: specialDay.length,
                          itemBuilder: (context, specialDayIndex) {
                            final specialDayItem = specialDay[specialDayIndex];
                            return AnimationItemWidget(
                              key: Key(
                                  'Keyi6o_${specialDayIndex}_of_${specialDay.length}'),
                              rowNumber: specialDayIndex,
                              rowData: specialDayItem.toMap(),
                              rowItems: () => RowItemWidgetWidget(
                                items: specialDayItem,
                              ),
                            );
                          },
                        );
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'xvuca1i0' /* Row per page */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          FlutterFlowDropDown<int>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<int>(
                              _model.dropDownValue ??= 5,
                            ),
                            options: List<int>.from([5, 10, 25, 50, 100]),
                            optionLabels: [
                              FFLocalizations.of(context).getText(
                                'vggvvr4j' /* 5 */,
                              ),
                              FFLocalizations.of(context).getText(
                                '7nfkm578' /* 10 */,
                              ),
                              FFLocalizations.of(context).getText(
                                'orufeewg' /* 25 */,
                              ),
                              FFLocalizations.of(context).getText(
                                '4ng7b629' /* 50 */,
                              ),
                              FFLocalizations.of(context).getText(
                                'qxxmhkq0' /* 100 */,
                              )
                            ],
                            onChanged: (val) async {
                              safeSetState(() => _model.dropDownValue = val);
                              await Future.delayed(
                                  const Duration(milliseconds: 400));
                              _model.specialDayResPageSize =
                                  await SpecialDayGroup.readAllSpecialDaysCall
                                      .call(
                                search: '%${_model.textController2.text}%',
                                includeSpecialDayDetail: false,
                                limit: _model.dropDownValue,
                              );

                              if ((_model.specialDayResPageSize?.succeeded ??
                                  true)) {
                                _model.specialDayState = (getJsonField(
                                  (_model.specialDayResPageSize?.jsonBody ??
                                      ''),
                                  r'''$.SpecialDay''',
                                  true,
                                )!
                                            .toList()
                                            .map<SpecialDayModelStruct?>(
                                                SpecialDayModelStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<SpecialDayModelStruct?>)
                                    .withoutNulls
                                    .toList()
                                    .cast<SpecialDayModelStruct>();
                                _model.currentPage = 1;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.pageNumTFTextController?.text =
                                      _model.currentPage.toString();
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      (_model.specialDayRes?.exceptionMessage ??
                                          ''),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).cerise,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            width: 120.0,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 0.0,
                            borderRadius: 12.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              if ((_model.currentPage > 1) &&
                                  (_model.currentPage != 1)) {
                                _model.currentPage = _model.currentPage + -1;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.pageNumTFTextController?.text =
                                      _model.currentPage.toString();
                                });
                              } else {
                                return;
                              }
                            },
                          ),
                          Container(
                            width: 50.0,
                            child: TextFormField(
                              controller: _model.pageNumTFTextController,
                              focusNode: _model.pageNumTFFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.pageNumTFTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  _model.currentPage = int.parse(
                                      _model.pageNumTFTextController.text);
                                  safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.pageNumTFTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              'of  ${functions.calculateTotalPages(_model.totalPage, _model.dropDownValue!).toString()}',
                              '1',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.navigate_next,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: (_model.currentPage == _model.totalPage)
                                ? null
                                : () async {
                                    if (((_model.currentPage <=
                                                _model.totalPage) &&
                                            (_model.currentPage >= 1)) &&
                                        (_model.currentPage !=
                                            _model.totalPage)) {
                                      _model.currentPage =
                                          _model.currentPage + 1;
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.pageNumTFTextController?.text =
                                            _model.currentPage.toString();
                                      });
                                      return;
                                    } else {
                                      return;
                                    }
                                  },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
