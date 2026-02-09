enum PasswordValidationResult { valid, tooShort, empty, weak }

enum EmailValidationResult { valid, empty, invalidFormat }

enum NameValidationResult { valid, empty, tooShort }

enum ConfirmPasswordValidationResult { valid, empty, notMatching }

enum TextFieldType { name, email, password, confirmPassword, none }

class SignUpValidation {
  static EmailValidationResult emailValidation({required String email}) {
    RegExp emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (email.isEmpty) {
      return EmailValidationResult.empty;
    } else if (!emailRegExp.hasMatch(email))
      // ignore: curly_braces_in_flow_control_structures
      return EmailValidationResult.invalidFormat;
    else
      // ignore: curly_braces_in_flow_control_structures
      return EmailValidationResult.valid;
  }

  static ConfirmPasswordValidationResult confirmPasswordValidation({
    required String confPass,
    required String? pass,
  }) {
    if (confPass.isEmpty) {
      return ConfirmPasswordValidationResult.empty;
    } else if (confPass != pass)
      // ignore: curly_braces_in_flow_control_structures
      return ConfirmPasswordValidationResult.notMatching;
    else
      // ignore: curly_braces_in_flow_control_structures
      return ConfirmPasswordValidationResult.valid;
  }

  static String? confirmPasswordErrorMessage({
    required ConfirmPasswordValidationResult result,
  }) {
    switch (result) {
      case ConfirmPasswordValidationResult.empty:
        return 'Confirm Password is required';
      case ConfirmPasswordValidationResult.notMatching:
        return 'Passwords do not match';
      case ConfirmPasswordValidationResult.valid:
        return null;
    }
  }

  static String? emailErrorMessage({required EmailValidationResult result}) {
    switch (result) {
      case EmailValidationResult.empty:
        return 'Email is required';
      case EmailValidationResult.invalidFormat:
        return 'Invalid Email';
      case EmailValidationResult.valid:
        return null;
    }
  }

  static NameValidationResult nameValidation({required String name}) {
    if (name.isEmpty) {
      return NameValidationResult.empty;
    } else if (name.length < 2)
      // ignore: curly_braces_in_flow_control_structures
      return NameValidationResult.tooShort;
    else
      // ignore: curly_braces_in_flow_control_structures
      return NameValidationResult.valid;
  }

  static String? nameErrorMessage({required NameValidationResult result}) {
    switch (result) {
      case NameValidationResult.empty:
        return 'Name is required';
      case NameValidationResult.tooShort:
        return 'Name is too short';
      case NameValidationResult.valid:
        return null;
    }
  }

  static PasswordValidationResult passwordValidation({
    required String password,
  }) {
    if (password.isEmpty) return PasswordValidationResult.empty;
    if (password.length < 8) return PasswordValidationResult.tooShort;

    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$',
    );

    if (!passwordRegExp.hasMatch(password)) {
      return PasswordValidationResult.weak;
    }

    return PasswordValidationResult.valid;
  }

  static String? passwordErrorMessage({
    required PasswordValidationResult result,
  }) {
    switch (result) {
      case PasswordValidationResult.empty:
        return 'Password is required';
      case PasswordValidationResult.tooShort:
        return 'Password must be at least 8 characters';
      case PasswordValidationResult.weak:
        return 'Password must include uppercase, lowercase, and number';
      case PasswordValidationResult.valid:
        return null;
    }
  }
}
