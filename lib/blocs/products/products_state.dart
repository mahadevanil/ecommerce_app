part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.productList,
    this.loadingStatus,
    this.selectedId,
    this.isItemSelected,
  });
  final List<ProductsModel>? productList;
  final String? selectedId;
  final LoadingStatus? loadingStatus;
  final bool? isItemSelected;
  ProductsState copyWith({
    List<ProductsModel>? productList,
    LoadingStatus? loadingStatus,
    String? selectedId,
    bool? isItemSelected,
  }) {
    return ProductsState(
      productList: productList ?? this.productList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      selectedId: selectedId ?? this.selectedId,
      isItemSelected: isItemSelected ?? this.isItemSelected,
    );
  }

  @override
  List<Object> get props => [
        productList ?? [],
        loadingStatus ?? LoadingStatus.initial,
        selectedId ?? '-1',
        isItemSelected ?? false,
      ];
}
