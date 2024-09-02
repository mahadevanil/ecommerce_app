part of 'cart_bloc.dart';

final class CartState extends Equatable {
  const CartState({
    this.loadingStatus,
    this.cartData,
  });
  final LoadingStatus? loadingStatus;
  final CartModel? cartData;
  @override
  List<Object> get props => [
        loadingStatus ?? LoadingStatus.initial,
        cartData ?? CartModel(),
      ];
  CartState copyWith({
    LoadingStatus? loadingStatus,
    CartModel? cartData,
  }) {
    return CartState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      cartData: cartData ?? this.cartData,
    );
  }
}
