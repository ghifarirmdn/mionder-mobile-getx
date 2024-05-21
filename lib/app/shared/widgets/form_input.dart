import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/shared/styles/app_colors.dart';

class MyFormInput extends StatelessWidget {
  const MyFormInput({
    super.key,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText,
    this.maxLines,
    this.contentPadding,
    this.textInputAction,
    this.autoFocus,
    this.keyboardType,
    this.readOnly,
    this.onFieldSubmitted,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText ?? false,
      autofocus: autoFocus ?? false,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: black600,
            fontWeight: FontWeight.w600,
          ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: grey100,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: black200,
              fontWeight: FontWeight.w600,
            ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
