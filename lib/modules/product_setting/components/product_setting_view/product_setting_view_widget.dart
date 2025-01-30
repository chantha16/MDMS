import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'product_setting_view_model.dart';
export 'product_setting_view_model.dart';

class ProductSettingViewWidget extends StatefulWidget {
  const ProductSettingViewWidget({super.key});

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
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).cerise,
          ),
        );
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 300),
                        () async {
                          await Future.delayed(
                              const Duration(milliseconds: 400));
                          _model.apiResult3b4 =
                              await SpecialDayGroup.readAllSpecialDaysCall.call(
                            search: _model.textController.text,
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
                                  (_model.apiResult3b4?.exceptionMessage ?? ''),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
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
                          borderSide: const BorderSide(
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
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  await Future.delayed(
                                      const Duration(milliseconds: 400));
                                  _model.apiResult3b4 = await SpecialDayGroup
                                      .readAllSpecialDaysCall
                                      .call(
                                    search: _model.textController.text,
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
                                            as Iterable<SpecialDayModelStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<SpecialDayModelStruct>();
                                    safeSetState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          (_model.apiResult3b4
                                                  ?.exceptionMessage ??
                                              ''),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).cerise,
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
                      validator:
                          _model.textControllerValidator.asValidator(context),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ].divide(const SizedBox(width: 12.0)),
              ),
            ),
          ].divide(const SizedBox(width: 12.0)),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
            ].divide(const SizedBox(width: 12.0)),
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
                padding: const EdgeInsets.fromLTRB(
                  0,
                  12.0,
                  0,
                  0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: specialDays.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                itemBuilder: (context, specialDaysIndex) {
                  final specialDaysItem = specialDays[specialDaysIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
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
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ].divide(const SizedBox(height: 12.0)),
    );
  }
}
