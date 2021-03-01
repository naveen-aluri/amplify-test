import 'package:amplify_test/bloc/login_bloc.dart';
import 'package:amplify_test/common_widgets/common_button.dart';
import 'package:amplify_test/common_widgets/common_text_button.dart';
import 'package:amplify_test/common_widgets/common_textfield.dart';
import 'package:amplify_test/utils/colors.dart';
import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          Image.asset('assets/images/logo.png', height: 60, color: goldColor),
          SizedBox(height: 30),
          CommonTextField(
            controller: _emailController,
            currentFocusNode: _emailFocus,
            nextFocusNode: _passwordFocus,
            hint: 'Username or Email address',
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 15),
          CommonTextField(
            controller: _passwordController,
            currentFocusNode: _passwordFocus,
            nextFocusNode: FocusNode(),
            hint: 'Password',
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: CommonTextButton(
              title: 'Forgotten Password?',
              color: goldColor,
              isBold: true,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 5),
          CommonButton(
            title: 'LOG IN',
            color: goldColor,
            textColor: Colors.black,
            onPressed: () => loginBloc.login(
                context, _emailController.text, _passwordController.text),
          ),
          SizedBox(height: 10),
          CommonTextButton(
            title: 'Connect with Facebook',
            color: Colors.white,
            icon: Image.asset('assets/images/facebook.png', width: 20),
            isBold: false,
            onPressed: () {},
          ),
          CommonTextButton(
            title: 'Connect with Google',
            color: Colors.white,
            icon: Image.asset('assets/images/google.png', width: 20),
            isBold: false,
            onPressed: () {},
          ),
          Divider(thickness: 1.5, color: Colors.grey, height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?',
                  style: Styles.regular(color: Colors.white)),
              CommonTextButton(
                title: 'Sign up',
                color: goldColor,
                isBold: true,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
