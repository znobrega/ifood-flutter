import 'dart:core';

class NameValidator {

  static final RegExp re = RegExp(r'^[A-Za-z]+$');

  static bool validate(String name) {

    if (name.isEmpty || name.length < 3 || name.length > 255) {
      return false;
    }

    List<String> words = name.split(" ");

    for (var i = 0; i < words.length; i++) {
      if(!re.hasMatch(words[i]))
        return false;
    }

    return true;

  }
}