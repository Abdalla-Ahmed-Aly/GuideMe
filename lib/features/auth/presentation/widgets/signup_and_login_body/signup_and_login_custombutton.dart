import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';


class SignupAndLoginCustombutton extends StatelessWidget {
  const SignupAndLoginCustombutton({
    super.key,
    this.text,
    this.backgroundColor,
    this.ontap,
    this.textStyle,
    this.bordercolor,
  });
  final String? text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? bordercolor;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 353.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: bordercolor ?? Colors.transparent,
          ),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            text!,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
