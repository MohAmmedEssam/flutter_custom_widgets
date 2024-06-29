import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'c_text.dart';
import '../ext/context_extension.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  final bool addBackBtn;
  final Widget? trailingWidget;

  const CustomHeader(
      {super.key, this.text = '', this.addBackBtn = true, this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (addBackBtn)
          GestureDetector(
            onTap: () => {Get.back()},
            child: Icon(Icons.arrow_back, color: context.primaryColor),
          ),
        const Spacer(),
        CustomText(text: text, fontSize: HeaderStyle.h1),
        const Spacer(),
        if (trailingWidget != null) trailingWidget!,
      ],
    );
  }
}
