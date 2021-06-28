import 'dart:core';

class AddressValidator {

  static final RegExp re = RegExp(r'^[A-Za-z0-9]+$');

  static bool validate(String address) {
    
    if (address.isEmpty || address.length < 4 || address.length > 255) {
      return false;
    }

    List<String> words = address.split(" ");

    for (var i = 0; i < words.length; i++) {
      if(!re.hasMatch(words[i]))
        return false;
    }

    return true;

  }
}