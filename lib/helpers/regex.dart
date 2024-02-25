class EmailValidator {
  static final RegExp _emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

  static bool isValid(String email) {
    return _emailRegex.hasMatch(email);
  }

  static String? errorMessage(String email) {
    if (!isValid(email)) {
      return "Please enter a valid email address.";
    }
    return null;
  }
}
