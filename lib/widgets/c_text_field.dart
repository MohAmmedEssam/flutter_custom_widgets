import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final bool isSecured;
  final String hint;
  final Function(String?) onSave;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final String? initialValue;
  final Icon? prefixIcon, suffixIcon;
  final Color? backgroundColor;
  final Color? placeholderColor;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.onSave,
    this.validator,
    this.onEditingComplete,
    this.isSecured = false,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.placeholderColor,
    this.keyboardType,
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
    final theme = context.theme;
    final defaultBackground =
        widget.backgroundColor ?? theme.colorScheme.surface;
    final defaultPlaceholder = widget.placeholderColor ?? Colors.grey;

    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      onSaved: widget.onSave,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      obscureText: _isObscured,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(color: theme.colorScheme.onSurface),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: defaultBackground,
        labelText: widget.hint.tr,
        hintText: "${'Enter'.tr} ${widget.hint.tr}",
        hintStyle: TextStyle(color: defaultPlaceholder),
        labelStyle: TextStyle(color: defaultPlaceholder),
        prefixIcon: widget.prefixIcon,
        suffixIcon: (widget.suffixIcon) ??
            (widget.isSecured
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    child: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: defaultPlaceholder,
                    ),
                  )
                : null),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith(
          (Set<WidgetState> states) {
            final Color color = states.contains(WidgetState.error)
                ? theme.colorScheme.error
                : theme.colorScheme.primary;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
        errorStyle: TextStyle(color: theme.colorScheme.error),
      ),
    );
  }
}
