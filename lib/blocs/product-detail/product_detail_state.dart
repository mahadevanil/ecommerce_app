part of 'product_detail_bloc.dart';

final class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.productId,
    this.loadingStatus,
    this.product,
    this.sizeIndex,
    this.isAlreadyInCart,
    this.addToCartLoading,
  });
  final String? productId;
  final LoadingStatus? loadingStatus;
  final LoadingStatus? addToCartLoading;
  final ProductsModel? product;
  final int? sizeIndex;
  final bool? isAlreadyInCart;
  @override
  List<Object> get props => [
        productId ?? '',
        loadingStatus ?? LoadingStatus.initial,
        addToCartLoading ?? LoadingStatus.initial,
        product ?? ProductsModel(),
        sizeIndex ?? 0,
        isAlreadyInCart ?? false,
      ];
  ProductDetailState copyWith({
    String? productId,
    int? sizeIndex,
    LoadingStatus? loadingStatus,
    LoadingStatus? addToCartLoading,
    ProductsModel? product,
    bool? isAlreadyInCart,
  }) {
    return ProductDetailState(
      productId: productId ?? this.productId,
      sizeIndex: sizeIndex ?? this.sizeIndex,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      product: product ?? this.product,
      isAlreadyInCart: isAlreadyInCart ?? this.isAlreadyInCart,
      addToCartLoading: addToCartLoading ?? this.addToCartLoading,
    );
  }
}
