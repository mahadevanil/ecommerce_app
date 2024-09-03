import 'package:intl/intl.dart';
import 'package:rapidor/data/models/products.model.dart';

import '../data/models/cart.model.dart';

class FunctionalConstants {
  List<ProductsModel> filterProduct(
    List<ProductsModel> products,
    String query,
  ) {
    List<ProductsModel> filteredProduct = products.where((product) {
      final titleMatch =
          product.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      final categoryMatch =
          product.category?.toLowerCase().contains(query.toLowerCase()) ??
              false;
      return titleMatch || categoryMatch;
    }).toList();

    return filteredProduct;
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  num calculateTotal(List<CartItemModel> cartItems) {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  List<ProductsModel> filterProductsByQuery({
    required List<ProductsModel> products,
    required String query,
  }) {
    if (query.isEmpty) {
      return products;
    }

    return products.where((product) {
      final matchesTitle =
          product.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      final matchesCategory =
          product.category?.toLowerCase().contains(query.toLowerCase()) ??
              false;
      final matchesDescription =
          product.description?.toLowerCase().contains(query.toLowerCase()) ??
              false;

      return matchesTitle || matchesCategory || matchesDescription;
    }).toList();
  }
}
