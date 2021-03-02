import 'package:amplify_test/common_widgets/common_button.dart';
import 'package:amplify_test/common_widgets/common_text_button.dart';
import 'package:amplify_test/utils/colors.dart';
import 'package:amplify_test/utils/constants.dart';
import 'package:amplify_test/utils/styles.dart';
import 'package:amplify_test/view/authentication/signup_email_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => _navigateToLoginPage(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          Image.asset('assets/images/logo.png', height: 60, color: goldColor),
          SizedBox(height: 10),
          Text('GAIN BACK CONTROL\nOF YOUR LIFE',
              textAlign: TextAlign.center,
              style: Styles.medium(color: Colors.white)),
          SizedBox(height: 30),
          CommonButton(
            title: 'SIGN UP WITH FACEBOOK',
            color: Color(0XFF4267B2),
            textColor: Colors.white,
            icon: Image.asset('assets/images/facebook.png', width: 20),
            onPressed: () {},
          ),
          SizedBox(height: 5),
          CommonButton(
            title: 'SIGN UP WITH GOOGLE',
            color: Colors.white,
            textColor: Colors.black,
            icon: Image.asset('assets/images/google.png', width: 20),
            onPressed: () {},
          ),
          SizedBox(height: 10),
          CommonTextButton(
            title: 'Sign up with Email address',
            color: goldColor,
            isBold: true,
            onPressed: () => _navigateToSignupWithEmailPage(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Divider(thickness: 1.5, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?',
                  style: Styles.regular(color: Colors.white)),
              CommonTextButton(
                title: 'Sign in',
                color: goldColor,
                isBold: true,
                onPressed: () => _navigateToLoginPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToSignupWithEmailPage() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new SignupEmailPage()));
  }

  void _navigateToLoginPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LOGIN_ROUTE, (Route<dynamic> route) => false);
  }
}
