// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      metadata: ProductResponseMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'data': instance.data,
    };

ProductResponseMetadata _$ProductResponseMetadataFromJson(
        Map<String, dynamic> json) =>
    ProductResponseMetadata(
      currentPage: json['currentPage'] as int,
      totalProducts: json['totalProducts'] as int,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$ProductResponseMetadataToJson(
        ProductResponseMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalProducts': instance.totalProducts,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
      'totalPages': instance.totalPages,
    };
