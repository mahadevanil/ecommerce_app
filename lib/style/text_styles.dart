import 'package:flutter/material.dart';
import 'package:rapidor/style/font_styles.dart';

import 'colors.dart';

class KStyles {
//!-----------(light)--------------
  Text light(
      {required String text,
      Color color = AppColors.black,
      double? height,
      bool? softWrap,
      required double size,
      int? maxLines,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: FontConst.poppins,
        height: height,
        color: color,
        fontWeight: FontConst().lightFont,
      ),
    );
  }

//!------------(reg)--------------
  Text reg(
      {required String text,
      Color color = AppColors.black,
      double? height,
      bool? softWrap,
      required double size,
      int? maxLines,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: FontConst.poppins,
        height: height,
        color: color,
        fontWeight: FontConst().regularFont,
      ),
    );
  }

//!-------------(med)-------------------
  Text med(
      {required String text,
      Color color = AppColors.black,
      double? height,
      bool? softWrap,
      required double size,
      int? maxLines,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: FontConst.poppins,
        height: height,
        color: color,
        fontWeight: FontConst().mediumFont,
      ),
    );
  }

//!-------------(semibold)------------
  Text semiBold(
      {required String text,
      Color color = AppColors.black,
      double? height,
      bool? softWrap,
      required double size,
      int? maxLines,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: FontConst.poppins,
        height: height,
        color: color,
        fontWeight: FontConst().semiBoldFont,
      ),
    );
  }

//!-------------(bold)------------------
  Text bold(
      {required String text,
      Color color = AppColors.black,
      double? height,
      bool? softWrap,
      required double size,
      int? maxLines,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: FontConst.poppins,
        height: height,
        color: color,
        fontWeight: FontConst().boldFont,
      ),
    );
  }

//!---------------(black)-------------------------
  Text black(
      {required String text,
      Color color = AppColors.black,
      double? height,
      bool? softWrap,
      required double size,
      int? maxLines,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: FontConst.poppins,
        height: height,
        color: color,
        fontWeight: FontConst().blackFont,
      ),
    );
  }
}
