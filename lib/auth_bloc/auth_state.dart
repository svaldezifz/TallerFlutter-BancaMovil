part of 'auth_bloc.dart';

enum AuthStatus {
  signedIn,
  signedOut,
}

class AuthState extends Equatable {
  final User? user;
  final bool isSigningIn;
  final AuthStatus authStatus;

  const AuthState({
    this.user,
    this.isSigningIn = false,
    this.authStatus = AuthStatus.signedOut,
  });

  AuthState copyWith({
    User? user,
    bool? isSigningIn,
    AuthStatus? authStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      isSigningIn: isSigningIn ?? this.isSigningIn,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  List<Object?> get props => [
        user,
        isSigningIn,
        authStatus,
      ];
}
