import 'package:get/get.dart';

String? validInput(String value, int min, int max, String type) {
  if (value.isEmpty) {
    return "This field can't be empty";
  }

  if (value.length < min) {
    return "Must be at least $min characters";
  }

  if (value.length > max) {
    return "Must be less than $max characters";
  }

  switch (type) {
    case 'email':
      if (!GetUtils.isEmail(value)) {
        return "Not a valid email";
      }
      break;
    case 'number':
      if (!GetUtils.isNumericOnly(value)) {
        return "Not a valid number";
      }
      break;
    default:
      return null;
  }

  return null;
}

String? validConfirmPassword(String value, String originalPassword) {
  if (value != originalPassword) {
    return "Password and confirm password don't match";
  }

  return validInput(value, 4, 25, 'password');
}
