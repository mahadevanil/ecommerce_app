import 'package:flutter/material.dart';
import 'package:rapidor/constants/string_constants.dart';
import 'package:rapidor/style/text_styles.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KStyles().med(
        text: StringConst.comingSoon,
        size: 30,
      ),
    );
  }
}
