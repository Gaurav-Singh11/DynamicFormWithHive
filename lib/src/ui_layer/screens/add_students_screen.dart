// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nsl_task/src/business_layer/provider/students_provider.dart';
import 'package:nsl_task/src/business_layer/utils/util_helper.dart';
import 'package:nsl_task/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:nsl_task/src/data_layer/models/student_data_model.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';
import 'package:nsl_task/src/data_layer/res/styles.dart';
import 'package:nsl_task/src/ui_layer/helpers/progress_helper.dart';
import 'package:nsl_task/src/ui_layer/widgets/app_button_widget.dart';
import 'package:nsl_task/src/ui_layer/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class AddStudentsScreen extends StatefulWidget {
  final StudentDataModel? studentDataModel;
  const AddStudentsScreen({Key? key, this.studentDataModel}) : super(key: key);

  @override
  State<AddStudentsScreen> createState() => _AddStudentsScreenState();
}

class _AddStudentsScreenState extends State<AddStudentsScreen> {
  late StudentProvider _studentProvider;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _gender = <String>["Male", "Female", "Other"];
  int _groupValue = -1;
  bool _isEditMode = false;
  StudentDataModel? _studentDataModel = StudentDataModel();

  get _isSaveButtonActivated =>
      _nameController.text.trim().isNotEmpty &&
      _emailController.text.trim().isNotEmpty &&
      _groupValue != -1;

  @override
  void initState() {
    super.initState();
    _studentProvider = Provider.of<StudentProvider>(context, listen: false);
    _isEditMode = widget.studentDataModel != null;
    if(_isEditMode){
      _nameController.text = widget.studentDataModel?.name ?? "";
      _emailController.text = widget.studentDataModel?.email ?? "";
      _groupValue = _gender.indexOf(widget.studentDataModel?.gender ?? "");
    }
  }

  @override
  void dispose() {
    _studentDataModel = null;
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // void _refreshState() {
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return _mainApp(context);
  }

  Widget _mainApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Add Students"),
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //     },
        //     icon: const Icon(Icons.add),
        //   )
        // ],
      ),
      body: _addStudentsScrollView(),
    );
  }

  Widget _addStudentsScrollView() {
    return SingleChildScrollView(
      padding: AppStyles.screenHorizontalPadding,
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppStyles.sbHeight10,
          _headlineWidget(),
          AppStyles.sbHeight20,
          _titleWidget("Name *"),
          AppStyles.sbHeight5,
          _nameFieldWidget(),
          AppStyles.sbHeight10,
          _titleWidget("Email *"),
          AppStyles.sbHeight10,
          _emailFieldWidget(),
          AppStyles.sbHeight10,
          _titleWidget("Gender *"),
          AppStyles.sbHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              addRadioButton(0, 'Male'),
              addRadioButton(1, 'Female'),
              addRadioButton(2, 'Other'),
            ],
          ),
          AppStyles.sbHeight10,
          Center(
            child: Consumer<StudentProvider>(builder: (_, __, ___) {
              return AppButtonWidget(
                title: "Save",
                active: _isSaveButtonActivated,
                onPressed: (){
                  if(_isEditMode){
                    _handleEditStudent();
                  } else {
                    _handleSaveStudent();
                  }
                },
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _headlineWidget() {
    return Text(
      "* All fields are mandatory. ",
      style: AppStyles.semiBoldSecondTextStyle(
        color: AppColors.blackColor,
        fontSize: 15,
      ),
    );
  }

  Widget _titleWidget(String title) {
    return Text(
      title,
      style: AppStyles.mediumTextStyle(
        color: AppColors.blackColor,
        fontSize: 14,
      ),
    );
  }

  Widget _nameFieldWidget() {
    return CommonTextField(
      controller: _nameController,
      hint: "Please enter your name",
      error: false,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        _studentProvider.refreshState();
      },
    );
  }

  Widget _emailFieldWidget() {
    return CommonTextField(
      controller: _emailController,
      hint: "Please enter your email",
      error: false,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        _studentProvider.refreshState();
      },
    );
  }

  Widget addRadioButton(int btnValue, String title) {
    return Consumer<StudentProvider>(builder: (_, __, ___) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            activeColor: AppColors.blackColor,
            value: btnValue,
            groupValue: _groupValue,
            onChanged: (value) {
              _groupValue = btnValue;
              _studentProvider.refreshState();
            },
          ),
          Text(
            title,
            style: AppStyles.regularTextStyle(),
          )
        ],
      );
    });
  }

  Future<void> _handleSaveStudent() async {
    Loader.display(context);
    _studentDataModel?.id = UtilHelper.createUUID();
    _studentDataModel?.name = _nameController.text.trim();
    _studentDataModel?.email = _emailController.text.trim();
    _studentDataModel?.gender = _gender[_groupValue];
    _studentDataModel?.createdAt = DateTime.now().toString();
    _studentDataModel?.updatedAt = DateTime.now().toString();
    await UserStateHiveHelper.instance.saveStudent(_studentDataModel);
    Loader.close(context);
    Navigator.pop(context, true);
  }

  Future<void> _handleEditStudent() async {
    Loader.display(context);
    _studentDataModel?.id = widget.studentDataModel?.id;
    _studentDataModel?.name = _nameController.text.trim();
    _studentDataModel?.email = _emailController.text.trim();
    _studentDataModel?.gender = _gender[_groupValue];
    _studentDataModel?.createdAt = widget.studentDataModel?.createdAt;
    _studentDataModel?.updatedAt = DateTime.now().toString();
    await UserStateHiveHelper.instance.saveStudent(_studentDataModel);
    Loader.close(context);
    Navigator.pop(context, true);
  }
}
