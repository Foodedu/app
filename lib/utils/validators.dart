class Validators {
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
}
