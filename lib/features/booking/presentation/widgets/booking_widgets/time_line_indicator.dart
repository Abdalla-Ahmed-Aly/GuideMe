import 'package:flutter/material.dart';

class TimeLineIndicator extends StatelessWidget {
  const TimeLineIndicator({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    this.borderWidth = 3,
    this.child,
  });

  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: child != null ? const EdgeInsets.all(1) : null,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }
}
