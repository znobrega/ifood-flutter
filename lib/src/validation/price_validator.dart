import 'dart:core';

class PriceValidator {

  static final RegExp re = RegExp(r'^\d+\.?\d*$');

  static bool validate(String price) {
    
    if (price.isEmpty || price.length > 255) {
      return false;
    }

    return re.hasMatch(price);

  }
}