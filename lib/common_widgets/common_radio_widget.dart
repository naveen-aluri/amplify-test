import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class CommonRadioWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final GestureTapCallback onTap;

  const CommonRadioWidget(
      {Key key,
      @required this.title,
      @required this.isSelected,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text('$title', style: Styles.regular(color: Colors.black)),
          SizedBox(width: 10),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
                image: isSelected
                    ? DecorationImage(
                        image: AssetImage('assets/images/check.png'),
                      )
                    : null),
          ),
        ],
      ),
    );
  }
}
