import 'package:flutter/material.dart';
import 'c_text_field.dart';

class CustomSearchBar extends StatefulWidget {
  final String hint;
  final Function(String?) onSave;

  const CustomSearchBar({
    super.key,
    required this.hint,
    required this.onSave,
  });

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextField(
          hint: widget.hint,
          onEditingComplete: () {
            formKey.currentState?.save();
          },
          onSave: (value) {
            widget.onSave(value);
          }),
    );
  }
}
