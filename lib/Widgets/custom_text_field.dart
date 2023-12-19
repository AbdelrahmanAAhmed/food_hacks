import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.hintText, this.prefixIcon, this.onChanged});

  final String hintText;
  final prefixIcon;

  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field Is Required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
