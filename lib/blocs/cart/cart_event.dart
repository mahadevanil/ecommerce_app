part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddToCartEvent extends CartEvent {
  const AddToCartEvent({
    required this.productId,
  });
  final String productId;
}

final class CartInit extends CartEvent {
  const CartInit();
}
