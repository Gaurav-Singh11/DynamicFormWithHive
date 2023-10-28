import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';
import 'package:nsl_task/src/data_layer/res/numbers.dart';

class AppStyles {
  /// BorderRadius
  static final BorderRadius br8 = BorderRadius.circular(d_8);
  static final BorderRadius br9 = BorderRadius.circular(d_9);
  static final BorderRadius br10 = BorderRadius.circular(d_10);
  static final BorderRadius br14 = BorderRadius.circular(d_14);
  static final BorderRadius br15 = BorderRadius.circular(d_15);
  static final BorderRadius br16 = BorderRadius.circular(d_16);
  static final BorderRadius br18 = BorderRadius.circular(d_18);
  static final BorderRadius br20 = BorderRadius.circular(d_20);
  static final BorderRadius br25 = BorderRadius.circular(d_25);
  static final BorderRadius br27 = BorderRadius.circular(d_27);
  static final BorderRadius br30 = BorderRadius.circular(d_30);
  static final BorderRadius br35 = BorderRadius.circular(d_35);
  static final BorderRadius br40 = BorderRadius.circular(d_40);
  static final BorderRadius br45 = BorderRadius.circular(d_45);
  static final BorderRadius br50 = BorderRadius.circular(d_50);
  static final BorderRadius br100 = BorderRadius.circular(d_100);

