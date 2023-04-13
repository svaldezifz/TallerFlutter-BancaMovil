import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:banca_movil_app/common/screens/home_screen.dart';
import 'package:banca_movil_app/features/auth/bloc/auth_bloc.dart';

class LoginScreenV2 extends StatefulWidget {
  static const String screenName = 'loginScreen';

  const LoginScreenV2({super.key});

  @override
  State<LoginScreenV2> createState() => _LoginScreenV2State();
}

class _LoginScreenV2State extends State<LoginScreenV2> {
  late final TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleSignUp;
  }

  void _handleLogin() {
    BlocProvider.of<AuthBloc>(context).add(SignInEvent());

    // Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.screenName, (route) => false);
  }

  void _handleSignUp() {
    log('SIGN UP');
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'GIMME',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black12,
        child: Stack(
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
            Container(
              height: screenHeight * 0.60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, kToolbarHeight + 20, 30, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 30,
                        ),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Login Screen',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return TextField(
                                  key: const Key('EmailTextField'),
                                  decoration: InputDecoration(
                                    label: const Text('E-mail'),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                    ),
                                    errorText: state.emailError != InputError.none
                                        ? state.emailError.name
                                        : null,
                                  ),
                                  onChanged: (String email) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(EmailChangedEvent(email: email));
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                              return TextField(
                                key: const Key('PasswordTextField'),
                                obscureText: true,
                                decoration: InputDecoration(
                                  label: const Text('Password'),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.blue,
                                  ),
                                  errorText: state.passwordError != InputError.none
                                      ? state.passwordError.name
                                      : null,
                                ),
                                onChanged: (String password) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(PasswordChangedEvent(password: password));
                                },
                              );
                            }),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  print('FORGOT PASSWORD');
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                              return TextButton(
                                onPressed: state.emailError != InputError.none ||
                                        state.passwordError != InputError.none
                                    ? null
                                    : _handleLogin,
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 20,
                                    ),
                                  ),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                                    if (states.contains(MaterialState.disabled)) {
                                      return Colors.grey;
                                    }
                                    return Colors.blue;
                                  }),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith((states) => Colors.white),
                                ),
                                child: const Text('Login'),
                              );
                            }),
                            const SizedBox(height: 20),
                            const Text(
                              '- OR -',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                print('GOOGLE LOGIN');
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(15),
                              ),
                              child: const Icon(
                                Icons.g_mobiledata,
                                color: Colors.white,
                                size: 45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Don\'t have an Account? ',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            recognizer: _tapGestureRecognizer,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
