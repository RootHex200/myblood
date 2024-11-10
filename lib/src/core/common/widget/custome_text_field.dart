import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myblood/src/core/utils/colors.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    required this.inputType,
    required this.hintText,
    required this.onChanged,
    required this.onSubmitted,
    this.prefixIcon,
    this.maxLine,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.controller,
    this.errorText,
  });

  final TextInputType inputType;
  final String hintText;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final Icon? prefixIcon;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign,
      keyboardType: inputType,
      maxLines: maxLine,
      inputFormatters: inputFormatters,
      style: const TextStyle(color: Colors.red),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          errorText: errorText,
          errorStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          suffixIcon: suffixIcon,
          fillColor: whiteColor,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 20, color: Colors.red),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          )),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
