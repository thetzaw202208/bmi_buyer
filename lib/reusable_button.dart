
import 'package:bmi_buyer/reusable_text.dart';
import 'package:flutter/material.dart';
import 'const/color.dart';
import 'const/dimen.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton(
      {super.key,
        required this.text,
        this.width,
        this.height,
        this.borderRadius,
        this.onTap,
        this.gradient,
        this.color,
        this.widget,
        this.borderColor,
        this.fontWeight,
        this.textColor});

  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Function()? onTap;
  final Gradient? gradient;
  final Color? color;
  final Color? borderColor;
  final Widget? widget;
  final FontWeight? fontWeight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
              () {
            Navigator.of(context).pop();
          },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                borderRadius ?? kLargeBorderRadius),
            gradient: gradient,
            border: Border.all(
                color:
                borderColor ?? kBackGroundWhiteColor),
            color: color ?? kPrimaryColor),
        width:
        width ?? MediaQuery.of(context).size.width * .4,
        height: height ?? kBtnHeight,
        child: Center(
          child: widget ??
              ReusableText(
                fColor: textColor ?? kTextColor,
                reuseText: text,
                fWeight: fontWeight ?? FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
