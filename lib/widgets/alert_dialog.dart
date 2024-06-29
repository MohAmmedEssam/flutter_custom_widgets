import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c_text.dart';
import 'c_button.dart';
import 'c_shadow.dart';
import 'one_row_column.dart';
import 'row_per_column.dart';
import '../ext/context_extension.dart';

class Alert extends StatelessWidget {
  final String title;
  final String content;
  final String? contentCustomValue;
  final VoidCallback? onPressed;
  final VoidCallback? onCancel;

  const Alert(
      {super.key,
      required this.title,
      this.content = "Are you sure you wants to %@?",
      this.contentCustomValue,
      this.onPressed,
      this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      ShadowContainer(
        color: context.colorScheme.background,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(context.hSpace * 2)),
        child: Padding(
          padding: context.fullPadding,
          child: OneRowPerColumn(children: [
            CustomText(
                text: title,
                fontSize: HeaderStyle.h1,
                alignment: Alignment.center),
            Container(color: Colors.grey, height: 0.5),
            CustomText(
                text: content,
                customValue: contentCustomValue,
                alignment: Alignment.center),
            RowsPerColumn(children: [
              CustomButton(
                text: 'Cancel',
                onPressed: () {
                  Get.back();
                  onCancel?.call();
                },
                style: CustomButtonStyle.secondary,
              ),
              CustomButton(
                text: 'Ok',
                onPressed: () {
                  Get.back();
                  onPressed?.call();
                },
              ),
            ]),
          ]),
        ),
      ),
    ]);
  }
}
