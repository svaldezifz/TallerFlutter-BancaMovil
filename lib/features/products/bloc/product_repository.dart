import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:banca_movil_app/features/products/bloc/models/product.dart';

class ProductRepository {
  final String baseUrl = 'https://api.storerestapi.com/products';

  FutureOr<Either<GetProductException, List<Product>?>> getProductPage({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await http.get(Uri.parse(baseUrl));
    debugPrint(response.body);
    if (response.statusCode != HttpStatus.ok) {
      return Left(GetProductException());
    }
    final responseAsMap = jsonDecode(utf8.decode(response.bodyBytes));
    final Iterable list = responseAsMap['data'];

    List<Product> products = list.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
    return Right(products);
  }
}

class GetProductException implements Exception {}
