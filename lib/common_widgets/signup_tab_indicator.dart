import 'package:amplify_test/bloc/signup_navigation_bloc.dart';
import 'package:amplify_test/utils/colors.dart';
import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class SignupTabIndicator extends PreferredSize {
  @override
  Widget get child => Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SIGN UP',
                textAlign: TextAlign.center,
                style: Styles.medium(
                    color: goldColor, fontSize: 16, letterSpacing: 1)),
            StreamBuilder(
                stream: signupNavigationBloc.responseData,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  int index = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(child: Container(height: 3, color: goldColor)),
                        SizedBox(width: 10),
                        Expanded(
                            child: Container(
                                height: 3,
                                color: index == 1 ? goldColor : Colors.grey))
                      ],
                    ),
                  );
                })
          ],
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(50);
}
