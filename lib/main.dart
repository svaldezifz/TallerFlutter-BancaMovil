import 'package:banca_movil_app/auth_bloc/auth_bloc.dart';
import 'package:banca_movil_app/auth_bloc/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:banca_movil_app/custom_button.dart';
import 'package:banca_movil_app/screens/details_screen.dart';
import 'package:banca_movil_app/screens/home_screen.dart';
import 'package:banca_movil_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          fontFamily: 'DancingScript',
          primarySwatch: Colors.red,
        ),
        // home: const LoginScreen(),
        initialRoute: LoginScreen.screenName,
        routes: {
          LoginScreen.screenName: (context) => const LoginScreen(),
          HomeScreen.screenName: (context) => const HomeScreen(),
          DetailsScreen.screenName: (context) => const DetailsScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
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
    print('init state');
    _scrollController = ScrollController();
    _getNumber();
    print('Test');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<int> _getNumber() async {
    http.Response response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    print(response.body);
    // await Future.delayed(Duration(milliseconds: 2000));
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final textTheme = Theme.of(context).textTheme;
    // if (Platform.isIOS) {

    // }
    // return CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(leading: Text('Title')), child: Column());
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/figma.png',
                width: 40,
                height: 100,
              ),
              const Image(
                image: AssetImage('assets/images/figma.png'),
                width: 40,
                height: 100,
              ),
              Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-faintings.gif',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.red,
                    width: 30,
                    height: 30,
                  );
                },
              ),
              Text(
                'You have pushed the button this many times:',
                style: textTheme.titleLarge,
                // style: TextStyle(
                //   fontFamily: 'DancingScript',
                // ),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                children: [
                  Icon(Icons.abc),
                  Icon(Icons.ac_unit),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text('1'),
              ),
              CustomButton(
                text: 'BOTON 1',
                onPressed: () {
                  print('BOTON 1 PRESIONADO');
                },
              ),
              CustomButton(
                text: 'BOTON 2',
                onPressed: () {
                  print('BOTON 2 PRESIONADO');
                },
              ),
              FutureBuilder(
                future: _getNumber(),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  print('FUTURE BUILDER');
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.toString());
                    }
                  }
                  return Text('Nada');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
