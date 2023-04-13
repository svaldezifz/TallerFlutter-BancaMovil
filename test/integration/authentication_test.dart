import 'package:banca_movil_app/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end authentication test', () {
    testWidgets('authentication flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder textFinder = find.text('Login Screen');
      expect(textFinder, findsOneWidget);

      final Finder emailTextFieldFinder = find.byKey(const Key('EmailTextField'));
      expect(emailTextFieldFinder, findsOneWidget);
      await tester.enterText(emailTextFieldFinder, 'svaldez@interfaz.io');
      await tester.pumpAndSettle();

      final Finder passwordTextFieldFinder = find.byKey(const Key('PasswordTextField'));
      expect(passwordTextFieldFinder, findsOneWidget);
      await tester.enterText(passwordTextFieldFinder, 'Test123@');
      await tester.pumpAndSettle();

      final Finder loginButtonFinder = find.text('Login');
      expect(loginButtonFinder, findsOneWidget);
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();

      final Finder homeScreenTitleFinder = find.text('My Products');
      expect(homeScreenTitleFinder, findsOneWidget);
    });
  });
}
