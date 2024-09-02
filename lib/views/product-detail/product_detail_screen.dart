import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapidor/blocs/product-detail/product_detail_bloc.dart';
import 'package:rapidor/config/config.dart';
import 'package:rapidor/style/colors.dart';
import 'package:rapidor/style/text_styles.dart';
import 'package:rapidor/utils/enums.dart';

import 'product_content.widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailBloc>().add(ProductDetailInit(id: id));
    });

    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
          body: state.loadingStatus == LoadingStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.loadingStatus == LoadingStatus.success
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CachedNetworkImage(
                            imageUrl: state.product?.image ?? "",
                            imageBuilder: (context, imageProvider) {
                              return Image(
                                image: imageProvider,
                                fit: BoxFit.scaleDown,
                              );
                            },
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.scaleDown,
                            scale: 1,
                          ),
                        ),
                        kDim.kGap20,
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10,
                              ),
                              child: ProductContent(),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      child: Center(
                        child: KStyles().med(
                          text: "No data",
                          size: 14,
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
