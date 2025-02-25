import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

class AuthenticationPageModel
    extends FlutterFlowModel<AuthenticationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - handleRedirect] action in AuthenticationPage widget.
  String? handleRedirectResponse;
  // Stores action output result for [Custom Action - getUrlPath] action in AuthenticationPage widget.
  String? getUrlPathRes;
  // Stores action output result for [Backend Call - API (Exchange Token)] action in AuthenticationPage widget.
  ApiCallResponse? exchangeTokenResponse;
  // Stores action output result for [Backend Call - API (Get Profile)] action in AuthenticationPage widget.
  ApiCallResponse? getProfileResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future navigateToDashboardBlock(BuildContext context) async {
    context.goNamed(
      DashboardPageWidget.routeName,
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  }
}
