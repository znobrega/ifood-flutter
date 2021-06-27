import 'dart:core';

class PasswordValidator {

  static final RegExp re = RegExp(r'^[A-Za-z_]*\d+[A-Za-z_]*\d+[A-Za-z0-9_]*$');

  static bool validate(String password) {
    
    if (password.isEmpty || password.length < 4 || password.length > 255) {
      return false;
    }

    return re.hasMatch(password);

  }
}