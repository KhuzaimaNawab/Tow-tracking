// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obsureText;
  final Widget icon;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.keyboardType,
    this.obsureText = false,
    required this.icon,
    required this.hintText,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obsureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        prefixIcon: icon,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
