import 'package:amplify_test/model/register.dart';
import 'package:amplify_test/utils/app_utils.dart';
import 'package:amplify_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'signup_navigation_bloc.dart';

class SignupBloc {
  Register register = new Register();
  var serviceFetcher = PublishSubject<Register>();
  Stream<Register> get responseData => serviceFetcher.stream;

  updateData(Register data) {
    register = data;
  }

  onNext() {
    if (!isValidEmail(register.email ?? ''))
      showErrorMsg('Please enter valid Email!');
    else if (register.gender == null)
      showErrorMsg('Please select Gender!');
    else
      signupNavigationBloc.navigationTo(1);
    serviceFetcher.sink.add(register);
  }

  onContinue(BuildContext context) {
    if (!isPasswordValid(register.password, register.cnfPassword))
      showErrorMsg('Please enter valid Password!');
    else {
      showLoadingDialog(context);
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            LOGIN_ROUTE, (Route<dynamic> route) => false);
      });
    }

    serviceFetcher.sink.add(register);
  }

  Register getData() => register;

  void dispose() async {
    await serviceFetcher.drain();
    serviceFetcher.close();
  }
}

final signupBloc = SignupBloc();
