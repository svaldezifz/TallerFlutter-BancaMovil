part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final int currentPage;
  final bool isLoadingProducts;

  const ProductState({
    this.products = const [],
    this.currentPage = 1,
    this.isLoadingProducts = false,
  });

  @override
  List<Object?> get props => [products, currentPage, isLoadingProducts];

  ProductState copyWith({
    List<Product>? products,
    int? currentPage,
    bool? isLoadingProducts,
  }) {
    return ProductState(
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
    );
  }
}
