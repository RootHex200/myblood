import 'package:flutter/material.dart';
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
  });

  final TextInputType inputType;
  final String hintText;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final Icon? prefixIcon;
  final int? maxLine;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      maxLines: maxLine,
      style: const TextStyle(color: Colors.red),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
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
