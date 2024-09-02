import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapidor/blocs/product-detail/product_detail_bloc.dart';

import '../../config/config.dart';
import '../../style/colors.dart';
import '../../style/text_styles.dart';
import 'add_to_cart_button.widget.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> size = ["S", 'M', 'L', 'XL', 'XXL'];
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KStyles().semiBold(
                        overflow: TextOverflow.visible,
                        text: state.product?.title ?? "",
                        size: 18,
                      ),
                      kDim.kGap10,
                      KStyles().reg(
                        color: AppColors.textGrey,
                        overflow: TextOverflow.visible,
                        text: state.product?.category ?? "",
                        size: 11,
                      ),
                    ],
                  ),
                  KStyles().semiBold(
                    overflow: TextOverflow.visible,
                    text: 'Size',
                    size: 18,
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        return InkWell(
                          onTap: () {
                            context.read<ProductDetailBloc>().add(SizeSelect(
                                  index: index,
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              color: state.sizeIndex == index
                                  ? Colors.black
                                  : AppColors.white,
                              borderRadius: kDim.kRadius100,
                            ),
                            child: KStyles().med(
                              color: state.sizeIndex == index
                                  ? Colors.white
                                  : AppColors.black,
                              text: size[index],
                              size: 14,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  KStyles().semiBold(
                    overflow: TextOverflow.visible,
                    text: 'Description',
                    size: 18,
                  ),
                  KStyles().reg(
                    color: AppColors.textGrey,
                    overflow: TextOverflow.visible,
                    text: state.product?.description ?? "",
                    size: 11,
                  ),
                  kDim.kGap10,
                ],
              ),
            ),
            kDim.kGap25,
            AddToCartButton(),
            kDim.kGap25,
          ],
        );
      },
    );
  }
}
