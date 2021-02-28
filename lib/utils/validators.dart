class Validators {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static final RegExp _phoneRegExp = RegExp(
    r'(03|07|08|09|01[2|6|8|9])+([0-9]{8})\b',
  );
  static bool stringNotNullOrEmpty(String value) {
    if (value == null) {
      return false;
    } else if (value.trim().isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static String validateNotNullOrEmpty(String value, String errorMessage) {
    if (!stringNotNullOrEmpty(value)) {
      return errorMessage;
    }

    return null;
  }

  static String validateEmail(String value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }

    var isValidEmail = _emailRegExp.hasMatch(value);

    if (isValidEmail) {
      return null;
    } else {
      return errorMessage;
    }
  }

  static String validatePhoneNumber(String value, String errorMessage) {
    if (value.isEmpty) {
      return errorMessage;
    }

    var isValidPhone = _phoneRegExp.hasMatch(value);

    if (isValidPhone) {
      return null;
    }
    return errorMessage;
  }
}
