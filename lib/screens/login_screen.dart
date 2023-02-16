import 'package:flutter/material.dart';

import 'package:banca_movil_app/custom_button_1.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String screenName = 'loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        children: [
          CustomButton1(
            text: 'Go to Home',
            onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.screenName);
            },
          ),
        ],
      ),
    );
  }
}
