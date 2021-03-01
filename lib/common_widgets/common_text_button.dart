import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final Widget icon;
  final bool isBold;

  const CommonTextButton(
      {Key key, this.title, this.onPressed, this.color, this.icon, this.isBold})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      label: Text('$title',
          style: isBold
              ? Styles.bold(color: color)
              : Styles.regular(color: color)),
      icon: icon ?? SizedBox(),
    );
  }
}
