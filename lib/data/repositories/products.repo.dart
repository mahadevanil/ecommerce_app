import 'package:rapidor/data/models/products.model.dart';
import 'package:rapidor/data/services/products_service.dart';
import 'package:rapidor/main.dart';
import 'package:rapidor/utils/logger.extension.dart';

class ProductsRepo {
  final ProductsService service = autoInjector.get<ProductsService>();
// fetch all products
  Future<List<ProductsModel>> fetchAllProducts() async {
    try {
      final response = await service.fetchAllProducts();

      final List<ProductsModel> model = List<ProductsModel>.from(
          response?.data.map((x) => ProductsModel.fromJson(x)));
      return model;
    } on Exception catch (e) {
      e.logWarn();
      rethrow;
    }
  }

// fetch all products
  Future<ProductsModel> fetchProductDetail({
    required String id,
  }) async {
    try {
      final response = await service.fetchProductDetail(id: id);

      final ProductsModel model = ProductsModel.fromJson(response?.data);
      return model;
    } on Exception catch (e) {
      e.logWarn();
      rethrow;
    }
  }
}
