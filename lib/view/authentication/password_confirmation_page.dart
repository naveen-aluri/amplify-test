import 'package:amplify_test/bloc/signup_bloc.dart';
import 'package:amplify_test/common_widgets/common_textfield.dart';
import 'package:amplify_test/common_widgets/custom_validation_widget.dart';
import 'package:amplify_test/model/register.dart';
import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class PasswordConfirmationPage extends StatefulWidget {
  @override
  _PasswordConfirmationPageState createState() =>
      _PasswordConfirmationPageState();
}

class _PasswordConfirmationPageState extends State<PasswordConfirmationPage> {
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _cnfPasswordController = new TextEditingController();

  FocusNode _passwordFocus = new FocusNode();
  FocusNode _cnfPasswordFocus = new FocusNode();

  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasDigits = false;
  bool _hasLowercase = false;
  bool _hasMatch = false;

  Register register;

  @override
  void initState() {
    super.initState();
    register = new Register();
    register = signupBloc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Text('Choose a password', style: Styles.medium(color: Colors.black)),
        SizedBox(height: 10),
        CommonTextField(
          controller: _passwordController,
          currentFocusNode: _passwordFocus,
          nextFocusNode: _cnfPasswordFocus,
          hint: 'Password',
          obscureText: true,
          textColor: Colors.black,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          borderColor: Colors.grey[300],
          fillColor: Colors.grey[100],
          onChanged: (val) => validatePassword(val),
        ),
        SizedBox(height: 10),
        CommonTextField(
          controller: _cnfPasswordController,
          currentFocusNode: _cnfPasswordFocus,
          nextFocusNode: FocusNode(),
          hint: 'Confirm Password',
          obscureText: false,
          textColor: Colors.black,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          borderColor: Colors.grey[300],
          fillColor: Colors.grey[100],
          onChanged: (val) {
            _hasMatch = isBothMatch();
            register.cnfPassword = val;
            signupBloc.updateData(register);
            setState(() {});
          },
        ),
        SizedBox(height: 10),
        CustomValidationWidget(
            title: 'Minimum of 8 characters', isValid: _hasMinLength),
        CustomValidationWidget(
            title: 'A capital letter', isValid: _hasUppercase),
        CustomValidationWidget(title: 'A lower letter', isValid: _hasLowercase),
        CustomValidationWidget(title: 'A number', isValid: _hasDigits),
        CustomValidationWidget(
            title: 'Both passwords match', isValid: _hasMatch),
      ],
    );
  }

  validatePassword(String value) {
    _hasUppercase = value.contains(new RegExp(r'[A-Z]'));
    _hasDigits = value.contains(new RegExp(r'[0-9]'));
    _hasLowercase = value.contains(new RegExp(r'[a-z]'));
    _hasMinLength = value.length > 8;
    _hasMatch = isBothMatch();
    register.password = value;
    signupBloc.updateData(register);
    setState(() {});
  }

  bool isBothMatch() {
    if (_passwordController.text.isNotEmpty &&
        _cnfPasswordController.text.isNotEmpty)
      return _passwordController.text.compareTo(_cnfPasswordController.text) ==
              0
          ? true
          : false;
    else
      return false;
  }
}
