import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c_text.dart';
import 'picker.dart';
import '../model/idname.dart';
import '../ext/context_extension.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hint;
  final String? initialValue;
  final List<IdName> options;
  final Function(int, IdName) onChanged;

  const CustomDropdownButton({
    super.key,
    required this.hint,
    required this.options,
    required this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          CustomPicker(
              title: hint,
              data: options,
              onSelect: (index, model) async {
                onChanged(index, model);
              }),
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hint.tr,
          hintText: "${'Enter'.tr} ${hint.tr}",
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: context.colorScheme.background,
          suffixIcon: const Icon(Icons.expand_more),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? context.colorScheme.error
                  : context.primaryColor;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
        ),
        child: CustomText(
            text: initialValue ?? hint,
            color: initialValue == null ? Colors.grey : null),
      ),
    );
  }
}
