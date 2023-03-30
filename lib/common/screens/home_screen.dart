import 'dart:developer';

import 'package:banca_movil_app/common/widgets/product_card.dart';
import 'package:banca_movil_app/features/products/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:banca_movil_app/features/auth/bloc/auth_bloc.dart';
import 'package:banca_movil_app/features/auth/ui/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductBloc>(context).add(GetProductPageEvent(isFirstPage: true));
    });
  }

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
      body: RefreshIndicator(
        onRefresh: () async {
          log('On REFRESH');
          BlocProvider.of<ProductBloc>(context).add(GetProductPageEvent(isFirstPage: true));
        },
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification scrollInfo) {
            if (scrollInfo.metrics.maxScrollExtent > 0.0 &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              BlocProvider.of<ProductBloc>(context).add(GetProductPageEvent(isFirstPage: false));
              return true;
            }
            return false;
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                collapsedHeight: 150,
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
                  // BlocProvider.of<ProductBloc>(context).add(GetProductPageEvent(isFirstPage: true));
                },
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text("My Products"),
                  titlePadding: const EdgeInsets.all(15.0),
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.products.length,
                      (context, index) {
                        final product = state.products[index];
                        log('PRODUCT INDEX: $index');
                        // if (index + 1 == state.products.length) {
                        //   BlocProvider.of<ProductBloc>(context)
                        //       .add(GetProductPageEvent(isFirstPage: false));
                        // }
                        return ProductCard(
                          product: product,
                          index: index,
                        );
                      },
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state.isLoadingProducts) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state.isLastPage) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('No hay más productos'),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
