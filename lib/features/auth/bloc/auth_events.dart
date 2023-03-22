part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {}

class EmailChangedEvent extends AuthEvent {
  final String email;

  EmailChangedEvent({
    required this.email,
  });
}

class PasswordChangedEvent extends AuthEvent {
  final String password;

  PasswordChangedEvent({
    required this.password,
  });
}

class SignOutEvent extends AuthEvent {}
