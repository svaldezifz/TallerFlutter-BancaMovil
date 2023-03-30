import 'dart:developer';

import 'package:banca_movil_app/features/products/bloc/product_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
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
    on<GetProductPageEvent>(
      _onGetProductPageEvent,
      transformer: droppable(),
    );
  }

  void _onGetProductPageEvent(GetProductPageEvent event, Emitter<ProductState> emit) async {
    try {
      if (event.isFirstPage) {
        emit(state.copyWith(
          products: [],
          isLastPage: false,
        ));
      }

      if (state.isLastPage) {
        log('LAST PAGE REACHED');
        return;
      }
      emit(state.copyWith(isLoadingProducts: true));
      final pageToGet = event.isFirstPage ? 1 : state.currentPage + 1;
      log('GETTING PAGE: $pageToGet');
      final response = await _productRepo.getProductPage(page: pageToGet);
      print(response);
      if (response.isRight) {
        emit(state.copyWith(
          products: state.products + response.right.data,
          isLoadingProducts: false,
          currentPage: pageToGet,
          isLastPage: pageToGet * 10 >= response.right.metadata.totalProducts,
        ));
      } else {
        debugPrint('Get product page exception');
      }
    } catch (e) {
      debugPrint('Get product page exception: $e');
    }
  }
}
