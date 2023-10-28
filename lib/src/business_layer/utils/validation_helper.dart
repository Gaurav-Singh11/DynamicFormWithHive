import 'package:nsl_task/src/data_layer/res/regex.dart';

class ValidationHelper {
  /// Method used to check validate email text field
  static String? checkLoginEmailErrorMessage(String email) {
    if (email.trim().isEmpty) {
      return ""; //TODO: Add message
    } else if (email.isNotEmpty && !AppRegex.emailRegex.hasMatch(email)) {
      return ""; //TODO: Add message
    }
    return null;
  }

  static String? checkFNameErrorMessage(String fName) {
    if (fName.trim().isEmpty) {
      return ""; //TODO: Add message
    }
    return null;
  }

  /// Method used to check validate email text field
  static String? checkLNameErrorMessage(String lName) {
    if (lName.trim().isEmpty) {
      return ""; //TODO: Add message
    }
    return null;
  }
}
