import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'export_options_model.dart';
export 'export_options_model.dart';

class ExportOptionsWidget extends StatefulWidget {
  const ExportOptionsWidget({
    super.key,
    required this.action,
  });

  final Future Function(String? fileType)? action;

  @override
  State<ExportOptionsWidget> createState() => _ExportOptionsWidgetState();
}

class _ExportOptionsWidgetState extends State<ExportOptionsWidget> {
  late ExportOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExportOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'uqqzzq6p' /* Export Options */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Inter Tight',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: FlutterFlowRadioButton(
                options: [
                  FFLocalizations.of(context).getText(
                    'ft8xj8dl' /* 📄 CSV */,
                  ),
                  FFLocalizations.of(context).getText(
                    'mbai51nz' /* 📊 Excel */,
                  ),
                  FFLocalizations.of(context).getText(
                    '4marcwvx' /* { }  JSON */,
                  )
                ].toList(),
                onChanged: (val) => safeSetState(() {}),
                controller: _model.radioButtonValueController ??=
                    FormFieldController<String>(null),
                optionHeight: 32.0,
                textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                selectedTextStyle:
                    FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                buttonPosition: RadioButtonPosition.left,
                direction: Axis.vertical,
                radioButtonColor: FlutterFlowTheme.of(context).primary,
                inactiveRadioButtonColor:
                    FlutterFlowTheme.of(context).secondaryText,
                toggleable: false,
                horizontalAlignment: WrapAlignment.start,
                verticalAlignment: WrapCrossAlignment.start,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.action?.call(
                    valueOrDefault<String>(
                      () {
                        if (_model.radioButtonValue == '📄 CSV') {
                          return 'CSV';
                        } else if (_model.radioButtonValue == '📊 Excel') {
                          return 'EXCEL';
                        } else {
                          return 'JSON';
                        }
                      }(),
                      'EXCEL',
                    ),
                  );
                },
                text: FFLocalizations.of(context).getText(
                  'm3r8xum7' /* Confirm */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ].divide(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
