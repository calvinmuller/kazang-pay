import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show StatelessWidget, BuildContext, Widget, TextFormField, InputDecoration, TextInputType, TextInputAction, Theme, BorderSide, OutlineInputBorder;

import '../../core/constants.dart';

class FormField extends StatelessWidget {
  const FormField({
    super.key,
    this.validator,
    this.onSaved,
    this.controller,
    this.maxLength,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.initialValue,
    this.autofocus = false,
  });

  final FormFieldValidator<String>? validator;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int? maxLength;
  final bool obscureText;
  final bool autofocus;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      obscureText: obscureText,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: CustomColours.gold,
          ),
          borderRadius: borderRadiusSmall,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColours.black,
          ),
          borderRadius: borderRadiusSmall,
        ),
      ),
      maxLength: maxLength,
      // The validator receives the text that the user has entered.
      validator: validator,
      onSaved: onSaved,
    );
  }
}
