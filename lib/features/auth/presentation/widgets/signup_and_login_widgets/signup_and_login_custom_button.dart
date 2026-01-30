import 'package:flutter/material.dart';

class SignupAndLoginCustomButton extends StatelessWidget {
  const SignupAndLoginCustomButton({
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
        // width: 353.w,
        // height: 56.h,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
