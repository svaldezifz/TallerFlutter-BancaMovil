import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:banca_movil_app/features/products/bloc/models/product_response.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:banca_movil_app/features/products/bloc/models/product.dart';

class ProductRepository {
  final String baseUrl = 'api.storerestapi.com';

  FutureOr<Either<GetProductException, ProductResponse>> getProductPage({
    int page = 1,
    int limit = 10,
  }) async {
    final queryParameters = {
      'page': page.toString(),
      'limit': limit.toString(),
    };
    final uri = Uri.https(
      baseUrl,
      '/products',
      queryParameters,
    );
    final response = await http.get(uri);
    debugPrint(response.body);
    if (response.statusCode != HttpStatus.ok) {
      return Left(GetProductException());
    }
    final responseAsMap = jsonDecode(utf8.decode(response.bodyBytes));

    ProductResponse products = ProductResponse.fromJson(responseAsMap);
    return Right(products);
  }
}

class GetProductException implements Exception {}
