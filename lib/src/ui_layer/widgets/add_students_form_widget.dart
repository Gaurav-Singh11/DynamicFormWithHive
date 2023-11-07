import 'package:flutter/material.dart';
import 'package:nsl_task/src/business_layer/provider/students_provider.dart';
import 'package:nsl_task/src/data_layer/models/student_data_model.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';
import 'package:nsl_task/src/data_layer/res/styles.dart';
import 'package:nsl_task/src/ui_layer/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class DynamicFormWidget extends StatefulWidget {
  final StudentDataModel dataModel;

  const DynamicFormWidget({Key? key, required this.dataModel})
      : super(key: key);

  @override
  State<DynamicFormWidget> createState() => _DynamicFormWidgetState();
}

class _DynamicFormWidgetState extends State<DynamicFormWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _gender = <String>["Male", "Female", "Other"];
  int _groupValue = -1;
  late StudentProvider _studentProvider;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _studentProvider = Provider.of<StudentProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return _mainApp(context);
  }

  Widget _mainApp(BuildContext context) {
    return Container(
      decoration: AppStyles.boxDecorationWithShadow(AppColors.whiteColor, 20),
      width: double.infinity,
      padding: AppStyles.pd8,
      child: _addStudentsScrollView(),
    );
  }

  Widget _addStudentsScrollView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppStyles.sbHeight10,
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
      ],
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
        widget.dataModel.name = _nameController.text.trim();
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
        widget.dataModel.email = _emailController.text.trim();
        _studentProvider.refreshState();
      },
    );
  }

  Widget addRadioButton(int btnValue, String title) {
    return Expanded(
      child: Consumer<StudentProvider>(builder: (_, __, ___) {
        return RadioListTile(
          contentPadding: AppStyles.pd0,
          splashRadius: 0,
          activeColor: AppColors.blackColor,
          value: btnValue,
          groupValue: _groupValue,
          title: Text(
            title,
            style: AppStyles.regularTextStyle(),
          ),
          onChanged: (value) {
            _groupValue = btnValue;
            widget.dataModel.gender = _gender[_groupValue];
            _studentProvider.refreshState();
          },
        );
      }),
    );
  }
}
