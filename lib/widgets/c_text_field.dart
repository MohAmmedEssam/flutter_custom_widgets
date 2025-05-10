import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ext/context_extension.dart';

class CustomTextField extends StatefulWidget {
  final bool isSecured;
  final String hint;
  final Function(String?) onSave;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final String? initialValue;
  final Icon? prefixIcon, suffixIcon;
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
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      onSaved: widget.onSave,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      obscureText: _isObscured,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.hint.tr,
        hintText: "${'Enter'.tr} ${widget.hint.tr}",
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: context.theme.colorScheme.background,
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
                      color: Colors.grey,
                    ),
                  )
                : null),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith(
          (Set<WidgetState> states) {
            final Color color = states.contains(WidgetState.error)
                ? context.theme.colorScheme.error
                : context.primaryColor;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
    );
  }
}
