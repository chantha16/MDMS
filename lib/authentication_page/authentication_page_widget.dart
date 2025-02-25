import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'authentication_page_model.dart';
export 'authentication_page_model.dart';

class AuthenticationPageWidget extends StatefulWidget {
  const AuthenticationPageWidget({super.key});

  static String routeName = 'AuthenticationPage';
  static String routePath = '/authentication';

  @override
  State<AuthenticationPageWidget> createState() =>
      _AuthenticationPageWidgetState();
}

class _AuthenticationPageWidgetState extends State<AuthenticationPageWidget> {
  late AuthenticationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthenticationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.printLog(
        loggedIn.toString(),
      );
      if (!loggedIn) {
        _model.handleRedirectResponse = await actions.handleRedirect(
          'code',
        );
        if (_model.handleRedirectResponse != null &&
            _model.handleRedirectResponse != '') {
          _model.getUrlPathRes = await actions.getUrlPath();
          _model.exchangeTokenResponse =
              await KeycloakGroup.exchangeTokenCall.call(
            code: _model.handleRedirectResponse,
            redirectUri: _model.getUrlPathRes,
          );

          if ((_model.exchangeTokenResponse?.succeeded ?? true)) {
            _model.getProfileResponse = await KeycloakGroup.getProfileCall.call(
              token: TokenResponseModelStruct.maybeFromMap(
                      (_model.exchangeTokenResponse?.jsonBody ?? ''))
                  ?.accessToken,
            );

            if ((_model.getProfileResponse?.succeeded ?? true)) {
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signIn(
                authenticationToken: TokenResponseModelStruct.maybeFromMap(
                        (_model.exchangeTokenResponse?.jsonBody ?? ''))
                    ?.accessToken,
                refreshToken: TokenResponseModelStruct.maybeFromMap(
                        (_model.exchangeTokenResponse?.jsonBody ?? ''))
                    ?.refreshToken,
                userData: GetProfileResponseModelStruct.maybeFromMap(
                    (_model.getProfileResponse?.jsonBody ?? '')),
              );

              context.goNamedAuth(
                DashboardPageWidget.routeName,
                context.mounted,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                  ),
                },
              );
            }
          }
        } else {
          await actions.openWebLogin();
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Container(
              width: 50.0,
              height: 50.0,
              child: custom_widgets.RippleLoadingWidget(
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
