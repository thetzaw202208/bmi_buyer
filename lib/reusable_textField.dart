
import 'package:flutter/material.dart';

import 'const/color.dart';
import 'const/dimen.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {super.key,
        this.textEditingController,
        this.inputDecoration,
        this.isEnabled,
        this.obs,
        this.max,
        this.maxLength,
        this.height,
        this.onChanged,
        this.keyboardType,
        this.hintText,
        this.suffixIcon,
        this.prefixIcon,
        this.prefixText,
        this.borderRadius,
        this.borderColor,
        this.fillColor,
        this.fontWeight,
        this.hintColor,
        this.textInputAction,
        this.autoFocus,
        this.onSubmitted});

  final TextEditingController? textEditingController;
  final InputDecoration? inputDecoration;
  final bool? isEnabled;
  final bool? obs;
  final int? max;
  final int? maxLength;
  final TextInputType? keyboardType;
  final double? height;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefixText;
  final double? borderRadius;
  final Color? borderColor;
  final Color? fillColor;
  final FontWeight? fontWeight;
  final Color? hintColor;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      child: TextField(
        onSubmitted: onSubmitted,
        textInputAction: textInputAction ?? TextInputAction.done,
        style: const TextStyle(fontWeight: FontWeight.bold),
        maxLength: maxLength,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: textEditingController,
        maxLines: max ?? 1,
        obscureText: obs ?? false,
        textAlign: TextAlign.left,
        onChanged: onChanged,
        autofocus: autoFocus ?? false,
        enabled: isEnabled ?? true,
        cursorColor: kSecondaryColor,
        decoration: inputDecoration ??
            InputDecoration(
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefix: prefixText,
              fillColor: fillColor ?? kPrimaryColor,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? kPrimaryColor,
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? kSmallBorderRadius)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? kPrimaryColor,
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? kSmallBorderRadius)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? kPrimaryColor,
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? kSmallBorderRadius)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? kPrimaryColor,
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? kSmallBorderRadius)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? kPrimaryColor,
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? kSmallBorderRadius)),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: hintColor ?? kHintTextColor,
                  fontWeight: fontWeight ?? FontWeight.normal),
            ),
      ),
    );
  }
}
