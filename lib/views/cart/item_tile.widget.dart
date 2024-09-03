import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rapidor/config/config.dart';
import 'package:rapidor/style/text_styles.dart';

import '../../style/colors.dart';
import 'counter.widget.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.onTap,
    required this.onSlide,
    required this.imageUrl,
    required this.title,
    required this.counterValue,
    required this.price,
    required this.subTitle,
    required this.onDecrement,
    required this.onIncrement,
  });
  final Function(BuildContext)? onSlide;
  final void Function()? onTap;
  final void Function()? onDecrement;
  final void Function()? onIncrement;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;
  final String counterValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onSlide,
                icon: Icons.delete,
                backgroundColor: AppColors.black,
                borderRadius: kDim.kRadius20,
              )
            ],
          ),
          child: _bodyContent(),
        ));
  }

  Container _bodyContent() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 25,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            spreadRadius: 5,
            blurRadius: 10,
            color: AppColors.grey.withOpacity(0.2),
          )
        ],
        color: AppColors.white,
        borderRadius: kDim.kRadius20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 75,
            width: 75,
            child: Image.asset(imageUrl),
          ),
          kDim.kGap05,
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KStyles().semiBold(
                        text: title,
                        size: 14,
                      ),
                      kDim.kGap05,
                      KStyles().reg(
                        text: subTitle,
                        size: 11,
                      ),
                    ],
                  ),
                  KStyles().bold(
                    text: '\$ $price',
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 75,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Counter(
                  counterValue: counterValue,
                  onDecrement: onDecrement,
                  onIncrement: onIncrement,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
