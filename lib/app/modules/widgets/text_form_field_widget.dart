import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormFieldWidget extends GetWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validatorFun;

  const TextFormFieldWidget(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.textInputAction = TextInputAction.next,
      this.onEditingComplete,
      this.validatorFun});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      validator: validatorFun,
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
