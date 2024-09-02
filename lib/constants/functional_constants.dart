import 'package:intl/intl.dart';
import 'package:rapidor/data/models/products.model.dart';

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
}
