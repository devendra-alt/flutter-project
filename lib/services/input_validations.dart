extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension SignUpEmailValidator on String {
  bool isValidEmailid() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension SignInPasswordValidator on String {
  bool isValidPassword() {
    if (this.isEmpty)
      return false;
    else
      return true;
  }
}

extension SignUpPasswordValidator on String {
  bool validateStructure() {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(this);
  }
}

extension UserNameValidator on String {
  String validateUserName() {
    if (this.isEmpty)
      return "username is required";
    else if (this.length < 5)
      return "username should be long";
    else if (this.length > 13)
      return "username should no longer then 15 characters";
    else
      return null;
  }
}
