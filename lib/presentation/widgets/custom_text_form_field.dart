import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.onSubmitted,
    required this.hintText,
    required this.prefixIcon,
    @required this.suffixIcon,
    required this.keyboardType,
    required this.obscureText,
    required this.controller,
    this.validator,
  }) : super(key: key);
  final Function(String) onSubmitted;
  final String hintText;
  final Icon prefixIcon;
  Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        suffix: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
