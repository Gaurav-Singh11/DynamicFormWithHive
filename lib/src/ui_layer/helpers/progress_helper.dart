import 'package:flutter/material.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';

class Loader {
  static display(BuildContext context, [String message = ""]) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) {
          return const ProgressBar(
            opacity: 0,
          );
        },
      ),
    );
  }

  /// Function to stop circular progress bar
  static close(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }
}

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
