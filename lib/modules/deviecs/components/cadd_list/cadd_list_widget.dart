import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'cadd_list_model.dart';
export 'cadd_list_model.dart';

class CaddListWidget extends StatefulWidget {
  const CaddListWidget({
    super.key,
    required this.itemIndex,
    this.actionSave,
    this.adddate,
    this.ur,
  });

  final int? itemIndex;
  final Future Function()? actionSave;
  final AddToListStruct? adddate;
  final String? ur;

  @override
  State<CaddListWidget> createState() => _CaddListWidgetState();
}

class _CaddListWidgetState extends State<CaddListWidget> {
  late CaddListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaddListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.nameTextController?.text = widget.adddate!.url;
      });
    });

    _model.nameTextController ??=
        TextEditingController(text: widget.adddate?.url);
    _model.nameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: TextFormField(
              controller: _model.nameTextController,
              focusNode: _model.nameFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.nameTextController',
                Duration(milliseconds: 2000),
                () async {
                  FFAppState().updateItemAddToListAtIndex(
                    widget.itemIndex!,
                    (e) => e..url = _model.nameTextController.text,
                  );
                  safeSetState(() {});
                },
              ),
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'n5n1gepc' /* Name */,
                ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
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
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              maxLines: null,
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator:
                  _model.nameTextControllerValidator.asValidator(context),
            ),
          ),
        ),
      ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
    );
  }
}
