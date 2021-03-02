class Validations {
  ///Reg. Expression for Validating Email Address
  static bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  ///Validationg the Password
  static bool isPasswordValid(String password, String cnfPassword,
      [int minLength = 8]) {
    if (password == null ||
        password.isEmpty ||
        cnfPassword == null ||
        cnfPassword.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasMinLength = password.length > minLength;
    bool hasMatch = password.compareTo(cnfPassword) == 0 ? true : false;

    return hasDigits & hasUppercase & hasLowercase & hasMatch & hasMinLength;
  }
}
