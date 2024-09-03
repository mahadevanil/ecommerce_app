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

final class DecrementCounter extends CartEvent {
  const DecrementCounter({
    required this.index,
  });
  final int index;
}

final class IncrementCounter extends CartEvent {
  const IncrementCounter({
    required this.index,
  });
  final int index;
}

final class RemoveItem extends CartEvent {
  const RemoveItem({
    required this.index,
  });
  final int index;
}
