part of 'auth_bloc.dart';

enum AuthStatus {
  signedIn,
  signedOut,
}

enum InputError {
  invalid,
  empty,
  none,
}

class AuthState extends Equatable {
  final User? user;
  final bool isSigningIn;
  final AuthStatus authStatus;
  final InputError emailError;
  final InputError passwordError;
  final String email;
  final String password;

  const AuthState({
    this.user,
    this.isSigningIn = false,
    this.authStatus = AuthStatus.signedOut,
    this.emailError = InputError.none,
    this.passwordError = InputError.none,
    this.email = "",
    this.password = "",
  });

  AuthState copyWith({
    User? user,
    bool? isSigningIn,
    AuthStatus? authStatus,
    InputError? emailError,
    InputError? passwordError,
    String? email,
    String? password,
  }) {
    return AuthState(
      user: user ?? this.user,
      isSigningIn: isSigningIn ?? this.isSigningIn,
      authStatus: authStatus ?? this.authStatus,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.emailError,
      email: email ?? this.email,
      password: password ?? this.email,
    );
  }

  @override
  List<Object?> get props => [
        user,
        isSigningIn,
        authStatus,
        emailError,
        passwordError,
        email,
        password,
      ];
}
