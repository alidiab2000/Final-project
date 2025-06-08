import 'package:final_project/core/helper/constants.dart';

import '../../../../../core/helper/app_regex.dart';

class CheckPasswrdMatch {
  static String? checkPasswordMatch(String? password, String? confirmPassword) {
    if (password == null ||
        password.isEmpty ||
        confirmPassword == null ||
        confirmPassword.isEmpty) {
      return 'Password or confirm password is empty';
    } else {
      if (password != confirmPassword) {
        return 'Password and Confirm Password do not match';
      } else if (!AppRegex.isPasswordValid(confirmPassword)) {
        return Constants.passwordNotValid;
      }
    }

    return null;
  }
}
