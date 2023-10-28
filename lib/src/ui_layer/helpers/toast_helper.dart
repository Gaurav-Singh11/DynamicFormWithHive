import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nsl_task/src/business_layer/utils/util_helper.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';
import 'package:nsl_task/src/data_layer/res/numbers.dart';

class ToastHelper {
  /// Method used to show error messages
  static Future<void> showToast(
    BuildContext context,
    String? message, {
    bool error = true,
  }) async {
    UtilHelper.closeKeyboard(context);
    if (message == null || message.trim().isEmpty) {
      return;
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: i_2,
      fontSize: d_15,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: AppColors.whiteColor,
    );
  }
}
