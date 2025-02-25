import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_dialogs_model.dart';
export 'custom_dialogs_model.dart';

class CustomDialogsWidget extends StatefulWidget {
  const CustomDialogsWidget({
    super.key,
    double? width,
    this.fillColor,
    double? borderRadius,
    this.onChanged,
    bool? isConfirmDialog,
    this.iconProperties,
    this.headerColor,
    double? headerHeight,
    this.title,
    double? titleSize,
    this.titleColor,
    double? titleAlign,
    String? message,
    double? messageSize,
    this.messageColor,
    double? messageAlign,
    String? close,
    double? closeSize,
    this.closeColor,
    String? no,
    double? noSize,
    this.noColor,
    String? yes,
    double? yesSize,
    this.yesColor,
  })  : this.width = width ?? 350.0,
        this.borderRadius = borderRadius ?? 12.0,
        this.isConfirmDialog = isConfirmDialog ?? false,
        this.headerHeight = headerHeight ?? 12.0,
        this.titleSize = titleSize ?? 16.0,
        this.titleAlign = titleAlign ?? 0.0,
        this.message = message ?? 'Are you sure you want to proceed? ',
        this.messageSize = messageSize ?? 14.0,
        this.messageAlign = messageAlign ?? 0.0,
        this.close = close ?? 'Close',
        this.closeSize = closeSize ?? 14.0,
        this.no = no ?? 'No',
        this.noSize = noSize ?? 14.0,
        this.yes = yes ?? 'Yes',
        this.yesSize = yesSize ?? 14.0;

  final double width;
  final Color? fillColor;
  final double borderRadius;
  final Future Function()? onChanged;
  final bool isConfirmDialog;
  final Widget? iconProperties;
  final Color? headerColor;
  final double headerHeight;
  final String? title;
  final double titleSize;
  final Color? titleColor;
  final double titleAlign;
  final String message;
  final double messageSize;
  final Color? messageColor;
  final double messageAlign;
  final String close;
  final double closeSize;
  final Color? closeColor;
  final String no;
  final double noSize;
  final Color? noColor;
  final String yes;
  final double yesSize;
  final Color? yesColor;

  @override
  State<CustomDialogsWidget> createState() => _CustomDialogsWidgetState();
}

class _CustomDialogsWidgetState extends State<CustomDialogsWidget> {
  late CustomDialogsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomDialogsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: valueOrDefault<double>(
          widget!.width,
          350.0,
        ),
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget!.fillColor,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget!.borderRadius,
            12.0,
          )),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget!.headerColor,
                  FlutterFlowTheme.of(context).secondary,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(valueOrDefault<double>(
                    widget!.borderRadius,
                    12.0,
                  )),
                  topRight: Radius.circular(valueOrDefault<double>(
                    widget!.borderRadius,
                    12.0,
                  )),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(valueOrDefault<double>(
                  widget!.headerHeight,
                  12.0,
                )),
                child: widget!.iconProperties!,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(
                        valueOrDefault<double>(
                          widget!.titleAlign,
                          0.0,
                        ),
                        valueOrDefault<double>(
                          widget!.titleAlign,
                          0.0,
                        )),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.title,
                        'Confirm Action',
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Inter',
                            color: valueOrDefault<Color>(
                              widget!.titleColor,
                              FlutterFlowTheme.of(context).secondaryText,
                            ),
                            fontSize: valueOrDefault<double>(
                              widget!.titleSize,
                              16.0,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(
                        valueOrDefault<double>(
                          widget!.messageAlign,
                          0.0,
                        ),
                        valueOrDefault<double>(
                          widget!.messageAlign,
                          0.0,
                        )),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.message,
                        'Are you sure you want to proceed?',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: valueOrDefault<Color>(
                              widget!.messageColor,
                              FlutterFlowTheme.of(context).secondaryText,
                            ),
                            fontSize: valueOrDefault<double>(
                              widget!.messageSize,
                              14.0,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (widget!.isConfirmDialog == true)
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget!.no,
                                    'No',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: valueOrDefault<Color>(
                                          widget!.noColor,
                                          FlutterFlowTheme.of(context).error,
                                        ),
                                        fontSize: valueOrDefault<double>(
                                          widget!.noSize,
                                          14.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Navigator.pop(context);
                                    },
                                ),
                                TextSpan(
                                  text: '  /  ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget!.yes,
                                    'Yes',
                                  ),
                                  style: TextStyle(
                                    color: valueOrDefault<Color>(
                                      widget!.yesColor,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontWeight: FontWeight.w500,
                                    fontSize: valueOrDefault<double>(
                                      widget!.yesSize,
                                      14.0,
                                    ),
                                  ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await widget.onChanged?.call();
                                    },
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        if (widget!.isConfirmDialog == false)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Text(
                              valueOrDefault<String>(
                                widget!.close,
                                'Close',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: valueOrDefault<Color>(
                                      widget!.closeColor,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontSize: valueOrDefault<double>(
                                      widget!.closeSize,
                                      14.0,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
