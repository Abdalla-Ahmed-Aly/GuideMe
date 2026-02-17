import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guide_me/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const GuideMe());
}
