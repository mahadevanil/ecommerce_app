import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../gen/assets.gen.dart';
import '../../style/colors.dart';

class CustomSearchFilter extends StatelessWidget {
  const CustomSearchFilter({
    super.key,
    this.onFilterTap,
    this.onChanged,
  });
  final void Function()? onFilterTap;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SearchBar(
            focusNode: focusNode,
            onChanged: onChanged,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            hintText: 'Search...',
            hintStyle: const WidgetStatePropertyAll(
              TextStyle(
                color: AppColors.grey,
                fontSize: 14,
              ),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
            leading: uiCon.svgIcon(
              ht: 20,
              wd: 20,
              assetImage: Assets.icons.searchIcon,
            ),
            elevation: const WidgetStatePropertyAll(0),
            backgroundColor: const WidgetStatePropertyAll(
              AppColors.lightGrey,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: uiCon.roundButton(
            child: uiCon.svgIcon(
              ht: 40,
              wd: 40,
              assetImage: Assets.icons.filter2,
            ),
            onTap: onFilterTap,
          ),
        ),
      ],
    );
  }
}
