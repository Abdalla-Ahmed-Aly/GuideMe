import 'package:flutter/material.dart';

class CustomTextspan extends StatelessWidget {
  const CustomTextspan(
    this.text,
    this.color,
    this.style,
    this.text1,
    this.color1,
    this.style1, {
    super.key,
  });
  final String text;
  final Color color;
  final TextStyle style;
  final String text1;
  final Color color1;
  final TextStyle style1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: style.copyWith(
                  color: color,
                ),
              ),
              TextSpan(
                text: text1,
                style: style1.copyWith(
                  color: color1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
