import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomValidationWidget extends StatelessWidget {
  final String title;
  final bool isValid;

  const CustomValidationWidget({Key key, this.title, this.isValid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(isValid ? Icons.check : Icons.close,
            size: 16, color: isValid ? Colors.green : Colors.red),
        SizedBox(width: 5),
        Text(
          '$title',
          style: Styles.regular(
              fontSize: 12, color: isValid ? Colors.green : Colors.red),
        ),
      ],
    );
  }
}
