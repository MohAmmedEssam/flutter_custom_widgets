import 'package:flutter/material.dart';
import 'one_row_column.dart';
import 'c_button.dart';

class CustomForm extends StatefulWidget {
  final String btnTitle;
  final VoidCallback onSave;
  final List<Widget> childs;

  const CustomForm({
    super.key,
    required this.btnTitle,
    required this.childs,
    required this.onSave,
  });

  @override
  CustomFormState createState() => CustomFormState();
}

class CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: OneRowPerColumn(children: [
          ...widget.childs,
          CustomButton(
              text: widget.btnTitle,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  formKey.currentState?.save();
                  widget.onSave();
                }
              }),
        ]));
  }
}
