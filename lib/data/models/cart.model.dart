import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  const CartItemModel({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.quantity,
    required this.id,
  });
  final String title;
  final String subTitle;
  final String image;
  final double price;
  final int quantity;
  final int id;

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        subTitle,
        price,
        image,
        quantity,
        id,
      ];
  CartItemModel copyWith({
    String? title,
    String? subTitle,
    String? image,
    double? price,
    int? quantity,
    int? id,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
    );
  }
}
