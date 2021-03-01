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

  const CommonTextField(
      {Key key,
      this.controller,
      this.currentFocusNode,
      this.nextFocusNode,
      this.hint,
      this.keyboardType,
      this.textInputAction,
      this.obscureText})
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
      style: Styles.regular(color: Colors.white),
      onSubmitted: (val) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        disabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: hint,
        hintStyle: Styles.regular(color: Colors.grey),
        isDense: true,
      ),
    );
  }
}
