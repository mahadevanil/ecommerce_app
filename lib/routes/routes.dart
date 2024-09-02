import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapidor/blocs/products/products_bloc.dart';
import '../constants/route_constants.dart';
import '../views/cart/cart_screen.dart';
import '../views/product-detail/product_detail_screen.dart';
import '../views/product-list/product_list_screen.dart';
import '../views/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    //-------(splash screen)
    GoRoute(
      path: RouteConstants.path.initial,
      builder: (context, state) => const SplashScreen(),
    ),

    //-------(product listing)
    GoRoute(
      path: RouteConstants.path.products,
      name: RouteConstants.name.products,
      builder: (context, state) => const ProductListingScreen(),
    ),
    //-------(cart )
    GoRoute(
      path: RouteConstants.path.cart,
      name: RouteConstants.name.cart,
      builder: (context, state) => const CartScreen(),
    ),
    //-------(product listing)
    GoRoute(
      onExit: (context, state) {
        context.read<ProductsBloc>().add(const ProductsInit());
        return true;
      },
      path: RouteConstants.path.productDetail,
      name: RouteConstants.name.productDetail,
      builder: (context, state) {
        return ProductDetailScreen(
          id: state.uri.queryParameters["id"] ?? "",
        );
      },
    ),
  ],
);
