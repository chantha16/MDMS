import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  MDMSUIAutomateTestAuthUser? initialUser;
  MDMSUIAutomateTestAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(MDMSUIAutomateTestAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? DashboardPageWidget()
          : DashboardPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? DashboardPageWidget()
              : DashboardPageWidget(),
        ),
        FFRoute(
          name: DashboardPageWidget.routeName,
          path: DashboardPageWidget.routePath,
          builder: (context, params) => DashboardPageWidget(
            code: params.getParam(
              'code',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ResourcePageWidget.routeName,
          path: ResourcePageWidget.routePath,
          builder: (context, params) => ResourcePageWidget(),
        ),
        FFRoute(
          name: TouDetailsWidget.routeName,
          path: TouDetailsWidget.routePath,
          builder: (context, params) => TouDetailsWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: TimeBandPageWidget.routeName,
          path: TimeBandPageWidget.routePath,
          builder: (context, params) => TimeBandPageWidget(),
        ),
        FFRoute(
          name: EventPageWidget.routeName,
          path: EventPageWidget.routePath,
          builder: (context, params) => EventPageWidget(),
        ),
        FFRoute(
          name: EventDetailPageWidget.routeName,
          path: EventDetailPageWidget.routePath,
          builder: (context, params) => EventDetailPageWidget(),
        ),
        FFRoute(
          name: Sandbox3Widget.routeName,
          path: Sandbox3Widget.routePath,
          builder: (context, params) => Sandbox3Widget(),
        ),
        FFRoute(
          name: SpecailDayListWidget.routeName,
          path: SpecailDayListWidget.routePath,
          builder: (context, params) => SpecailDayListWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            types: params.getParam(
              'types',
              ParamType.DataStruct,
              isList: false,
              structBuilder: FlagStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: SpecialDayDetailPageWidget.routeName,
          path: SpecialDayDetailPageWidget.routePath,
          builder: (context, params) => SpecialDayDetailPageWidget(
            types: params.getParam<Flag>(
              'types',
              ParamType.Enum,
            ),
            detailsSpecial: params.getParam(
              'detailsSpecial',
              ParamType.DataStruct,
              isList: false,
              structBuilder: SpecialDayDetailsModelStruct.fromSerializableMap,
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SpecialDayAddWidget.routeName,
          path: SpecialDayAddWidget.routePath,
          builder: (context, params) => SpecialDayAddWidget(
            types: params.getParam<Flag>(
              'types',
              ParamType.Enum,
            ),
            detailss: params.getParam(
              'detailss',
              ParamType.DataStruct,
              isList: false,
              structBuilder: SpecialDayModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: SpecialDayPageWidget.routeName,
          path: SpecialDayPageWidget.routePath,
          builder: (context, params) => SpecialDayPageWidget(
            types: params.getParam<Flag>(
              'types',
              ParamType.Enum,
            ),
            detailsSpecial: params.getParam(
              'detailsSpecial',
              ParamType.DataStruct,
              isList: false,
              structBuilder: SpecialDayDetailsModelStruct.fromSerializableMap,
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            detailsSpecials: params.getParam(
              'detailsSpecials',
              ParamType.DataStruct,
              isList: false,
              structBuilder: SpecialDayModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: ProductSettingPageWidget.routeName,
          path: ProductSettingPageWidget.routePath,
          builder: (context, params) => ProductSettingPageWidget(),
        ),
        FFRoute(
          name: MainSitePageWidget.routeName,
          path: MainSitePageWidget.routePath,
          builder: (context, params) => MainSitePageWidget(),
        ),
        FFRoute(
          name: MainSiteDetailPageWidget.routeName,
          path: MainSiteDetailPageWidget.routePath,
          builder: (context, params) => MainSiteDetailPageWidget(
            parentid: params.getParam(
              'parentid',
              ParamType.int,
            ),
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            siteId: params.getParam(
              'siteId',
              ParamType.int,
            ),
            triggerRefresh: params.getParam(
              'triggerRefresh',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SubsiteDetailPageWidget.routeName,
          path: SubsiteDetailPageWidget.routePath,
          builder: (context, params) => SubsiteDetailPageWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            siteId: params.getParam(
              'siteId',
              ParamType.int,
            ),
            parentId: params.getParam(
              'parentId',
              ParamType.int,
            ),
            triggerRefresh: params.getParam(
              'triggerRefresh',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: TimeBandDetailPageWidget.routeName,
          path: TimeBandDetailPageWidget.routePath,
          builder: (context, params) => TimeBandDetailPageWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            timeBandId: params.getParam(
              'timeBandId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SeasonPageWidget.routeName,
          path: SeasonPageWidget.routePath,
          builder: (context, params) => SeasonPageWidget(),
        ),
        FFRoute(
          name: SeasonDetailPageWidget.routeName,
          path: SeasonDetailPageWidget.routePath,
          builder: (context, params) => SeasonDetailPageWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            seasonId: params.getParam(
              'seasonId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: TouListWidget.routeName,
          path: TouListWidget.routePath,
          builder: (context, params) => TouListWidget(),
        ),
        FFRoute(
          name: DeviceListsWidget.routeName,
          path: DeviceListsWidget.routePath,
          builder: (context, params) => DeviceListsWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            types: params.getParam(
              'types',
              ParamType.DataStruct,
              isList: false,
              structBuilder: FlagStruct.fromSerializableMap,
            ),
            deviceId: params.getParam(
              'deviceId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PDeviceDetailsWidget.routeName,
          path: PDeviceDetailsWidget.routePath,
          builder: (context, params) => PDeviceDetailsWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            deviceId: params.getParam(
              'deviceId',
              ParamType.String,
            ),
            types: params.getParam(
              'types',
              ParamType.DataStruct,
              isList: false,
              structBuilder: FlagStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: AuthenticationPageWidget.routeName,
          path: AuthenticationPageWidget.routePath,
          builder: (context, params) => AuthenticationPageWidget(),
        ),
        FFRoute(
          name: DeviceGroupPageWidget.routeName,
          path: DeviceGroupPageWidget.routePath,
          builder: (context, params) => DeviceGroupPageWidget(),
        ),
        FFRoute(
          name: DeviceGroupDetailPageWidget.routeName,
          path: DeviceGroupDetailPageWidget.routePath,
          builder: (context, params) => DeviceGroupDetailPageWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            deviceGroupId: params.getParam(
              'deviceGroupId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ScheduleListWidget.routeName,
          path: ScheduleListWidget.routePath,
          builder: (context, params) => ScheduleListWidget(),
        ),
        FFRoute(
          name: ScheduleViewWidget.routeName,
          path: ScheduleViewWidget.routePath,
          builder: (context, params) => ScheduleViewWidget(
            type: params.getParam<Flag>(
              'type',
              ParamType.Enum,
            ),
            scheduleId: params.getParam(
              'scheduleId',
              ParamType.String,
            ),
            typeSchedule: params.getParam<FlagSchedule>(
              'typeSchedule',
              ParamType.Enum,
            ),
            deviceGroupId: params.getParam(
              'deviceGroupId',
              ParamType.int,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/dashboard';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/MDM-Sincal-Animation-Key-Visual-12fps.gif',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
