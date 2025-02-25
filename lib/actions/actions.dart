import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:epower_library_llyhdh/dialogs/custom_dialogs/custom_dialogs_widget.dart'
    as epower_library_llyhdh;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

Future logoutBlock(BuildContext context) async {}

Future handleExceptions(
  BuildContext context, {
  String? message,
  String? title,
  bool? isConfirm,
}) async {
  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: epower_library_llyhdh.CustomDialogsWidget(
          message: message,
          title: valueOrDefault<String>(
            title,
            'Warning...!',
          ),
          width: 350.0,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: 12.0,
          isConfirmDialog: isConfirm,
          iconProperties: Icon(
            Icons.warning,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 32.0,
          ),
          headerColor: FlutterFlowTheme.of(context).primary,
          headerHeight: 12.0,
          titleSize: 16.0,
          titleColor: FlutterFlowTheme.of(context).secondaryText,
          titleAlign: 0.0,
          messageSize: 14.0,
          messageColor: FlutterFlowTheme.of(context).secondaryText,
          messageAlign: 0.0,
          close: 'Close',
          closeSize: 14.0,
          closeColor: FlutterFlowTheme.of(context).primary,
          no: 'No',
          noSize: 14.0,
          noColor: FlutterFlowTheme.of(context).error,
          yes: 'Yes',
          yesSize: 14.0,
          yesColor: FlutterFlowTheme.of(context).primary,
          onChanged: () async {},
        ),
      );
    },
  );
}

Future<dynamic> retriggerApi(BuildContext context) async {
  return null;
}

Future checkSessionTokenBlock(BuildContext context) async {}

Future validateAuth(BuildContext context) async {}

Future refreshTokenBlock(
  BuildContext context, {
  bool? tokenExpired,
}) async {}

Future<List<ScheduleStruct>?> reuseAPI(
  BuildContext context, {
  String? deviceId,
  int? groupId,
}) async {
  ApiCallResponse? apiResult3y8;
  ApiCallResponse? apiResult8jr;

  FFAppState().update(() {});
  await Future.wait([
    Future(() async {
      apiResult3y8 = await ScheduleGroup.readScheduleByDeviceIdCall.call();

      if ((apiResult3y8?.succeeded ?? true)) {}
    }),
    Future(() async {
      apiResult8jr = await ScheduleGroup.readScheduleByDeviceGroupCall.call();

      if ((apiResult8jr?.succeeded ?? true)) {
        FFAppState().update(() {});
      }
    }),
  ]);

  return null;
}
