import 'package:flutter/material.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';

class ProgressBar extends StatelessWidget {
  final double opacity;

  const ProgressBar({
    Key? key,
    this.opacity = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: AppColors.blackColor.withOpacity(opacity),
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: AppColors.blackColor,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
