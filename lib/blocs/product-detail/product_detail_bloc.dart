import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rapidor/data/models/products.model.dart';
import 'package:rapidor/data/repositories/cart.repo.dart';
import 'package:rapidor/main.dart';
import 'package:rapidor/utils/enums.dart';

import '../../data/models/add_to_cart.model.dart';
import '../../data/repositories/products.repo.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductsRepo productsRepo = autoInjector.get<ProductsRepo>();
  final CartRepo cartRepo = autoInjector.get<CartRepo>();
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<ProductDetailInit>(_onDetailInit);
    on<SizeSelect>(
      (SizeSelect event, Emitter<ProductDetailState> emit) {
        emit(state.copyWith(
          sizeIndex: event.index,
        ));
      },
    );
  }

  FutureOr<void> _onDetailInit(
      ProductDetailInit event, Emitter<ProductDetailState> emit) async {
    emit(const ProductDetailState(
      loadingStatus: LoadingStatus.loading,
    ));
    ProductsModel product = await productsRepo.fetchProductDetail(id: event.id);
    CartModel cartResp = await cartRepo.fetchCart();
    bool productExistsInCart = cartResp.products?.any(
          (element) => element.productId == product.id.toString(),
        ) ??
        false;
    if (productExistsInCart) {
      emit(state.copyWith(isAlreadyInCart: true));
    } else {
      emit(state.copyWith(isAlreadyInCart: false));
    }
    emit(state.copyWith(
      product: product,
      loadingStatus: LoadingStatus.success,
      sizeIndex: 1,
    ));
  }
}
