import 'package:amplify_test/utils/constants.dart';
import 'package:flutter/material.dart';

import 'view/authentication/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amplify Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: LoginPage(),
      routes: {
        LOGIN_ROUTE: (context) => LoginPage(),
      },
    );
  }
}
