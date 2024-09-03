part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

final class ProductsInit extends ProductsEvent {
  const ProductsInit();
}

final class ItemSelect extends ProductsEvent {
  const ItemSelect({
    required this.id,
  });
  final String id;
}

class FilterProductsByQueryEvent extends ProductsEvent {
  final String query;

  const FilterProductsByQueryEvent(this.query);
}
