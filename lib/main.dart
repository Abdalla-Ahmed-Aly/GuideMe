import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // شغالة في debug بس
      builder: (context) => const GuideMe(),
    ),
    );
}