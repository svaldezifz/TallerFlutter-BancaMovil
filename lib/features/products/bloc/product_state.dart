part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final int currentPage;
  final bool isLastPage;
  final bool isLoadingProducts;

  const ProductState({
    this.products = const [],
    this.currentPage = 1,
    this.isLastPage = false,
    this.isLoadingProducts = false,
  });

  @override
  List<Object?> get props => [products, currentPage, isLastPage, isLoadingProducts];

  ProductState copyWith({
    List<Product>? products,
    int? currentPage,
    bool? isLastPage,
    bool? isLoadingProducts,
  }) {
    return ProductState(
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
    );
  }
}
