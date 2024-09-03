part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.productList,
    this.filterList,
    this.loadingStatus,
    this.selectedId,
    this.isItemSelected,
  });
  final List<ProductsModel>? productList;
  final List<ProductsModel>? filterList;
  final String? selectedId;
  final LoadingStatus? loadingStatus;
  final bool? isItemSelected;
  ProductsState copyWith({
    List<ProductsModel>? productList,
    List<ProductsModel>? filterList,
    LoadingStatus? loadingStatus,
    String? selectedId,
    bool? isItemSelected,
  }) {
    return ProductsState(
      productList: productList ?? this.productList,
      filterList: filterList ?? this.filterList,
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
        filterList ?? []
      ];
}
