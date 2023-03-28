import 'package:banca_movil_app/features/products/bloc/product_repository.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:banca_movil_app/features/products/bloc/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_events.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final _productRepo = ProductRepository();

  ProductBloc() : super(const ProductState()) {
    on<GetProductPageEvent>(_onGetProductPageEvent);
  }

  void _onGetProductPageEvent(GetProductPageEvent event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(isLoadingProducts: true));
      final response = await _productRepo.getProductPage(page: state.currentPage);
      print(response);
      if (response is Right) {
        emit(state.copyWith(
          products: response.right,
          isLoadingProducts: false,
        ));
      } else {
        debugPrint('Get product page exception');
      }
    } catch (e) {
      debugPrint('Get product page exception: $e');
    }
  }
}
