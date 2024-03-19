
import 'package:flutter/material.dart';

import 'const/color.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key,
        required this.reuseText,
        this.inputFontFam,
        this.fSize,
        this.fWeight,
        this.fColor,
        this.overflow,
        this.align, this.maxLines});

  final String? reuseText;
  final String? inputFontFam;
  final double? fSize;
  final FontWeight? fWeight;
  final Color? fColor;
  final TextOverflow? overflow;
  final TextAlign? align;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines:maxLines??1,
      reuseText ?? "",

      textAlign: align ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
          color: fColor ?? kTextColor,
          fontSize: fSize ?? 13,
          fontFamily: inputFontFam ?? "PingFangSC",
          fontWeight: fWeight ?? FontWeight.w400),
    );
  }
}
