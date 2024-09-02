// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

class CartModel {
  String? id;
  String? userId;
  String? date;
  List<Product>? products;

  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"].toString(),
        userId: json["userId"].toString(),
        date: json["date"].toString(),
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );
}

class Product extends Equatable {
  final String? productId;
  final String? quantity;

  const Product({
    this.productId,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"].toString(),
        quantity: json["quantity"].toString(),
      );

  @override
  List<Object?> get props => [
        productId,
        quantity,
      ];
}
