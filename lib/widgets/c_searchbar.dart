import 'package:flutter/material.dart';
import 'c_text_field.dart';

class CustomSearchBar extends StatefulWidget {
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
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextField(
          hint: widget.hint,
          focusNode: _focusNode, // 👈 pass focus node
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          onEditingComplete: () {
            formKey.currentState?.save();
          },
          onSave: (value) {
            widget.onSave(value);
          }),
    );
  }
}