  /// Shape
  static RoundedRectangleBorder radius20RectangularShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(d_20),
    );
  }

  static RoundedRectangleBorder bottomSheetTopCornersShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(d_20),
        topRight: Radius.circular(d_20),
      ),
    );
  }

  static BoxDecoration radiusBoxDecoration(
      {Color color = AppColors.whiteColor,
      double radius = d_10,
      Color? borderColor}) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(
          color: borderColor ?? color,
          width: borderColor != null ? 1 : 0,
        ));
  }

  static BoxDecoration boxDecorationWithShadow(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.16),
          offset: const Offset(d_3, d_3),
          blurRadius: d_6,
        ),
      ],
    );
  }

  static BoxDecoration boxDecoration(
      {Color color = AppColors.whiteColor, double radius = 10}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  /// Text styles
  static regularTextStyle(
      {Color color = AppColors.blackColor,
      double fontSize = d_14,
      double height = onePointFive,
      TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static mediumTextStyle(
      {Color color = AppColors.whiteColor,
      double fontSize = d_14,
      double height = onePointFive,
      TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static semiBoldSecondTextStyle(
      {Color color = AppColors.whiteColor,
      double fontSize = d_14,
      double height = onePointFive,
      TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: FontWeight.w700,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static semiBoldTextStyle(
      {Color color = AppColors.whiteColor,
      double fontSize = d_16,
      double height = onePointFive,
      TextDecoration? decoration = TextDecoration.none}) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  /// Method used to get font size according to device
  static double getFontSize(double value) {
    return value;
  }

  /// Method used to get height according to device
  static double getHeight(double value) {
    return value;
  }

  /// Method used to get width according to device
  static double getWidth(double value) {
    return value;
  }

  /// Paddings
  static EdgeInsets pd0 = const EdgeInsets.all(d_0);
  static EdgeInsets pd1 = const EdgeInsets.all(d_1);
  static EdgeInsets pd2 = const EdgeInsets.all(d_2);
  static EdgeInsets pd3 = const EdgeInsets.all(d_3);
  static EdgeInsets pd4 = const EdgeInsets.all(d_4);
  static EdgeInsets pd5 = const EdgeInsets.all(d_5);
  static EdgeInsets pd6 = const EdgeInsets.all(d_6);
  static EdgeInsets pd7 = const EdgeInsets.all(d_7);
  static EdgeInsets pd8 = const EdgeInsets.all(d_8);
  static EdgeInsets pd9 = const EdgeInsets.all(d_9);
  static EdgeInsets pd10 = const EdgeInsets.all(d_10);
  static EdgeInsets pd11 = const EdgeInsets.all(d_11);
  static EdgeInsets pd12 = const EdgeInsets.all(d_12);
  static EdgeInsets pd13 = const EdgeInsets.all(d_13);
  static EdgeInsets pd14 = const EdgeInsets.all(d_14);
  static EdgeInsets pd15 = const EdgeInsets.all(d_15);
  static EdgeInsets pd16 = const EdgeInsets.all(d_16);
  static EdgeInsets pd17 = const EdgeInsets.all(d_17);
  static EdgeInsets pd18 = const EdgeInsets.all(d_18);
  static EdgeInsets pd19 = const EdgeInsets.all(d_19);
  static EdgeInsets pd20 = const EdgeInsets.all(d_20);
  static EdgeInsets pd21 = const EdgeInsets.all(d_21);
  static EdgeInsets pd23 = const EdgeInsets.all(d_23);
  static EdgeInsets pd24 = const EdgeInsets.all(d_24);
  static EdgeInsets pd25 = const EdgeInsets.all(d_25);
  static EdgeInsets pd30 = const EdgeInsets.all(d_30);
  static EdgeInsets pd35 = const EdgeInsets.all(d_35);
  static EdgeInsets pd40 = const EdgeInsets.all(d_40);
  static EdgeInsets pd45 = const EdgeInsets.all(d_45);
  static EdgeInsets pd50 = const EdgeInsets.all(d_50);
  static EdgeInsets pd100 = const EdgeInsets.all(d_100);

  static EdgeInsets pdT5 = const EdgeInsets.only(top: d_5);
  static EdgeInsets pdT8 = const EdgeInsets.only(top: d_8);
  static EdgeInsets pdT10 = const EdgeInsets.only(top: d_10);
  static EdgeInsets pdT15 = const EdgeInsets.only(top: d_15);
  static EdgeInsets pdL27 = const EdgeInsets.only(left: d_27);
  static EdgeInsets pdL30 = const EdgeInsets.only(left: d_30);

  static const EdgeInsets pdH4 = EdgeInsets.symmetric(horizontal: d_4);
  static const EdgeInsets pdH8 = EdgeInsets.symmetric(horizontal: d_8);
  static const EdgeInsets pdH10 = EdgeInsets.symmetric(horizontal: d_10);

  static const EdgeInsets screenHorizontalPadding = EdgeInsets.symmetric(
    horizontal: d_20,
  );
  static const EdgeInsets textFieldContentPadding = EdgeInsets.symmetric(
    horizontal: d_15,
    vertical: d_10,
  );

  /// Sized Box
  static final SizedBox sbHeight1 = SizedBox(height: getHeight(d_1));
  static final SizedBox sbHeight2 = SizedBox(height: getHeight(d_2));
  static final SizedBox sbHeight3 = SizedBox(height: getHeight(d_3));
  static final SizedBox sbHeight4 = SizedBox(height: getHeight(d_4));
  static final SizedBox sbHeight5 = SizedBox(height: getHeight(d_5));
  static final SizedBox sbHeight6 = SizedBox(height: getHeight(d_6));
  static final SizedBox sbHeight7 = SizedBox(height: getHeight(d_7));
  static final SizedBox sbHeight8 = SizedBox(height: getHeight(d_8));
  static final SizedBox sbHeight9 = SizedBox(height: getHeight(d_9));
  static final SizedBox sbHeight10 = SizedBox(height: getHeight(d_10));
  static final SizedBox sbHeight11 = SizedBox(height: getHeight(d_11));
  static final SizedBox sbHeight12 = SizedBox(height: getHeight(d_12));
  static final SizedBox sbHeight13 = SizedBox(height: getHeight(d_13));
  static final SizedBox sbHeight14 = SizedBox(height: getHeight(d_14));
  static final SizedBox sbHeight15 = SizedBox(height: getHeight(d_15));
  static final SizedBox sbHeight16 = SizedBox(height: getHeight(d_16));
  static final SizedBox sbHeight17 = SizedBox(height: getHeight(d_17));
  static final SizedBox sbHeight18 = SizedBox(height: getHeight(d_18));
  static final SizedBox sbHeight19 = SizedBox(height: getHeight(d_19));
  static final SizedBox sbHeight20 = SizedBox(height: getHeight(d_20));
  static final SizedBox sbHeight21 = SizedBox(height: getHeight(d_21));
  static final SizedBox sbHeight22 = SizedBox(height: getHeight(d_22));
  static final SizedBox sbHeight24 = SizedBox(height: getHeight(d_24));
  static final SizedBox sbHeight25 = SizedBox(height: getHeight(d_25));
  static final SizedBox sbHeight26 = SizedBox(height: getHeight(d_26));
  static final SizedBox sbHeight27 = SizedBox(height: getHeight(d_27));
  static final SizedBox sbHeight28 = SizedBox(height: getHeight(d_28));
  static final SizedBox sbHeight29 = SizedBox(height: getHeight(d_29));
  static final SizedBox sbHeight30 = SizedBox(height: getHeight(d_30));
  static final SizedBox sbHeight31 = SizedBox(height: getHeight(d_31));
  static final SizedBox sbHeight32 = SizedBox(height: getHeight(d_32));
  static final SizedBox sbHeight34 = SizedBox(height: getHeight(d_34));
  static final SizedBox sbHeight36 = SizedBox(height: getHeight(d_36));
  static final SizedBox sbHeight39 = SizedBox(height: getHeight(d_39));
  static final SizedBox sbHeight40 = SizedBox(height: getHeight(d_40));
  static final SizedBox sbHeight44 = SizedBox(height: getHeight(d_44));
  static final SizedBox sbHeight47 = SizedBox(height: getHeight(d_47));
  static final SizedBox sbHeight50 = SizedBox(height: getHeight(d_50));
  static final SizedBox sbHeight53 = SizedBox(height: getHeight(d_53));
  static final SizedBox sbHeight48 = SizedBox(height: getHeight(d_48));
  static final SizedBox sbHeight67 = SizedBox(height: getHeight(d_67));
  static final SizedBox sbHeight73 = SizedBox(height: getHeight(d_73));
  static final SizedBox sbHeight100 = SizedBox(height: getHeight(d_100));
  static final SizedBox sbWidth1 = SizedBox(width: getWidth(d_1));
  static final SizedBox sbWidth2 = SizedBox(width: getWidth(d_2));
  static final SizedBox sbWidth3 = SizedBox(width: getWidth(d_3));
  static final SizedBox sbWidth4 = SizedBox(width: getWidth(d_4));
  static final SizedBox sbWidth5 = SizedBox(width: getWidth(d_5));
  static final SizedBox sbWidth6 = SizedBox(width: getWidth(d_6));
  static final SizedBox sbWidth7 = SizedBox(width: getWidth(d_7));
  static final SizedBox sbWidth8 = SizedBox(width: getWidth(d_8));
  static final SizedBox sbWidth9 = SizedBox(width: getWidth(d_9));
  static final SizedBox sbWidth10 = SizedBox(width: getWidth(d_10));
  static final SizedBox sbWidth11 = SizedBox(width: getWidth(d_11));
  static final SizedBox sbWidth12 = SizedBox(width: getWidth(d_12));
  static final SizedBox sbWidth13 = SizedBox(width: getWidth(d_13));
  static final SizedBox sbWidth14 = SizedBox(width: getWidth(d_14));
  static final SizedBox sbWidth15 = SizedBox(width: getWidth(d_15));
  static final SizedBox sbWidth20 = SizedBox(width: getWidth(d_20));
  static final SizedBox sbWidth25 = SizedBox(width: getWidth(d_25));
  static final SizedBox sbWidth50 = SizedBox(width: getWidth(d_50));
  static final SizedBox bottomSheetSpace = SizedBox(height: getHeight(d_34));

  /// Method used to set portrait device orientation of the app
  static void setDeviceOrientationOfApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  /// Method used to set landscape device orientation of the app
  static void setLandScapeDeviceOrientationOfApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  /// Method used get app theme
  static ThemeData getAppTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      primaryColor: AppColors.whiteColor,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.primarySwatch,
      ).copyWith(
        secondary: AppColors.mainColor,
      ),
    );
  }
}
