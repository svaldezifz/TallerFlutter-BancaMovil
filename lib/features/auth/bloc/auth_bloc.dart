import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:banca_movil_app/features/auth/bloc/models/user.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  void _onSignInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSigningIn: true));
    // await Future.delayed(const Duration(seconds: 2));
    if (state.email.isEmpty) {
      // emailError = 'E-mail is required';
      emit(state.copyWith(
        emailError: InputError.empty,
      ));
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(state.email)) {
      // emailError = 'E-mail is invalid';
      emit(state.copyWith(
        emailError: InputError.invalid,
      ));
    }
    if (state.password.isEmpty) {
      // emailError = 'E-mail is required';
      emit(state.copyWith(
        passwordError: InputError.empty,
      ));
    }
    if (state.emailError != InputError.none || state.passwordError != InputError.none) {
      return;
    }

    emit(state.copyWith(
      user: User(
        name: 'Sandy',
        email: state.email,
      ),
      isSigningIn: false,
      authStatus: AuthStatus.signedIn,
    ));
    log('Login successful');
  }

  void _onEmailChangedEvent(EmailChangedEvent event, Emitter<AuthState> emit) {
    if (state.emailError != InputError.none) {
      emit(state.copyWith(emailError: InputError.none));
    }
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChangedEvent(PasswordChangedEvent event, Emitter<AuthState> emit) {
    if (state.passwordError != InputError.none) {
      emit(state.copyWith(passwordError: InputError.none));
    }
    emit(state.copyWith(password: event.password));
  }

  void _onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {}

  void _onSignOutEvent(SignOutEvent event, Emitter<AuthState> emit) async {
    // emit(state.copyWith(authStatus: AuthStatus.signedOut));
  }
}
