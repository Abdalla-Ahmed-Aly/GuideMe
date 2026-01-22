import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/responsive_config.dart';

extension ResponsiveExtension on num {
  SizedBox get horizontalSpace => SizedBox(width: ResponsiveConfig.width(toDouble()));
  SizedBox get verticalSpace => SizedBox(height: ResponsiveConfig.height(toDouble()));
  double get w => ResponsiveConfig.width(toDouble());
  double get h => ResponsiveConfig.height(toDouble());
  double get fs => ResponsiveConfig.fontSize(toDouble());
  double get ic => ResponsiveConfig.icon(toDouble());
  double get r => ResponsiveConfig.radius(toDouble());
  double get p => ResponsiveConfig.padding(toDouble());
  double get m => ResponsiveConfig.margin(toDouble());
}
