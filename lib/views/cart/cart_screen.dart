import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapidor/blocs/cart/cart_bloc.dart';
import 'package:rapidor/config/config.dart';
import 'package:rapidor/style/text_styles.dart';
import 'package:rapidor/utils/enums.dart';

import '../../constants/string_constants.dart';
import '../../style/colors.dart';
import 'item_tile.widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartBloc>().add(const CartInit());
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: uiCon.backButton(
            onPressed: () {
              context.pop();
            },
            context: context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kDim.kGap25,
            KStyles().bold(
              text: StringConst.myCart,
              size: 18,
            ),
            kDim.kGap20,
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return state.loadingStatus == LoadingStatus.loading
                    ? Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * .5,
                        child: const CircularProgressIndicator(),
                      )
                    : (state.cartList?.isNotEmpty ?? false)
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemCount: state.cartList?.length ?? 0,
                            separatorBuilder: (context, index) => kDim.kGap10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ItemTile(
                                  subTitle:
                                      state.cartList?[index].subTitle ?? "",
                                  imageUrl: state.cartList?[index].image ?? "",
                                  onSlide: (p0) {
                                    log("message");
                                    context
                                        .read<CartBloc>()
                                        .add(RemoveItem(index: index));
                                  },
                                  onTap: () {},
                                  price: state.cartList?[index].price
                                          .toStringAsFixed(3) ??
                                      "",
                                  title: state.cartList?[index].title ?? "",
                                  onDecrement: () {
                                    context
                                        .read<CartBloc>()
                                        .add(DecrementCounter(index: index));
                                  },
                                  counterValue: state.cartList?[index].quantity
                                          .toString() ??
                                      "",
                                  onIncrement: () {
                                    context
                                        .read<CartBloc>()
                                        .add(IncrementCounter(index: index));
                                  },
                                ),
                              );
                            })
                        : Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .5,
                            child: KStyles().med(
                              text: "Cart is empty",
                              size: 14,
                            ),
                          );
              },
            ),
            const Spacer(),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KStyles().semiBold(
                          text: 'Total (${state.cartList?.length ?? 0}):',
                          size: 14,
                          color: AppColors.textGrey,
                        ),
                        KStyles().semiBold(
                          text: '\$${state.total ?? 0}',
                          size: 20,
                        ),
                      ],
                    ),
                    kDim.kGap20,
                    uiCon.rapidorButton(
                      width: double.infinity,
                      borderRadius: kDim.kRadius15,
                      height: 50,
                      child: KStyles().semiBold(
                        text: "Proceed To Checkout",
                        color: AppColors.white,
                        size: 16,
                      ),
                      color: AppColors.black,
                      onPressed: () {},
                    )
                  ],
                );
              },
            ),
            kDim.kGap20,
          ],
        ),
      ),
    );
  }
}
