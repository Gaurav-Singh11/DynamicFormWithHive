import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UtilHelper{
  static const uuid = Uuid();
  static String createUUID() {
    return uuid.v1();
  }

  /// Methode used to close keyboard
  static void closeKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
}