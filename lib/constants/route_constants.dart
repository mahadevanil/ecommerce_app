class RouteConstants {
  RouteConstants._();
  static const RoutePath path = RoutePath();
  static const RouteName name = RouteName();
}

class RoutePath {
  const RoutePath();
  String get initial => '/';
  String get products => '/products';
  String get productDetail => '/productDetail';
  String get cart => '/cart';
}

class RouteName {
  const RouteName();
  String get initial => '';
  String get products => 'products';
  String get productDetail => 'productDetail';
  String get cart => 'cart';
}
