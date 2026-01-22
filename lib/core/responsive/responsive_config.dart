import 'package:flutter/material.dart';

class ResponsiveConfig {
  static const double _designWidth = 430;
  static const double _designHeight = 932;

  static late double screenWidth;
  static late double screenHeight;

  static late double scaleWidth;
  static late double scaleHeight;
  static late double scaleText;
  static late double scaleIcon;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;

    screenWidth = size.width;
    screenHeight = size.height;

    scaleWidth = screenWidth / _designWidth;
    scaleHeight = screenHeight / _designHeight;

    // font scaling controlled
    scaleText = scaleWidth.clamp(0.7, 1.5);
    scaleIcon = scaleWidth.clamp(0.7, 1.5);
  }

  // Responsive Width
  static double width(double value) => value * scaleWidth;

  // Responsive Height
  static double height(double value) => value * scaleHeight;

  // Responsive Font Size
  static double fontSize(double value) => value * scaleText;
  
  // Responsive Icon
  static double icon(double value) => value * scaleIcon;

  // Responsive Radius
  static double radius(double value) => value * scaleWidth;

  // Responsive padding
  static double padding(double value) => value * scaleWidth;
  
  // Responsive Margin
  static double margin(double value) => value * scaleWidth;
}
