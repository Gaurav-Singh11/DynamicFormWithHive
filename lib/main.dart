import 'package:flutter/material.dart';
import 'package:nsl_task/src/business_layer/utils/util_helper.dart';
import 'package:nsl_task/src/data_layer/local_db/hive_database_helper.dart';
import 'package:nsl_task/src/data_layer/res/styles.dart';
import 'package:nsl_task/src/nsl_task_app.dart';

Future<void> main() async {
  /// Initialize the WidgetFlutterBinding if required
  WidgetsFlutterBinding.ensureInitialized();

  /// Used to initialize hive db and register adapters and generate encryption
  /// key for encrypted hive box
  await HiveHelper.initializeHiveAndRegisterAdapters();

  UtilHelper.createUUID();

  /// Sets the device orientation of application
  AppStyles.setDeviceOrientationOfApp();

  /// Runs the application in its own error zone
  runApp(const NslTakApp());
}
