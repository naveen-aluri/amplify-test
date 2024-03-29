import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hint;
  final bool obscureText;
  final Color borderColor;
  final Color fillColor;
  final Color textColor;
  final ValueChanged onChanged;

  const CommonTextField(
      {Key key,
      this.controller,
      this.currentFocusNode,
      this.nextFocusNode,
      this.hint,
      this.keyboardType,
      this.textInputAction,
      this.obscureText,
      this.borderColor = Colors.white,
      this.fillColor = Colors.transparent,
      this.textColor = Colors.white,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: currentFocusNode,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.none,
      textInputAction: textInputAction,
      obscureText: obscureText,
      style: Styles.regular(color: textColor),
      onSubmitted: (val) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        disabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        hintText: hint,
        hintStyle: Styles.regular(color: Colors.grey),
        isDense: true,
        fillColor: fillColor,
        filled: true,
      ),
    );
  }
}
