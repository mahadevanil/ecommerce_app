part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

final class ProductDetailInit extends ProductDetailEvent {
  const ProductDetailInit({
    required this.id,
  });
  final String id;
}

final class SizeSelect extends ProductDetailEvent {
  const SizeSelect({
    required this.index,
  });
  final int index;
}
