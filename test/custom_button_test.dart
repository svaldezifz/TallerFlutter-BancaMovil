import 'package:banca_movil_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Custom Button test', (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: CustomButton(
        text: 'Login',
        onPressed: _onPressed,
      ),
    ));

    expect(find.text('Login'), findsOneWidget);
  });
}

void _onPressed() {}
