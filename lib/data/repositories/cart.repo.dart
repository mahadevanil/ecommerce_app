import 'package:rapidor/data/services/cart_services.dart';
import 'package:rapidor/utils/logger.extension.dart';

import '../../main.dart';
import '../models/add_to_cart.model.dart';

class CartRepo {
  final CartServices service = autoInjector.get<CartServices>();
  // add to cart
  Future<CartModel> addToCart({
    required String productId,
  }) async {
    try {
      final response = await service.addToCart(
        productId: productId,
      );

      final CartModel model = CartModel.fromJson(response?.data);
      return model;
    } on Exception catch (e) {
      e.logWarn();
      rethrow;
    }
  }

  // fetch cart
  Future<CartModel> fetchCart() async {
    try {
      final response = await service.fetchCart();

      final CartModel model = CartModel.fromJson(response?.data);
      return model;
    } on Exception catch (e) {
      e.logWarn();
      rethrow;
    }
  }
}
