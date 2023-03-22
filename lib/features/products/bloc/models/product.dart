import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final double balance;

  const Product({
    required this.name,
    required this.balance,
  });

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Product &&
  //         runtimeType == other.runtimeType &&
  //         name == other.name &&
  //         email == other.email;

  // @override
  // int get hashCode => name.hashCode ^ email.hashCode;

  @override
  List<Object?> get props => [name, balance];
}
