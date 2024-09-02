import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapidor/blocs/products/products_bloc.dart';
import 'package:rapidor/config/config.dart';
import 'package:rapidor/constants/route_constants.dart';
import 'package:rapidor/style/colors.dart';
import 'package:rapidor/style/text_styles.dart';
import 'package:rapidor/utils/enums.dart';

import 'item_card.widget.dart';
import 'search_filter.widget.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsBloc>().add(const ProductsInit());
    });
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state.isItemSelected ?? false) {
            context.pushNamed(RouteConstants.name.productDetail,
                queryParameters: {"id": state.selectedId});
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kDim.kGap100,
                  KStyles().bold(
                    text: 'Welcome,',
                    size: 25,
                  ),
                  kDim.kGap05,
                  KStyles().semiBold(
                    color: AppColors.textGrey,
                    text: 'Our Fashions App',
                    size: 20,
                  ),
                  kDim.kGap20,
                  CustomSearchFilter(
                    onFilterTap: () {
                      //Todo : on filter tap
                    },
                  ),
                  state.loadingStatus == LoadingStatus.success
                      ? GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          shrinkWrap: true,
                          children: List.generate(
                            state.productList?.length ?? 0,
                            (index) {
                              var productList = state.productList?[index];
                              return ItemCard(
                                onTap: () {
                                  context.read<ProductsBloc>().add(ItemSelect(
                                        id: productList?.id.toString() ?? "-1",
                                      ));
                                },
                                image: productList?.image ?? "",
                                title: productList?.title ?? "",
                                category: productList?.category ?? "",
                                price: '\$${productList?.price ?? 0}',
                              );
                            },
                          ),
                        )
                      : state.loadingStatus == LoadingStatus.loading
                          ? Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * .5,
                              child: const CircularProgressIndicator(),
                            )
                          : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
