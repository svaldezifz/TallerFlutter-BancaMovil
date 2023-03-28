import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final double price;
  final String? description;
  final DateTime createdAt;
  final Category category;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    required this.createdAt,
    required this.category,
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
  List<Object?> get props => [id, title, price, description, createdAt, category];

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
