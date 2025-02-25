import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/dashboard/components/dashboard_view/dashboard_view_widget.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dashboard_page_model.dart';
export 'dashboard_page_model.dart';

class DashboardPageWidget extends StatefulWidget {
  const DashboardPageWidget({
    super.key,
    this.code,
  });

  final String? code;

  static String routeName = 'DashboardPage';
  static String routePath = '/dashboard';

  @override
  State<DashboardPageWidget> createState() => _DashboardPageWidgetState();
}

class _DashboardPageWidgetState extends State<DashboardPageWidget> {
  late DashboardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      _model.introspectResponse = await KeycloakGroup.introspectCall.call(
        token: currentAuthenticationToken,
      );

      if (!(_model.introspectResponse?.succeeded ?? true)) {
        _model.refreshTokenResponse = await KeycloakGroup.refreshTokenCall.call(
          refreshToken: currentAuthRefreshToken,
        );

        if ((_model.refreshTokenResponse?.succeeded ?? true)) {
          authManager.updateAuthUserData(
            authenticationToken: TokenResponseModelStruct.maybeFromMap(
                    (_model.refreshTokenResponse?.jsonBody ?? ''))
                ?.accessToken,
            refreshToken: TokenResponseModelStruct.maybeFromMap(
                    (_model.refreshTokenResponse?.jsonBody ?? ''))
                ?.refreshToken,
          );
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          _navigate = () => context.goNamedAuth(
              AuthenticationPageWidget.routeName, context.mounted);
        }
      }

      _navigate();
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
          child: wrapWithModel(
            model: _model.mainLayoutModel,
            updateCallback: () => safeSetState(() {}),
            child: MainLayoutWidget(
              key: ValueKey('MainLayout_3bpk'),
              menu: MenuItems.Dashboard,
              child: () => DashboardViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
