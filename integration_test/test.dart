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
    testWidgets('DeviceSettingPage', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: DeviceSettingPageWidget(),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('MainLayoutV1_mxfy')),
        matching: find.byKey(ValueKey('Container_lz89')),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('MainLayoutV1_mxfy')),
        matching: find.byKey(ValueKey('Expandable_zo7v')),
      ));
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(ValueKey('MainLayoutV1_mxfy')),
          matching: find.byKey(ValueKey('Text_k59j')),
        ),
        findsNothing,
      );
    });
  });

  // group('Nary', () {
  //   testWidgets('add new device', (WidgetTester tester) async {
  //     _overrideOnError();

  //     await tester.pumpWidget(ChangeNotifierProvider(
  //       create: (context) => FFAppState(),
  //       child: MyApp(
  //         entryPage: DevicesPageWidget(),
  //       ),
  //     ));

  //     await tester.tap(find.byKey(ValueKey('Empty')));
  //     await tester.pumpAndSettle(
  //       Duration(milliseconds: 3000),
  //       EnginePhase.sendSemanticsUpdate,
  //       Duration(milliseconds: 5000),
  //     );
  //     expect(find.byKey(ValueKey('Empty')), findsOneWidget);
  //     await tester.tap(find.byKey(ValueKey('Null')));
  //     await tester.pumpAndSettle(
  //       Duration(milliseconds: 3000),
  //       EnginePhase.sendSemanticsUpdate,
  //       Duration(milliseconds: 5000),
  //     );
  //     expect(find.byKey(ValueKey('Null')), findsOneWidget);
  //     await tester.tap(find.byKey(ValueKey('3')));
  //     await tester.pumpAndSettle(
  //       Duration(milliseconds: 3000),
  //       EnginePhase.sendSemanticsUpdate,
  //       Duration(milliseconds: 5000),
  //     );
  //     expect(find.byKey(ValueKey('3')), findsOneWidget);
  //   });
  // });

  // group('bunhai', () {
  //   testWidgets('Create Season', (WidgetTester tester) async {
  //     _overrideOnError();

  //     await tester.pumpWidget(ChangeNotifierProvider(
  //       create: (context) => FFAppState(),
  //       child: MyApp(
  //         entryPage: PSeasonWidget(),
  //       ),
  //     ));

  //     await tester.tap(find.descendant(
  //       of: find.byKey(ValueKey('MainLayoutV2_n2l0')),
  //       matching: find.byKey(ValueKey('Container_wz25')),
  //     ));
  //     expect(find.byKey(ValueKey('pSeason_8nzo')), findsWidgets);
  //     await tester.tap(find.text('Add'));
  //     expect(find.byKey(ValueKey('MainLayoutV2_ihfl')), findsWidgets);
  //     await tester.pumpAndSettle(Duration(milliseconds: 600));
  //     await tester.enterText(
  //         find.bySemanticsLabel(RegExp('Name')), 'Hello World');
  //     await tester.tap(find.bySemanticsLabel(RegExp('ChoiceChips')));
  //     await tester.tap(find.bySemanticsLabel(RegExp('PrimaryButton')));
  //     expect(find.byKey(ValueKey('MainLayoutV2_nmyv')), findsOneWidget);
  //   });
  // });

  // group('Thean', () {
  //   testWidgets('Dashboard', (WidgetTester tester) async {
  //     _overrideOnError();

  //     await tester.pumpWidget(ChangeNotifierProvider(
  //       create: (context) => FFAppState(),
  //       child: MyApp(
  //         entryPage: DashboardPageWidget(),
  //       ),
  //     ));

  //     await tester.pumpAndSettle(Duration(milliseconds: 0));
  //     await tester.tap(find.byKey(ValueKey('Dashboard')));
  //     await tester.pumpAndSettle();
  //     expect(find.text('3'), findsOneWidget);
  //     await tester.pumpAndSettle();
  //     expect(find.text('2'), findsOneWidget);
  //     await tester.pumpAndSettle();
  //     expect(find.text('1'), findsOneWidget);
  //   });
  // });

  // group('Somrith', () {
  //   testWidgets('Configuration', (WidgetTester tester) async {
  //     _overrideOnError();

  //     await tester.pumpWidget(ChangeNotifierProvider(
  //       create: (context) => FFAppState(),
  //       child: MyApp(
  //         entryPage: DevicesPageWidget(),
  //       ),
  //     ));

  //     await tester.tap(find.byKey(ValueKey('MainLayoutV2_n2l0')));
  //   });
  // });

  // group('Mengkrim', () {
  //   testWidgets('DevicePage', (WidgetTester tester) async {
  //     _overrideOnError();

  //     await tester.pumpWidget(ChangeNotifierProvider(
  //       create: (context) => FFAppState(),
  //       child: MyApp(
  //         entryPage: DevicesPageWidget(),
  //       ),
  //     ));

  //     await tester.tap(find.text('Device'));
  //     await tester.pumpAndSettle(Duration(milliseconds: 1));
  //     await tester.tap(find.text('[UNSET]'));
  //   });
  // });

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
