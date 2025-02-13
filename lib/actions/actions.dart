import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future validateAuth(BuildContext context) async {
  String? handleRedirectCodeResponse;
  ApiCallResponse? exchangeTokenResponse;
  ApiCallResponse? getProfileResponse;

  handleRedirectCodeResponse = await actions.handleRedirect(
    'code',
  );
  if (handleRedirectCodeResponse != null && handleRedirectCodeResponse != '') {
    if (FFAppState().isLoggedIn) {
      await action_blocks.checkSessionTokenBlock(context);
      return;
    } else {
      exchangeTokenResponse = await KeycloakGroup.exchangeTokenCall.call(
        code: handleRedirectCodeResponse,
        redirectUri: FFAppState().urlPath,
      );

      if ((exchangeTokenResponse.succeeded ?? true)) {
        FFAppState().isLoggedIn = true;
        FFAppState().token = TokenResponseModelStruct.maybeFromMap(
            (exchangeTokenResponse.jsonBody ?? ''))!;
        FFAppState().update(() {});
        FFAppState().updateTokenStruct(
          (e) => e,
        );
        FFAppState().update(() {});
        getProfileResponse = await KeycloakGroup.getProfileCall.call(
          token: TokenResponseModelStruct.maybeFromMap(
                  (exchangeTokenResponse.jsonBody ?? ''))
              ?.accessToken,
        );

        if ((getProfileResponse.succeeded ?? true)) {
          FFAppState().profile = GetProfileResponseModelStruct.maybeFromMap(
              (getProfileResponse.jsonBody ?? ''))!;
          // Go to dashboard

          context.goNamed(
            'ResourcesPage',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return;
        } else {
          return;
        }
      } else {
        return;
      }
    }
  } else {
    await action_blocks.checkSessionTokenBlock(context);
    return;
  }
}

Future checkSessionTokenBlock(BuildContext context) async {
  ApiCallResponse? introspectResponse;

  if ((FFAppState().token.accessToken != '') &&
      FFAppState().isLoggedIn) {
    introspectResponse = await KeycloakGroup.introspectCall.call(
      token: FFAppState().token.accessToken,
    );

    if ((introspectResponse.succeeded ?? true)) {
      if (IntrospectModelStruct.maybeFromMap(
                  (introspectResponse.jsonBody ?? ''))
              ?.active ==
          true) {
        // Go to dashboard

        context.pushNamed(
          'ResourcesPage',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        return;
      } else {
        await action_blocks.refreshTokenBlock(context);
        return;
      }
    } else {
      await action_blocks.checkSessionTokenBlock(context);
      return;
    }
  } else {
    FFAppState().isLoggedIn = false;
    FFAppState().update(() {});
    await actions.openWebLogin();
    return;
  }
}

Future refreshTokenBlock(
  BuildContext context, {
  bool? tokenExpired,
}) async {}

Future logoutBlock(BuildContext context) async {
  ApiCallResponse? logoutResponse;

  logoutResponse = await KeycloakGroup.logoutCall.call();

  if ((logoutResponse.succeeded ?? true)) {
    FFAppState().isLoggedIn = false;
    FFAppState().deleteToken();
    FFAppState().token = TokenResponseModelStruct();

    FFAppState().deleteProfile();
    FFAppState().profile = GetProfileResponseModelStruct();

    FFAppState().update(() {});
    await actions.openWebLogin();
    return;
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Logout failed.',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).info,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
    return;
  }
}

Future handleException(
  BuildContext context, {
  dynamic error,
}) async {}

Future actionBlock(BuildContext context) async {}

Future handle(
  BuildContext context, {
  dynamic payload,
}) async {}
