import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rapidor/data/models/add_to_cart.model.dart';
import 'package:rapidor/data/repositories/cart.repo.dart';
import 'package:rapidor/utils/enums.dart';

import '../../main.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo cartRepo = autoInjector.get<CartRepo>();
  CartBloc() : super(const CartState()) {
    on<CartInit>(onCartInit);
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

      emit(state.copyWith(
        loadingStatus: LoadingStatus.success,
        cartData: cartResp,
      ));
    } on Exception catch (_) {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.failure,
      ));
    }
  }
}
