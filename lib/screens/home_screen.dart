import 'dart:developer';

import 'package:banca_movil_app/auth_bloc/auth_bloc.dart';
import 'package:banca_movil_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:banca_movil_app/screens/details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
      //         Navigator.of(context)
      //             .pushNamedAndRemoveUntil(LoginScreen.screenName, (route) => false);
      //       },
      //       icon: const Icon(Icons.logout),
      //     ),
      //   ],
      // ),
      // body: ListView(
      //   children: [
      //     const Placeholder(
      //       fallbackHeight: 250,
      //     ),
      //     ListView.builder(
      //       itemCount: 10000,
      //       shrinkWrap: true,
      //       physics: const NeverScrollableScrollPhysics(),
      //       itemBuilder: (context, index) {
      //         log("Item $index");
      //         return Container(
      //           height: 200,
      //           alignment: Alignment.center,
      //           color: Colors.primaries[index % Colors.primaries.length],
      //           child: Text(
      //             '${index + 1}',
      //             textAlign: TextAlign.center,
      //             style: const TextStyle(
      //               fontSize: 100,
      //               color: Colors.white,
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text("Home Screen"),
            collapsedHeight: 200,
            // expandedHeight: 200,
            floating: true,
            // pinned: true,
            snap: true,
            actions: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(LoginScreen.screenName, (route) => false);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
            stretch: true,
            stretchTriggerOffset: 80,
            onStretchTrigger: () async {
              log('On STRECTH');
            },
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              background: Image.network(
                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Placeholder(
              fallbackHeight: 250,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10000,
              (context, index) {
                log("Item $index");
                return Container(
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Text(
                    '${index + 1}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
