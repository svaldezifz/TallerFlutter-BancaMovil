import 'package:flutter/material.dart';

import 'package:banca_movil_app/screens/login_screen.dart';

import '../custom_button.dart';

class DetailsScreenArguments {
  final String transactionName;

  DetailsScreenArguments({required this.transactionName});
}

class DetailsScreen extends StatefulWidget {
  static const String screenName = 'detailsScreen';

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArguments?;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments?.transactionName ?? 'DEFAULT'),
      ),
      body: Column(
        children: [
          Text('Counter: $_counter'),
          CustomButton(
            text: 'Inc counter',
            onPressed: _incrementCounter,
          ),
          CustomButton(
            text: 'Go to Login',
            onPressed: () {
              final navigator = Navigator.of(context);
              // navigator.pushNamed(LoginScreen.screenName);
              navigator.popUntil((route) => route.settings.name == LoginScreen.screenName);
            },
          ),
        ],
      ),
    );
  }
}
