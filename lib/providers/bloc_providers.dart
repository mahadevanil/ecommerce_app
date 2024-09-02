// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapidor/blocs/cart/cart_bloc.dart';
import 'package:rapidor/blocs/product-detail/product_detail_bloc.dart';

import '../blocs/products/products_bloc.dart';
import '../blocs/splash/splash_bloc.dart';

List<SingleChildWidget> blocProviderList = [
  //!---------(splash bloc)
  BlocProvider(
    create: (context) => SplashBloc()
      ..add(
        const SplashInit(),
      ),
  ),
  //!---------(products bloc)
  BlocProvider(
    create: (context) => ProductsBloc()
      ..add(
        const ProductsInit(),
      ),
  ),
  //!---------(products bloc)
  BlocProvider(create: (context) => ProductDetailBloc()),
  //!---------(cart bloc)
  BlocProvider(
      create: (context) => CartBloc()
        ..add(
          const CartInit(),
        )),
];
