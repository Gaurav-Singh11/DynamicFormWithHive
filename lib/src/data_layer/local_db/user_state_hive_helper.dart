import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:nsl_task/src/data_layer/local_db/hive_database_helper.dart';
import 'package:nsl_task/src/data_layer/models/student_data_model.dart';

/// Helper class to save user information locally on the device
class UserStateHiveHelper {
  UserStateHiveHelper.__internal();

  static final UserStateHiveHelper _instance = UserStateHiveHelper.__internal();

  static UserStateHiveHelper get instance => _instance;

  /// Method used to open user box [Boxes.userBox]
  /// Box is opened only when hive is initialized
  /// Hive already initialized in [main.dart] file
  /// inside main method before [runApp] method is called
  Future<Box<dynamic>> _openHiveBox() async {
    try {
      return await Hive.openBox(
        Boxes.userBox,
      );
    } catch (e) {
      /// If hive db gives some error then it is initialized and open again
      /// and generate again encryption key for encrypted hive box
      await HiveHelper.initializeHiveAndRegisterAdapters();
      return await Hive.openBox(
        Boxes.userBox,
      );
    }
  }

  /// Method used to close hive box [Boxes.userBox]
  Future<void> close() async {
    _openHiveBox().then((box) {
      box.close();
    });
  }

  /// Method used clear all data from the box [Boxes.userBox]
  Future<void> clearBox() async {
    final Box<dynamic> encryptedBox = await _openHiveBox();
    encryptedBox.clear();
    return;
  }

  Future<void> saveStudent(StudentDataModel? dataModel) async {
    try {
      if (dataModel == null) return;
      final Box<dynamic> encryptedBox = await _openHiveBox();
      await encryptedBox.put(dataModel.id!, jsonEncode(dataModel.toJson()));
    } on Exception catch (e) {
      log(e.toString());
      return;
    }
  }

  Future<void> editStudent(String id, StudentDataModel? dataModel) async {
    try {
      final Box<dynamic> encryptedBox = await _openHiveBox();
      await encryptedBox.put(id, jsonEncode(dataModel?.toJson()));
    } on Exception catch (e) {
      log(e.toString());
      return;
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      final Box<dynamic> encryptedBox = await _openHiveBox();
      await encryptedBox.delete(id);
    } on Exception catch (e) {
      log(e.toString());
      return;
    }
  }

  Future<List<StudentDataModel>> getAllStudents() async {
    List<StudentDataModel> students = [];
    try {
      final Box<dynamic> encryptedBox = await _openHiveBox();
      final studentsMap = encryptedBox.toMap().cast<String, String>();
      log("Students map ====> $studentsMap");
      List<String> data = studentsMap.values.toList();
      for (int index = 0; index < data.length; index++) {
        Map<String, dynamic>? apiCallsData =
            jsonDecode(data[index].toString()) as Map<String, dynamic>?;
        StudentDataModel apiCallsModel =
            StudentDataModel.fromJson(apiCallsData);
        students.add(apiCallsModel);
      }
      log("Students list ====> ${students.length}");
    } catch (e) {
      log("Error while fetching students from local db===> $e");
    }
    return students;
  }
}
