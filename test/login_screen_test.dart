import 'package:banca_movil_app/common/widgets/custom_button.dart';
import 'package:banca_movil_app/features/auth/bloc/auth_bloc.dart';
import 'package:banca_movil_app/features/auth/ui/screens/login_screen_v2.dart';
import 'package:banca_movil_app/features/products/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login screen test', (widgetTester) async {
    await widgetTester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(),
          ),
          BlocProvider<ProductBloc>(
            create: (BuildContext context) => ProductBloc(),
          ),
        ],
        child: const MaterialApp(
          home: LoginScreenV2(),
        ),
      ),
    );

    expect(find.widgetWithIcon(ElevatedButton, Icons.g_mobiledata), findsOneWidget);
  });
}

void _onPressed() {}
