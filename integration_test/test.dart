import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:m_d_m_s_u_i_automate_test/flutter_flow/flutter_flow_drop_down.dart';
import 'package:m_d_m_s_u_i_automate_test/flutter_flow/flutter_flow_icon_button.dart';
import 'package:m_d_m_s_u_i_automate_test/flutter_flow/flutter_flow_radio_button.dart';
import 'package:m_d_m_s_u_i_automate_test/flutter_flow/flutter_flow_widgets.dart';
import 'package:m_d_m_s_u_i_automate_test/flutter_flow/flutter_flow_theme.dart';
import 'package:m_d_m_s_u_i_automate_test/index.dart';
import 'package:m_d_m_s_u_i_automate_test/main.dart';
import 'package:m_d_m_s_u_i_automate_test/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('Chantha', () {
    testWidgets('DashboardPage', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 9000));
      await tester.tap(find.text('Dashboard'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Total Device'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Dashboard'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Today'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Weekly'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Weekly'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Monthly'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Monthly'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Yearly'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('Recent Devices')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
    });

    testWidgets('Device Management', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 10000));
      await tester.tap(find.text('Device Management'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('800046773'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('cSidebarClose')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('800046774'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('800046775'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('800046776'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('chbDV1')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('chbDV2')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('chbDV3')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('chbDV4')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Export'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Device Type'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Sensor'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.enterText(find.text('Serial Number'), 'Serial');
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
    });

    testWidgets('TOU Management', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 10000));
      await tester.tap(find.text('TOU Management'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Seasons'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Add'));
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Month Range'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
    });

    testWidgets('Events', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 10000));
      await tester.tap(find.text('Events'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('DEV-456-789'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('chbEventView1')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('btnDevice1')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('View Details'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('btnDevice1')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Archive'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('btnDevice1')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Send Notification'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Events'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Archive (2)'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('chbDevice2')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('btnDevice2')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('View Details'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('btnDevice2')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Archive'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.byKey(ValueKey('btnDevice2')));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Send Notification'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
    });

    testWidgets('Settings', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 10000));
      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.tap(find.text('Product Settings'));
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      expect(find.text('Options'), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Add'), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 5000));
      await tester.enterText(find.byKey(ValueKey('txtPSVSearch')), '0');
      await tester.pumpAndSettle(Duration(milliseconds: 10000));
    });
  });

  group('bunhai', () {
    testWidgets('Create Season', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: PSeasonWidget(),
        ),
      ));

      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('MainLayoutV2_n2l0')),
        matching: find.byKey(ValueKey('Container_wz25')),
      ));
      expect(find.byKey(ValueKey('pSeason_8nzo')), findsWidgets);
      await tester.tap(find.text('Add'));
      expect(find.byKey(ValueKey('MainLayoutV2_ihfl')), findsWidgets);
      await tester.pumpAndSettle(Duration(milliseconds: 600));
      await tester.enterText(
          find.bySemanticsLabel(RegExp('Name')), 'Hello World');
      await tester.tap(find.bySemanticsLabel(RegExp('ChoiceChips')));
      await tester.tap(find.bySemanticsLabel(RegExp('PrimaryButton')));
      expect(find.byKey(ValueKey('MainLayoutV2_nmyv')), findsOneWidget);
    });
  });

  group('Thean', () {
    testWidgets('Dashboard', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 0));
      await tester.tap(find.byKey(ValueKey('Dashboard')));
      await tester.pumpAndSettle();
      expect(find.byKey(ValueKey('Total Device')), findsNWidgets(3));
      await tester.pumpAndSettle();
      expect(find.byKey(ValueKey('Active Device')), findsNWidgets(2));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey('Recent Devices')));
    });
  });

  group('Somrith', () {
    testWidgets('Dashboard', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(
            code: '',
          ),
        ),
      ));

      await tester.pumpAndSettle(
        Duration(milliseconds: 5),
        EnginePhase.sendSemanticsUpdate,
        Duration(milliseconds: 10),
      );
      await tester.tap(find.byKey(ValueKey('Dashboard')));
      await tester.tap(find.byKey(ValueKey('DevicesPage_evbv')));
    });
  });

  group('Mengkrim', () {
    testWidgets('DevicePage', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: AddDevicePageWidget(),
        ),
      ));

      await tester.tap(find.text('Device Type'));
      await tester.pumpAndSettle(
        Duration(milliseconds: 1000),
        EnginePhase.sendSemanticsUpdate,
        Duration(milliseconds: 1000),
      );
      await tester.enterText(find.text('Phase'), 'IPhone 12 Pro');
      await tester.tap(find.text('Communication Type'));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.text('Communication Type'));
      await tester.tap(find.text('Basic Current'));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.text('Basic Current'));
      await tester.enterText(find.text('Device Name'), 'Samsung S23 Ultra');
    });
  });

  group('Nary', () {
    testWidgets('ViewDevice', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.tap(find.text('Total Device'));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.text('Total Device'));
      await tester.pumpAndSettle(Duration(milliseconds: 1000));
      await tester.tap(find.byKey(ValueKey('MainLayoutV2_n2l0')));
      await tester.pumpAndSettle(Duration(milliseconds: 1000));
      expect(find.byKey(ValueKey('DevicesPage_evbv')), findsOneWidget);
    });
  });

  group('Nary Test Done', () {
    testWidgets('Addviewdevice', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.tap(find.byKey(ValueKey('DashboardPage_birf')));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('Dashboard')),
        matching: find.byKey(ValueKey('Column_sz6b')),
      ));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      await tester.tap(find.byKey(ValueKey('MainLayoutV2_n2l0')));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      expect(
        find.descendant(
          of: find.byKey(ValueKey('MainLayoutV2_n2l0')),
          matching: find.byKey(ValueKey('Child_gjup')),
        ),
        findsOneWidget,
      );
    });

    testWidgets('AddnewDV', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DevicesPageWidget(),
        ),
      ));

      await tester.tap(find.text('Add'));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      await tester.tap(find.byKey(ValueKey('MainLayoutV1_ld8o')));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      expect(find.byKey(ValueKey('MainLayoutV1_ld8o')), findsOneWidget);
    });

    testWidgets('Add TOU info pacail', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DevicesPageWidget(),
        ),
      ));

      await tester.tap(find.text('06/01/2024'));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.text('06/01/2024'));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      expect(find.byKey(ValueKey('MainLayoutV1_mcov')), findsOneWidget);
    });

    testWidgets('Tab TOU', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DashboardPageWidget(),
        ),
      ));

      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('Dashboard')),
        matching: find.byKey(ValueKey('IconButton_19gy')),
      ));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('Dashboard')),
        matching: find.byKey(ValueKey('IconButton_19gy')),
      ));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      await tester.tap(find.text('TOU Setting'));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      await tester.tap(find.text('TOU'));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.text('TOU'));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      expect(find.byKey(ValueKey('MainLayoutV1_yv6v')), findsOneWidget);
    });
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
