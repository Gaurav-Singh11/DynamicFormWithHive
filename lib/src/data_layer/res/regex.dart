import 'package:nsl_task/src/data_layer/res/numbers.dart';

class AppRegex {
  static final RegExp successCode = RegExp(r'20\d');
  static final RegExp capitalLetter = RegExp(r'[A-Z0-9]');
  static final RegExp nameWhitelist = RegExp(r'[A-Za-z\-\. ]');
  static final RegExp middleNameWhitelist = RegExp(r'[A-Za-z\-]');
  static final RegExp addressWhitelist = RegExp(r'[A-Za-z0-9_,\-\./ ]');
  static final RegExp operatorWhitelist = RegExp(r'[A-Za-z0-9_,\-\./ ]');
  static final RegExp digitsOnly = RegExp(r'\d');
  static final RegExp floatNumber = RegExp(r'[\.\d]');
  static final RegExp multiSpaces = RegExp(r'  ');
  static final RegExp space = RegExp(r' ');
  static final RegExp removeDecimalZeroFormat = RegExp(r'([.]*0)(?!.*\d)');
  static final RegExp alphaNumeric = RegExp(r'[A-Za-z0-9]');
  static final RegExp alphaNumericWithSpace = RegExp(r'[A-Za-z0-9 ]');
  static final RegExp fullName = RegExp(r'[A-Za-z\-\. ]');
  static final RegExp passwordRegex =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^\w\s]).{8,}$');
  static final RegExp emojiRegex = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
  static final RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final RegExp passRegex =
      RegExp(r"""[a-zA-Z0-9!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]""");
  static final RegExp specialCharRegex =
      RegExp(r"""[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]""");
  static final List<String> allAlphabets =
      """A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"""
          .split(",")
          .toList();
  static final List<String> zeroToNineNumberList =
      """0,1,2,3,4,5,6,7,8,9""".split(",").toList();
  static final List<String> specCharList =
      r"""!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~""".split("").toList();

  static bool hasAllNecessaryField(String? text) {
    if (text == null || text.trim().length < d_8 || text.trim().length > d_16) {
      return false;
    }
    bool isValidPassword = true,
        hasCapitalAlpha = false,
        hasSmallAlpha = false,
        hasNumber = false,
        hasSpecialChar = false;
    for (int fIndex = i_0; fIndex < text.length; fIndex++) {
      if (allAlphabets.contains(text[fIndex])) {
        hasCapitalAlpha = true;
      }
    }
    if (!hasCapitalAlpha) {
      return hasCapitalAlpha;
    }
    for (int fIndex = i_0; fIndex < text.length; fIndex++) {
      if (allAlphabets
          .map((e) => e.toLowerCase())
          .toList()
          .contains(text[fIndex])) {
        hasSmallAlpha = true;
      }
    }
    if (!hasSmallAlpha) {
      return hasSmallAlpha;
    }
    for (int fIndex = i_0; fIndex < text.length; fIndex++) {
      if (zeroToNineNumberList.contains(text[fIndex])) {
        hasNumber = true;
      }
    }
    if (!hasNumber) {
      return hasNumber;
    }
    for (int fIndex = i_0; fIndex < text.length; fIndex++) {
      if (specCharList.contains(text[fIndex])) {
        hasSpecialChar = true;
      }
    }
    if (!hasSpecialChar) {
      return hasSpecialChar;
    }
    return isValidPassword;
  }
}
