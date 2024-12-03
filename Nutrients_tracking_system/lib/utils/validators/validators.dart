class Validators {
  Validators._();

  static bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static String? emailValidator(String? value, {bool isRequired = true}) {
    if (value == null || value.isEmpty) {
      if (isRequired) {
        return 'Please enter an email address';
      }
      return null;
    }
    if (!_isEmailValid(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? emptyValidator(
    String? value, {
    bool isRequired = true,
    String? message,
  }) {
    if (value == null || value.isEmpty) {
      if (isRequired) {
        return message ?? 'This field is required';
      }
      return null;
    }
    return null;
  }
}
