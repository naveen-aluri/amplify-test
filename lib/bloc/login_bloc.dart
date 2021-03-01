import 'package:amplify_test/utils/app_utils.dart';
import 'package:flutter/material.dart';

class LoginBloc {
  ///Perform the Login operations.
  login(BuildContext context, String email, String password) {
    FocusScope.of(context).requestFocus(FocusNode());

    ///Validate the given Inputs.
    if (!isValidEmail(email))
      showErrorMsg('Please enter a valid Email!');
    else if (password.isEmpty)
      showErrorMsg('Please enter a valid Password!');
    else
      _doLogin(context);
  }

  ///Call login API.
  void _doLogin(BuildContext context) {
    showLoadingDialog(context);
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
      showSuccessMsg('Login success!');
    });
  }

  void dispose() async {}
}

final loginBloc = LoginBloc();
