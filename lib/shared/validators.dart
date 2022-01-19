class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  // static final RegExp _passwordRegExp = RegExp(
  //   r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  // );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String? password) {
    return password != null && password.length > 0;
  }

  static isValidPhoneNumber(String? phoneNum) {
    return phoneNum != null && phoneNum.length > 0;
  }

  static isValid(String? value, {int limiter = 0}) {
    return value != null && value.length > limiter;
  }

  static bool isPalindrome(String text) {
    if (text.isEmpty) return false;
    var splitted = text.split(" ").join("");
    var l = splitted.length ~/ 2;
    for (int i = 0; i < l; i++) {
      if (splitted[i] != splitted[splitted.length - 1 - i] && i + 1 != l)
        return false;
    }
    return true;
  }

  static isValidNumber(
    int? value,
  ) {
    return value != null;
  }
}
