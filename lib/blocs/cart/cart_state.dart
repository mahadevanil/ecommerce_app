part of 'cart_bloc.dart';

final class CartState extends Equatable {
  const CartState({
    this.loadingStatus,
    this.cartList,
    this.total,
  });
  final LoadingStatus? loadingStatus;
  final List<CartItemModel>? cartList;
  final num? total;
  @override
  List<Object> get props => [
        loadingStatus ?? LoadingStatus.initial,
        cartList ?? [],
        total ?? 0,
      ];
  CartState copyWith({
    LoadingStatus? loadingStatus,
    List<CartItemModel>? cartList,
    num? total,
  }) {
    return CartState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      cartList: cartList ?? this.cartList,
      total: total ?? this.total,
    );
  }
}
