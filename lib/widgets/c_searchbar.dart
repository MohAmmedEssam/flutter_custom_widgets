import 'package:flutter/material.dart';
import 'c_text_field.dart';

class CustomSearchBar extends StatelessWidget {
  final String hint;
  final Function(String?) onSave;
  final Function(String?)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final Icon? prefixIcon, suffixIcon;
  final bool autoFocus; // 👈 new parameter

  const CustomSearchBar({
    super.key,
    required this.hint,
    required this.onSave,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.autoFocus = false, // 👈 default is false
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        hint: hint,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        onSave: (value) {
          onSave(value);
        });
  }
}
