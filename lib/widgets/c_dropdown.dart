import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c_text.dart';
import 'picker.dart';
import '../model/idname.dart';
import '../ext/context_extension.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hint;
  final String? initialValue;
  final Widget? trailingWidget;
  final List<IdName> options;
  final FormFieldValidator<String>? validator;
  final void Function(int, IdName) onChanged;

  const CustomDropdownButton({
    super.key,
    required this.hint,
    required this.options,
    required this.onChanged,
    this.trailingWidget,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (field) {
        final hasError = field.hasError;
        return GestureDetector(
          onTap: () {
            Get.bottomSheet(
              CustomPicker(
                title: hint,
                data: options,
                onSelect: (index, model) async {
                  onChanged(index, model);
                  field.didChange(model.name); // update form field value
                },
              ),
            );
          },
          child: InputDecorator(
              isFocused: field.value != null, // control focus
              isEmpty: field.value == null,
              decoration: InputDecoration(
                filled: true, // ✅ Enable background color
                fillColor:
                    context.theme.colorScheme.surface, // ✅ Field background
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
                    width: 1,
                  ),
                ),
                labelText: field.value != null ? hint.tr : '',
                labelStyle:
                    context.font(HeaderStyle.h4).copyWith(color: Colors.grey),
                errorStyle: context.font(HeaderStyle.h5),
                errorText: hasError ? field.errorText : null,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelStyle: WidgetStateTextStyle.resolveWith((
                  Set<WidgetState> states,
                ) {
                  final Color color = states.contains(WidgetState.error)
                      ? context.theme.colorScheme.error
                      : context.theme.colorScheme.secondary;
                  return context.font(HeaderStyle.h3).copyWith(color: color);
                }),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: field.value ?? hint.tr,
                      fontSize: HeaderStyle.h4,
                      color: field.value == null ? Colors.grey : Colors.black,
                    ),
                    trailingWidget ??
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        )
                  ])),
        );
      },
    );
  }
}
