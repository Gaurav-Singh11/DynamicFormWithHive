import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  static Future<bool> initializeHiveAndRegisterAdapters() async {
    /// Do not edit this method until you need a new adapter
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String dbFilePath = [appDocDir.path, 'nsl_task_db'].join('/');
      Hive.init(dbFilePath);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class UserStateKeys {
  static const String key = 'key';
}

class Boxes {
  static const String userBox = 'user_box';
}
