import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;

  const User({
    required this.name,
    required this.email,
  });

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is User &&
  //         runtimeType == other.runtimeType &&
  //         name == other.name &&
  //         email == other.email;

  // @override
  // int get hashCode => name.hashCode ^ email.hashCode;

  @override
  List<Object?> get props => [name, email];
}
