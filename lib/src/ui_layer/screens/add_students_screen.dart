// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nsl_task/src/business_layer/provider/students_provider.dart';
import 'package:nsl_task/src/business_layer/utils/util_helper.dart';
import 'package:nsl_task/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:nsl_task/src/data_layer/models/student_data_model.dart';
import 'package:nsl_task/src/data_layer/res/styles.dart';
import 'package:nsl_task/src/ui_layer/helpers/progress_helper.dart';
import 'package:nsl_task/src/ui_layer/helpers/toast_helper.dart';
import 'package:nsl_task/src/ui_layer/widgets/app_button_widget.dart';
import 'package:nsl_task/src/ui_layer/widgets/add_students_form_widget.dart';
import 'package:provider/provider.dart';

class AddStudentsScreen extends StatefulWidget {
  const AddStudentsScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentsScreen> createState() => _AddStudentsScreenState();
}

class _AddStudentsScreenState extends State<AddStudentsScreen> {
  late StudentProvider _studentProvider;
  bool _isSaveButtonActivated = false;
  final List<StudentDataModel> _students =
      List<StudentDataModel>.generate(1, (index) => StudentDataModel());

  @override
  void initState() {
    super.initState();
    _studentProvider = Provider.of<StudentProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _studentProvider.addListener(() {
        _isSaveButtonActivated = true;
        for (var student in _students) {
          if (student.name == null ||
              (student.name != null && student.name!.trim().isEmpty) ||
              (student.email == null) ||
              (student.email != null && student.email!.trim().isEmpty) ||
              (student.gender == null) ||
              (student.gender != null && student.gender!.trim().isEmpty)) {
            _isSaveButtonActivated = false;
          }
        }
        if (mounted) setState(() {});
      });
    });
  }

  void _addStudent() {
    if (_students.length < 5) {
      if (mounted) {
        setState(() {
          _isSaveButtonActivated = false;
          _students.add(StudentDataModel());
        });
      }
    } else {
      ToastHelper.showToast(context, "You can't add more students.");
    }
  }

  Future<void> _saveStudents() async {
    Loader.display(context);
    for (var student in _students) {
      student.id = UtilHelper.createUUID();
      student.createdAt = DateTime.now().toString();
      student.updatedAt = DateTime.now().toString();
      await UserStateHiveHelper.instance.saveStudent(student);
    }
    Loader.close(context);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Add Students"),
        actions: [
          IconButton(
            onPressed: _addStudent,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  padding: AppStyles.screenHorizontalPadding,
                  itemBuilder: (context, index) {
                    return DynamicFormWidget(
                      dataModel: _students[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return AppStyles.sbHeight20;
                  },
                  itemCount: _students.length,
                ),
              ),
            ),
            AppStyles.sbHeight10,
            Consumer<StudentProvider>(
              builder: (context, provider, child) {
                return Center(
                  child: AppButtonWidget(
                    title: "Save",
                    active: _isSaveButtonActivated,
                    onPressed: _saveStudents,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
