import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapidor/blocs/cart/cart_bloc.dart';
import 'package:rapidor/blocs/product-detail/product_detail_bloc.dart';
import 'package:rapidor/constants/route_constants.dart';

import '../../config/config.dart';
import '../../constants/string_constants.dart';
import '../../gen/assets.gen.dart';
import '../../style/colors.dart';
import '../../style/text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KStyles().reg(
                    text: StringConst.totalPrice,
                    size: 9,
                    color: AppColors.textGrey,
                  ),
                  KStyles().bold(
                    text:
                        '\$${state.product?.price?.toStringAsFixed(2) ?? '0.00'}',
                    size: 18,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: uiCon.rapidorButton(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    uiCon.svgIcon(
                      ht: 15,
                      wd: 15,
                      assetImage: Assets.icons.cart,
                      color: Colors.white,
                    ),
                    kDim.kGap10,
                    KStyles().semiBold(
                      text: state.isAlreadyInCart ?? false
                          ? 'Go to Cart'
                          : StringConst.addToCart,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ],
                ),
                color: AppColors.black,
                height: 50,
                onPressed: () {
                  if (!(state.isAlreadyInCart ?? true)) {
                    context.read<CartBloc>().add(
                          AddToCartEvent(
                            productId: state.product?.id.toString() ?? '0',
                          ),
                        );
                  } else {
                    context.pushNamed(RouteConstants.name.cart);
                  }
                },
                borderRadius: kDim.kRadius30,
              ),
            )
          ],
        );
      },
    );
  }
}
