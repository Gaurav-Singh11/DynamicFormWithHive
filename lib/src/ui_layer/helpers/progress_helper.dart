import 'package:flutter/material.dart';
import 'package:nsl_task/src/ui_layer/widgets/progress_bar_widget.dart';

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


