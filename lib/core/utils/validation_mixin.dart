class ValidationMixin {
  String validateNotEmpty(String value) {
    if (value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  String validateFullName(String fullName) {
    if (fullName.split(' ').length < 2) {
      return 'Enter a valid Full Name';
    }
    return null;
  }

  String validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return 'Enter a Valid Email Address';
    }
    return null;
  }

  String validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 10) {
      return 'Enter a Valid Phone Number';
    }
    return null;
  }

  String validatePassword(String password) {
    if (password.length < 6) {
      return 'Password should be more than 5 Characters';
    }
    return null;
  }
}
