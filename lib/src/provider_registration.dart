import 'package:flutter/material.dart';
import 'package:nsl_task/src/business_layer/provider/students_provider.dart';
import 'package:nsl_task/src/business_layer/provider/base_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RegisterProviders {
  //Register all providers used in the application here
  static List<SingleChildWidget> providers(BuildContext context) {
    return [
      ChangeNotifierProvider<BaseProvider>(
        create: (context) => BaseProvider(),
      ),
      ChangeNotifierProvider<StudentProvider>(
        create: (context) => StudentProvider(),
      ),
    ];
  }
}
