import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Widget icon;

  const CommonButton(
      {Key key,
      this.title,
      this.onPressed,
      this.color,
      this.textColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      color: color,
      label: Text('$title', style: Styles.medium(color: textColor)),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      icon: icon ?? SizedBox(),
    );
  }
}
