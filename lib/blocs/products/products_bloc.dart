import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rapidor/data/repositories/products.repo.dart';
import 'package:rapidor/utils/enums.dart';

import '../../data/models/products.model.dart';
import '../../main.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepo productsRepo = autoInjector.get<ProductsRepo>();
  ProductsBloc() : super(const ProductsState()) {
    on<ProductsInit>(onProductInit);
    on<ItemSelect>(onItemSelect);
  }

  FutureOr<void> onItemSelect(ItemSelect event, Emitter<ProductsState> emit) {
    if (event.id != "-1") {
      emit(state.copyWith(
        isItemSelected: true,
        selectedId: event.id,
      ));
    } else {
      emit(state.copyWith(
        isItemSelected: false,
      ));
    }
  }

  FutureOr<void> onProductInit(
    ProductsInit event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(
        const ProductsState(
          isItemSelected: false,
          selectedId: '-1',
          loadingStatus: LoadingStatus.loading,
        ),
      );
      List<ProductsModel> productList = await productsRepo.fetchAllProducts();
      emit(
        state.copyWith(
          productList: productList,
          loadingStatus: LoadingStatus.success,
        ),
      );
    } on Exception catch (_) {
      emit(
        state.copyWith(
          loadingStatus: LoadingStatus.failure,
        ),
      );
    }
  }
}
