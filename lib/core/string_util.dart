bool isValidEmail(String value, {bool isRequired = true}) {
  if (!isRequired && value.isEmpty) {
    return true; // Allow empty if not required
  }

  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isValidPassword(String value) {
  RegExp regExp = new RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(value);
}

bool isValidUserName(String value) {
  RegExp nameRegex = RegExp(r"^[a-zA-Z][a-zA-Z0-9_]{2,19}$");
  return nameRegex.hasMatch(value);
}

bool isValidName(String value, {bool isRequired = true}) {
  if (!isRequired && value.isEmpty) {
    return true; // Allow empty if not required
  }

  RegExp nameRegex = RegExp(r"^[a-zA-Z]+(\s[a-zA-Z]+)*[a-zA-Z0-9_]{2,19}$");
  return nameRegex.hasMatch(value);
}

bool isValidMobileNumber(value) {
  RegExp syrianMobileRegex = RegExp(r'^(?!.*\d{9})$|^((\+|00)963|0)?9\d{8}$');
  return syrianMobileRegex.hasMatch(value);
}

bool isValidAddress(value) {
  RegExp addressRegex = RegExp(r'^[a-zA-Z0-9\s\-\,\#\.]+$');
  return addressRegex.hasMatch(value);
}

const String imgSrc = 'https://yesforonlineservices.sy/team/uploads/';
