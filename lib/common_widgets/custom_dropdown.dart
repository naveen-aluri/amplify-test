import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String value;
  final List<DropdownMenuItem<String>> dropDownMenuItems;
  final ValueChanged<String> valueChanged;

  const CustomDropDown({
    Key key,
    this.value,
    this.dropDownMenuItems,
    this.valueChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.grey[300], width: 1.3)),
      child: DropdownButtonHideUnderline(
        child: new DropdownButton(
          iconSize: 30,
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          value: value,
          style: Styles.regular(color: Colors.black),
          items: dropDownMenuItems,
          onChanged: valueChanged,
        ),
      ),
    );
  }
}
