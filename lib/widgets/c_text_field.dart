import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ext/context_extension.dart';

class CustomTextField extends StatefulWidget {
  final bool isSecured;
  final String hint;
  final Function(String?) onSave;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final String? initialValue;
  final Icon? prefixIcon, suffixIcon;
  final TextInputType? keyboardType;
  final FocusNode? focusNode; // 👈 add this

  const CustomTextField({
    super.key,
    required this.hint,
    required this.onSave,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.isSecured = false,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.focusNode, // 👈 add this
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isSecured;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      focusNode: widget.focusNode, // 👈 use it here
      keyboardType: widget.keyboardType,
      onSaved: widget.onSave,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      obscureText: _isObscured,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: context.font(HeaderStyle.h4),
      decoration: InputDecoration(
        filled: true, // ✅ Enable background color
        fillColor: context.theme.colorScheme.surface, // ✅ Field background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 2,
          ),
        ),
        labelText: widget.hint.tr,
        labelStyle: context.font(HeaderStyle.h4).copyWith(color: Colors.grey),
        errorStyle: context.font(HeaderStyle.h5),

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((
          Set<WidgetState> states,
        ) {
          final Color color = states.contains(WidgetState.error)
              ? context.theme.colorScheme.error
              : context.theme.colorScheme.secondary;
          return context.font(HeaderStyle.h3).copyWith(color: color);
        }),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.isSecured
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    child: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  )
                : null),
      ),
    );
  }
}
