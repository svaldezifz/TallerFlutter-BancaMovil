import 'package:banca_movil_app/features/auth/bloc/auth_bloc.dart';
import 'package:banca_movil_app/features/auth/ui/screens/login_screen_v2.dart';
import 'package:banca_movil_app/features/products/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:banca_movil_app/common/widgets/custom_button.dart';
import 'package:banca_movil_app/common/screens/details_screen.dart';
import 'package:banca_movil_app/common/screens/home_screen.dart';
import 'package:banca_movil_app/features/auth/bloc/models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // fontFamily: 'DancingScript',
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.screenName,
        routes: {
          LoginScreenV2.screenName: (context) => const LoginScreenV2(),
          HomeScreen.screenName: (context) => const HomeScreen(),
          DetailsScreen.screenName: (context) => const DetailsScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
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
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                children: const [
                  Icon(Icons.abc),
                  Icon(Icons.ac_unit),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text('1'),
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
                  return const Text('Nada');
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
