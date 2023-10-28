import 'package:flutter/widgets.dart';
import 'package:nsl_task/src/data_layer/models/student_data_model.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';
import 'package:nsl_task/src/data_layer/res/numbers.dart';
import 'package:nsl_task/src/data_layer/res/styles.dart';
import 'package:nsl_task/src/ui_layer/widgets/app_button_widget.dart';

class StudentCardWidget extends StatelessWidget {
  final StudentDataModel studentDataModel;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;

  const StudentCardWidget({
    Key? key,
    required this.studentDataModel,
    this.onDeleteTap,
    this.onEditTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.boxDecorationWithShadow(AppColors.whiteColor, 20),
      width: double.infinity,
      padding: AppStyles.pd15,
      child: Column(
        children: [
          _addField("Name", studentDataModel.name),
          AppStyles.sbHeight5,
          _addField("Email", studentDataModel.email),
          AppStyles.sbHeight5,
          _addField("Gender", studentDataModel.gender),
          AppStyles.sbHeight5,
          Row(
            children: [
              Expanded(
                child: AppButtonWidget(
                  onPressed: onDeleteTap,
                  title: "Delete",
                  active: true,
                ),
              ),
              AppStyles.sbWidth10,
              Expanded(
                child: AppButtonWidget(
                  title: "Edit",
                  onPressed: onEditTap,
                  active: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addField(String title, String? value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyles.mediumTextStyle(
              color: AppColors.blackColor,
              fontSize: 14,
              height: onePointFive,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value ?? "",
            style: AppStyles.regularTextStyle(
              color: AppColors.blackColor,
              fontSize: 14,
              height: onePointFive,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
