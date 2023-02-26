import 'package:flutter/material.dart';

import 'package:banca_movil_app/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:banca_movil_app/auth_bloc/auth_bloc.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String screenName = 'loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        children: [
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previousState, currentState) {
              if (previousState.authStatus == AuthStatus.signedOut &&
                  currentState.authStatus == AuthStatus.signedIn) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              print(state.user);
              if (state.authStatus == AuthStatus.signedIn) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(HomeScreen.screenName, (route) => false);
              }
            },
            child: const SizedBox(),
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              label: Text('Email'),
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.isSigningIn) {
                return const CircularProgressIndicator();
              }
              return const SizedBox();
            },
          ),
          CustomButton(
            text: 'Sign In',
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(
                SignInEvent(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
              BlocProvider.of<AuthBloc>(context).add(
                SignInEvent(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
              // context.read<AuthBloc>().add(
              //       SignInEvent(
              //         email: _emailController.text,
              //         password: _passwordController.text,
              //       ),
              //     );
            },
          ),
        ],
      ),
    );
  }
}
