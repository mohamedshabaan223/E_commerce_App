import 'appstring.dart';

class ValidatorApp {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }
    // A basic regex for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (password.length < 6) {
      return AppStrings.passwordAtLeast8Char;
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return AppStrings.passwordAtLeast1Uppercase;
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return AppStrings.passwordAtLeast1Lowercase;
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      return AppStrings.passwordAtLeast1Number;
    }
    if (!RegExp(r'[@$!%*?&]').hasMatch(password)) {
      return AppStrings.passwordAtLeast1SpecialChar;
    }
    return null;
  }

  static String? confirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (confirmPassword != password) {
      return AppStrings.passwordNotTheSame;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    final nameRegex = RegExp(r"^[a-zA-Z\s]+$");
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    // This regex allows an optional '+' at the beginning followed by 7-15 digits.
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
