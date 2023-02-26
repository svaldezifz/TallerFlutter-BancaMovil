import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:banca_movil_app/auth_bloc/models/user.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  void _onSignInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSigningIn: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      user: User(
        name: 'Sandy',
        email: event.email,
      ),
      isSigningIn: false,
      authStatus: AuthStatus.signedIn,
    ));
  }

  void _onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {}

  void _onSignOutEvent(SignOutEvent event, Emitter<AuthState> emit) async {
    // emit(state.copyWith(authStatus: AuthStatus.signedOut));
  }
}
