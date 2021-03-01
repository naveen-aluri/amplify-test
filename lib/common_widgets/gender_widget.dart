import 'package:amplify_test/bloc/gender_selection_bloc.dart';
import 'package:amplify_test/utils/strings.dart';
import 'package:flutter/material.dart';

import 'common_radio_widget.dart';

class GenderWidget extends StatelessWidget {
  final int index;

  const GenderWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 30),
        itemCount: GENDER_LIST.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return CommonRadioWidget(
            title: '${GENDER_LIST[i]}',
            isSelected: index == i ? true : false,
            onTap: () => genderSelectionBloc.select(i),
          );
        },
      ),
    );
  }
}
