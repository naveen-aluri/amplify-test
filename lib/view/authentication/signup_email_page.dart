import 'package:amplify_test/bloc/signup_navigation_bloc.dart';
import 'package:amplify_test/common_widgets/common_button.dart';
import 'package:amplify_test/common_widgets/signup_tab_indicator.dart';
import 'package:amplify_test/utils/colors.dart';
import 'package:flutter/material.dart';

import 'registration_page.dart';

class SignupEmailPage extends StatefulWidget {
  @override
  _SignupEmailPageState createState() => _SignupEmailPageState();
}

class _SignupEmailPageState extends State<SignupEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: SignupTabIndicator(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
            stream: signupNavigationBloc.responseData,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return CommonButton(
                title: snapshot.data == 0 ? 'NEXT' : 'CONTINUE',
                color: goldColor,
                onPressed: () {
                  if (snapshot.data == 0) signupNavigationBloc.navigationTo(1);
                },
                textColor: Colors.black,
              );
            }),
      ),
      body: StreamBuilder(
          stream: signupNavigationBloc.responseData,
          builder: (context, AsyncSnapshot<int> snapshot) {
            return snapshot.data == 0 ? RegistrationPage() : Container();
          }),
    );
  }
}
