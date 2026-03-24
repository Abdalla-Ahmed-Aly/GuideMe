import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/app.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/utils/app_bloc_observer.dart';
import 'package:guide_me/core/utils/hive_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await HiveHelper.init();
  await setupGetIt();

  Bloc.observer = const AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const GuideMe());
}
