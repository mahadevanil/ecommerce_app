import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../style/colors.dart';
import '../../style/text_styles.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    this.onTap,
  });
  final String image;
  final String title;
  final String category;
  final String price;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: kDim.kRadius15,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: const Offset(0, 2), // changes position of shadow (x, y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: image,
                ),
              ),
              kDim.kGap10,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      KStyles().semiBold(
                        text: title,
                        size: 14,
                      ),
                      KStyles().reg(
                        text: category,
                        size: 11,
                        color: AppColors.textGrey,
                      ),
                      KStyles().semiBold(
                        text: price,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
