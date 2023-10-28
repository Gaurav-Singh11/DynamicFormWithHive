import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsl_task/src/data_layer/res/colors.dart';
import 'package:nsl_task/src/data_layer/res/numbers.dart';
import 'package:nsl_task/src/data_layer/res/styles.dart';


class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.error = false,
    this.inputFormatters,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
    this.radius,
    this.name = false,
    this.obscureText = false,
    this.suffixIcon,
    this.filled = true,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.maxLength,
    this.enabled = true,
    this.prefixIcon,
    this.style,
    this.textInputAction,
    this.onTap,
    this.fillColor,
    this.onPrefixTap,
    this.onSuffixTap,
    this.prefixConstraints,
    this.maxLines = 1,
    this.minLines = 1,
    this.toolBarOptions = true,
    this.shouldShowBorder = false,
    this.autofocus = false,
    this.suffixConstraints,
    this.contentPadding,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hint;
  final bool error;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool name;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool filled;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final int? maxLength;
  final bool enabled;
  final TextStyle? style;
  final void Function()? onTap;
  final Color? fillColor;
  final void Function()? onPrefixTap;
  final void Function()? onSuffixTap;
  final double? radius;
  final BoxConstraints? prefixConstraints;
  final int maxLines;
  final int minLines;
  final bool toolBarOptions;
  final bool shouldShowBorder;
  final bool autofocus;
  final BoxConstraints? suffixConstraints;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus,
      obscureText: obscureText,
      obscuringCharacter: "*",
      enabled: true,
      onChanged: onChanged,
      maxLength: maxLength,
      onTap: onTap,
      onSubmitted: onSubmitted,
      cursorWidth: d_2,
      maxLines: maxLines,
      minLines: minLines,
      cursorRadius: const Radius.circular(d_10),
      controller: controller,
      scrollPhysics: const ClampingScrollPhysics(),
      style: style ?? AppStyles.regularTextStyle(),
      cursorColor: AppColors.blackColor,
      // cursorHeight: Platform.isIOS && !DeviceInfo.extraLargeDevice ? d_15 : d_20,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      keyboardAppearance: Brightness.light,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      decoration: InputDecoration(
        counterText: "",
        filled: filled,
        fillColor: fillColor ?? AppColors.whiteColor,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onSuffixTap ?? () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: d_1,
                icon: suffixIcon!,
              )
            : null,
        prefixIconConstraints: prefixConstraints,
        prefixIcon: prefixIcon != null
            ? IconButton(
                onPressed: onPrefixTap ?? () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: d_1,
                icon: prefixIcon!,
              )
            : null,
        hintText: hint,
        suffixIconConstraints: suffixConstraints,
        hintStyle: AppStyles.regularTextStyle(
          color: AppColors.greyColor,
          fontSize: d_16,
        ),
        focusedBorder: _inputBorder(),
        enabledBorder: _inputBorder(),
        isDense: true,
        border: _inputBorder(),
        contentPadding: contentPadding ?? AppStyles.textFieldContentPadding,
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        // color: error
        //     ? AppColors.lightRedColor
        //     : (shouldShowBorder
        //     ? AppColors.whiteColor
        //     : AppColors.textFieldBackgroundColor),
        width: pointFive,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          radius ?? d_5,
        ),
      ),
    );
  }
}
