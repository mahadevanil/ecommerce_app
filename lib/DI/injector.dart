import 'package:rapidor/data/repositories/cart.repo.dart';
import 'package:rapidor/data/repositories/products.repo.dart';
import 'package:rapidor/data/services/cart_services.dart';
import 'package:rapidor/data/services/products_service.dart';

import '../main.dart';

autoInjectInitializer() {
  //!------- (products)
  autoInjector.add(ProductsService.new);
  autoInjector.add(ProductsRepo.new);
  //!------- (cart)
  autoInjector.add(CartServices.new);
  autoInjector.add(CartRepo.new);

  autoInjector.commit();
}
