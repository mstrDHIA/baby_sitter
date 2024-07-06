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








String? validEmail(String? value) {
  return value!.isEmpty
      ? "Please enter your email"
      : value.length < 6 || !value.contains('@') || !value.contains('.')
          ? "Please enter a valid email"
          : null;
}

String? validPassword(String? value) {
  return value!.isEmpty
      ? "Please enter your password"
      : value.length < 4
          ? "Password must be at least 4 characters"
          : null;
}

String? validPrenom(String? value) {
  return value!.isEmpty
      ? "Please enter your first name"
      : value.length < 3
          ? "First name must be at least 3 characters"
          : null;
}

String? validDate(String? value) {
  return value!.isEmpty ? "Please enter your date of birth" : null;
}
String? validMaladie(String? value) {
  return value!.isEmpty ? "Please enter your diseas of birth" : null;
}

String? validPhoneNum(String? value) {
  return value!.isEmpty
      ? "Please enter your phone number"
      : value.length != 8
          ? "Phone number must be 8 characters"
          : null;
}


String? validAdresse(String? value) {
  return value!.isEmpty
      ? "Please enter your address"
      : value.length < 3
          ? "Address must be at least 3 characters"
          : null;
}

//  i want to addd zip code is number
String? validZipCode(String? value) {
  return value!.isEmpty
      ? "Please enter your zip code"
      : value.length != 4
          ? "Zip code must be 4 characters"
          : value.contains(RegExp(r'[0-9]'))
              ? null
              : "Zip code must be a number";
}

String? validString(String? value) {
  return value!.isEmpty
      ? "Please enter your address"
      : value.length < 3
          ? "Address must be at least 3 characters"
          : null;
}
