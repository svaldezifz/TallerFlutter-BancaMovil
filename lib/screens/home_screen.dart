import 'package:flutter/material.dart';

import 'package:banca_movil_app/screens/details_screen.dart';

import '../custom_button_1.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        children: [
          Text('Counter: $_counter'),
          CustomButton1(
            text: 'Inc counter',
            onPressed: _incrementCounter,
          ),
          CustomButton1(
            text: 'Go to Details',
            onPressed: () {
              // Navigator.of(context).pushNamed(
              //   DetailsScreen.screenName,
              //   arguments: DetailsScreenArguments(transactionName: 'NETFLIX 15.99'),
              // );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                  settings: RouteSettings(
                    arguments: DetailsScreenArguments(
                      transactionName: 'NETFLIX FEBRUARY',
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
