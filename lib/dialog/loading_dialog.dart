import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String text;
  LoadingDialog({this.text});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
