import 'package:amplify_test/model/register.dart';
import 'package:amplify_test/utils/app_utils.dart';
import 'package:amplify_test/utils/constants.dart';
import 'package:amplify_test/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'signup_navigation_bloc.dart';

class SignupBloc {
  Register register = new Register();
  var serviceFetcher = PublishSubject<Register>();
  Stream<Register> get responseData => serviceFetcher.stream;

  ///Update the [Register] data.
  updateData(Register data) {
    register = data;
  }

  ///Handle the Next button click.
  ///Validating the inputs if any or else navigate to Password Page.
  onNext() {
    if (!Validations.isValidEmail(register.email ?? ''))
      showErrorMsg('Please enter valid Email!');
    else if (register.gender == null)
      showErrorMsg('Please select Gender!');
    else
      signupNavigationBloc.navigationTo(1);

    ///print the data.
    print(registerToJson(register));
    serviceFetcher.sink.add(register);
  }

  ///Handle the Continue button click.
  ///Validating the inputs if any or else navigate to Login Page.
  onContinue(BuildContext context) {
    if (!Validations.isPasswordValid(register.password, register.cnfPassword))
      showErrorMsg('Please enter valid Password!');
    else {
      showLoadingDialog(context);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            LOGIN_ROUTE, (Route<dynamic> route) => false);
      });
    }

    ///Print the data.
    print(registerToJson(register));
    serviceFetcher.sink.add(register);
  }

  ///Get the updated data.
  Register getData() => register;

  void dispose() async {
    await serviceFetcher.drain();
    serviceFetcher.close();
  }
}

final signupBloc = SignupBloc();
