import 'dart:async';
import 'package:flutter/material.dart';
import 'c_text_field.dart';

class CustomSearchBar extends StatefulWidget {
  final String hint;
  final Function(String)? onChanged;
  final Icon? prefixIcon, suffixIcon;

  const CustomSearchBar({
    super.key,
    required this.hint,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Timer? _debounce;

  void _onTextChanged(String? value) {
    // Cancel previous timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Start new timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (widget.onChanged != null && value != null) {
        widget.onChanged!(value);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: widget.hint,
      onChanged: _onTextChanged,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      onSave: (String? p1) {
        FocusScope.of(context).unfocus();
        widget.onChanged!(p1 ?? '');
      },
    );
  }
}
