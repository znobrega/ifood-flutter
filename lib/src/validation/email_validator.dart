import 'dart:core';

class EmailValidator {

  static final RegExp re = RegExp(r'^([._]*[A-Za-z0-9]+[._]*)@[A-Za-z0-9]+\.(com|org|br)$');

  static bool validate(String email) {
    
    if (email.isEmpty || email.length < 6 || email.length > 255) {
      return false;
    }

    return re.hasMatch(email);

  }
}