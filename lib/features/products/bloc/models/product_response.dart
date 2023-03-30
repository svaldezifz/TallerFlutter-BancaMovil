import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:banca_movil_app/features/products/bloc/models/product.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends Equatable {
  final ProductResponseMetadata metadata;
  final List<Product> data;

  const ProductResponse({
    required this.metadata,
    required this.data,
  });

  @override
  List<Object?> get props => [metadata, data];

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductResponseMetadata extends Equatable {
  final int currentPage;
  final int totalProducts;
  final int? prevPage;
  final int? nextPage;
  final int totalPages;

  const ProductResponseMetadata({
    required this.currentPage,
    required this.totalProducts,
    this.prevPage,
    this.nextPage,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [
        currentPage,
        totalProducts,
        prevPage,
        nextPage,
        totalPages,
      ];

  factory ProductResponseMetadata.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseMetadataToJson(this);
}
