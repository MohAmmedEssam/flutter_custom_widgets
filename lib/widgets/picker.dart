import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c_text.dart';
import 'scroller.dart';
import 'c_shadow.dart';
import 'one_row_column.dart';
import '../model/idname.dart';
import '../ext/context_extension.dart';

class CustomPicker extends StatelessWidget {
  final String? title;
  final List<IdName> data;
  final Function(int, IdName) onSelect;

  const CustomPicker(
      {super.key, this.title, required this.data, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return (data.length > 7)
        ? _buildPicker(context)
        : Wrap(children: [_buildPicker(context)]);
  }

  Widget _buildPicker(BuildContext context) {
    return SafeArea(
      bottom: false, // <- don't shrink height because of safe area bottom
      child: ShadowContainer(
        color: context.colorScheme.background,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(context.hSpace * 2)),
        child: Padding(
          padding: context.fullPadding,
          child: Column(
            children: [
              if (title != null && title!.isNotEmpty) ...[
                CustomText(
                  text: title ?? '',
                  fontSize: HeaderStyle.h1,
                  alignment: Alignment.center,
                ),
                SizedBox(height: context.vSpace),
              ],
              (data.length > 7)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Scroller(
                        child: _buildPickerList(context),
                      ),
                    )
                  : _buildPickerList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickerList(BuildContext context) {
    return OneRowPerColumn(
        withSepartor: true,
        children: data
            .asMap()
            .entries
            .map(
              (e) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.back();
                  onSelect(e.key, e.value);
                },
                child: Row(children: [
                  CustomText(text: e.value.name ?? ''),
                  const Spacer(),
                  RadioButton(isSelected: e.value.isSelected)
                ]),
              ),
            )
            .toList());
  }
}

// MARK: - Radio Button
class RadioButton extends StatelessWidget {
  final bool isSelected;

  const RadioButton({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      size: context.vSpace * 1.25,
      color: context.primaryColor,
      child: RoundedContainer(
        size: context.vSpace * 1,
        color: context.colorScheme.background,
        child: isSelected
            ? RoundedContainer(
                size: context.vSpace * 0.75,
                color: context.primaryColor,
              )
            : null,
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Widget? child;
  final double size;
  final Color? color;

  const RoundedContainer(
      {super.key, this.child, this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(size * 0.5)),
        child: child);
  }
}
