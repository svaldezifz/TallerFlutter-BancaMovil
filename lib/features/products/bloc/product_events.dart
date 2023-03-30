part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProductPageEvent extends ProductEvent {
  final bool isFirstPage;

  GetProductPageEvent({required this.isFirstPage});
}
