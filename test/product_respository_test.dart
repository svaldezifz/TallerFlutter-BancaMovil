import 'dart:io';

import 'package:banca_movil_app/features/products/bloc/models/product_response.dart';
import 'package:banca_movil_app/features/products/bloc/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'product_respository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('testProductRepository', () {
    test('returns a Product Page if the http call is successful', () async {
      final producRepository = ProductRepository();
      final client = MockClient();

      when(client.get(Uri.parse('https://${producRepository.baseUrl}/products?page=1&limit=10')))
          .thenAnswer((_) async => http.Response(
              '{"metadata":{"currentPage":1,"totalProducts":20,"nextPage":2,"totalPages":3},"data":[{"_id":"61ab420c0f34753bcedfa787","title":"special cotton shirt for men","price":15,"category":{"_id":"61ab1ca64a0fef3f27dc663f","name":"men\'s fashion","slug":"mens-fashion"},"description":"","createdBy":{"role":"ROLE_CUSTOMER","_id":"612e49b9345dcc333ac6cb41","name":"Sofia Lily"},"createdAt":"2021-12-04T10:25:16.546Z","updatedAt":"2021-12-11T03:14:40.195Z","slug":"special-cotton-shirt-for-men","image":""}],"status":200,"message":"Success"}',
              HttpStatus.ok));

      final response = await producRepository.getProductPage(client: client);
      expect(response.isRight, true);
    });
    test('returns a Exception if the http call is completed with an error', () async {
      final producRepository = ProductRepository();
      final client = MockClient();

      when(client.get(Uri.parse('https://${producRepository.baseUrl}/products?page=1&limit=10')))
          .thenAnswer((_) async => http.Response('Not Found', HttpStatus.notFound));

      final response = await producRepository.getProductPage(client: client);
      expect(response.isLeft, true);
      expect(response.left, isA<GetProductException>());
    });
  });
}
