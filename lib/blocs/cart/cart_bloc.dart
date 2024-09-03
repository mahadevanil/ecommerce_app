import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rapidor/config/config.dart';
import 'package:rapidor/data/models/add_to_cart.model.dart';
import 'package:rapidor/data/models/cart.model.dart';
import 'package:rapidor/data/repositories/cart.repo.dart';
import 'package:rapidor/utils/enums.dart';

import '../../data/models/cart.model.dart';
import '../../gen/assets.gen.dart';
import '../../main.dart';

part 'cart_event.dart';
part 'cart_state.dart';

List<CartItemModel> cartList = [
  CartItemModel(
    image: Assets.images.bag.path,
    id: 1,
    title: 'Roller Rabbit',
    price: 198.00,
    quantity: 1,
    subTitle: 'Vado Odelle Dress',
  ),
  CartItemModel(
    image: Assets.images.nike.path,
    id: 2,
    title: 'Axel Arigato',
    price: 100,
    quantity: 2,
    subTitle: 'Clean 90 Triole Snakers',
  ),
  CartItemModel(
    image: Assets.images.shoe.path,
    id: 3,
    title: 'Herschel Supply Co.',
    price: 10,
    quantity: 2,
    subTitle: 'Daypack Backpack',
  ),
];

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo cartRepo = autoInjector.get<CartRepo>();
  CartBloc() : super(const CartState()) {
    on<CartInit>(onCartInit);
    on<IncrementCounter>(onIncrement);
    on<DecrementCounter>(onDecrement);
    on<RemoveItem>(onRemoveItem);
  }

  FutureOr<void> onCartInit(
    CartInit event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.loading,
      ));
      CartModel cartResp = await cartRepo.fetchCart();
      final total = fCon.calculateTotal(cartList);
      emit(state.copyWith(
        loadingStatus: LoadingStatus.success,
        cartList: cartList,
        total: total,
      ));
    } on Exception catch (_) {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.failure,
      ));
    }
  }

  FutureOr<void> onIncrement(
    IncrementCounter event,
    Emitter<CartState> emit,
  ) {
    final cartItems = List<CartItemModel>.from(state.cartList ?? []);
    final item = cartItems[event.index];
    cartItems[event.index] = item.copyWith(quantity: item.quantity + 1);

    final total = fCon.calculateTotal(cartItems);

    emit(state.copyWith(cartList: cartItems, total: total));
  }

  FutureOr<void> onDecrement(
    DecrementCounter event,
    Emitter<CartState> emit,
  ) {
    final cartItems = List<CartItemModel>.from(state.cartList ?? []);
    final item = cartItems[event.index];

    if (item.quantity > 0) {
      cartItems[event.index] = item.copyWith(quantity: item.quantity - 1);
    }
    final total = fCon.calculateTotal(cartItems);
    emit(state.copyWith(cartList: cartItems, total: total));
  }

  FutureOr<void> onRemoveItem(
    RemoveItem event,
    Emitter<CartState> emit,
  ) {
    final cartItems = List<CartItemModel>.from(state.cartList ?? []);
    cartItems.removeAt(event.index);
    final total = fCon.calculateTotal(cartItems);
    emit(state.copyWith(
      cartList: cartItems,
      total: total,
    ));
  }
}
