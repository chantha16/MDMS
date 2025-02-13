import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

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
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/MDM-Sincal-Animation-Key-Visual-12fps.gif',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : entryPage ?? DashboardPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/MDM-Sincal-Animation-Key-Visual-12fps.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : entryPage ?? DashboardPageWidget(),
        ),
        FFRoute(
          name: 'DevicesPage',
          path: '/devices',
          builder: (context, params) => DevicesPageWidget(),
        ),
        FFRoute(
          name: 'ResourcesPage',
          path: '/resourcesPage',
          builder: (context, params) => ResourcesPageWidget(),
        ),
        FFRoute(
          name: 'AddDevicePage',
          path: '/pAddDevice',
          builder: (context, params) => AddDevicePageWidget(),
        ),
        FFRoute(
          name: 'DeviceSettingPage',
          path: '/pDeviceSetting',
          builder: (context, params) => DeviceSettingPageWidget(),
        ),
        FFRoute(
          name: 'DashboardPage',
          path: '/dashboard',
          builder: (context, params) => DashboardPageWidget(
            code: params.getParam(
              'code',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ResourcePage',
          path: '/resourcePage',
          builder: (context, params) => ResourcePageWidget(),
        ),
        FFRoute(
          name: 'TouDetails',
          path: '/tou-details',
          builder: (context, params) => TouDetailsWidget(),
        ),
        FFRoute(
          name: 'TouPage',
          path: '/tou',
          builder: (context, params) => TouPageWidget(),
        ),
        FFRoute(
          name: 'TimeBandDetails',
          path: '/pAddTimeBand',
          builder: (context, params) => TimeBandDetailsWidget(),
        ),
        FFRoute(
          name: 'TimeBandPage',
          path: '/time-bands',
          builder: (context, params) => TimeBandPageWidget(),
        ),
        FFRoute(
          name: 'seasonmaintest',
          path: '/seasonmaintest',
          builder: (context, params) => SeasonmaintestWidget(),
        ),
        FFRoute(
          name: 'EventPage',
          path: '/events',
          builder: (context, params) => EventPageWidget(),
        ),
        FFRoute(
          name: 'EventDetailPage',
          path: '/event-deatails',
          builder: (context, params) => EventDetailPageWidget(),
        ),
        FFRoute(
          name: 'VideoPlayPage',
          path: '/videoPlayPage',
          builder: (context, params) => VideoPlayPageWidget(),
        ),
        FFRoute(
          name: 'DeviceDetailsPage',
          path: '/deviceDetailsPage',
          builder: (context, params) => DeviceDetailsPageWidget(),
        ),
        FFRoute(
          name: 'sandbox1',
          path: '/sandbox1',
          builder: (context, params) => Sandbox1Widget(),
        ),
        FFRoute(
          name: 'sandbox3',
          path: '/sandbox3',
          builder: (context, params) => Sandbox3Widget(),
        ),
        FFRoute(
          name: 'pSeason',
          path: '/Season',
          builder: (context, params) => PSeasonWidget(),
        ),
        FFRoute(
          name: 'pSeasonDetail',
          path: '/Season-Detail',
          builder: (context, params) => PSeasonDetailWidget(
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
          name: 'pSpecailDayList',
          path: '/pSpecailDayList',
          builder: (context, params) => PSpecailDayListWidget(
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
          name: 'pSpecialDayDetail',
          path: '/pSpecialDayDetail',
          builder: (context, params) => PSpecialDayDetailWidget(
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
          name: 'pSpecialDayAdd',
          path: '/pSpecialDayAdd',
          builder: (context, params) => PSpecialDayAddWidget(
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
          name: 'pSpecialDayView',
          path: '/pSpecialDayView',
          builder: (context, params) => PSpecialDayViewWidget(
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
          name: 'ProductSettingPage',
          path: '/productSettingPage',
          builder: (context, params) => ProductSettingPageWidget(),
        ),
        FFRoute(
          name: 'fffff',
          path: '/fffff',
          builder: (context, params) => FffffWidget(),
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
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

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
