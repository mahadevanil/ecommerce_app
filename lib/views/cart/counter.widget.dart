import 'package:flutter/material.dart';
import 'package:rapidor/style/colors.dart';
import 'package:rapidor/style/text_styles.dart';

import '../../config/config.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    this.onDecrement,
    this.onIncrement,
    required this.counterValue,
  });
  final void Function()? onDecrement;
  final void Function()? onIncrement;
  final String counterValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.2),
        borderRadius: kDim.kRadius20,
      ),
      height: 30,
      width: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: InkWell(
              onTap: onDecrement,
              child: const Icon(
                Icons.remove,
                size: 20,
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: KStyles().reg(
                text: counterValue,
                size: 14,
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: onIncrement,
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
