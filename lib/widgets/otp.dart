import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ext/context_extension.dart';

class OTPFields extends StatefulWidget {
  final int otpLength;
  final ValueChanged<String> onChanged;

  const OTPFields({super.key, this.otpLength = 6, required this.onChanged});

  @override
  State<OTPFields> createState() => _OTPFieldsState();
}

class _OTPFieldsState extends State<OTPFields> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChange(String value) {
    String filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (filtered.length > widget.otpLength) {
      filtered = filtered.substring(0, widget.otpLength);
    }
    _controller.value = TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
    widget.onChanged(filtered);
    setState(() {}); // Refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Add this wrapper
      textDirection: TextDirection.ltr, // Force LTR direction
      child: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(widget.otpLength, (index) {
                    String digit = "";
                    if (index < _controller.text.length) {
                      digit = _controller.text[index];
                    }

                    return _buildOtpBox(
                      digit,
                      isActive: index == _controller.text.length,
                    );
                  }),
                ),
                // Invisible TextField for actual input
                Opacity(
                  opacity: 0,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    maxLength: widget.otpLength,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: _handleTextChange,
                    autofocus: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(String digit, {bool isActive = false}) {
    return Container(
      width: 48,
      height: 56,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              isActive ? context.colorScheme.secondary : Colors.grey.shade400,
          width: 1,
        ),
        color: Colors.grey.shade100,
      ),
      child: Text(
        digit.isEmpty ? "" : digit,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
