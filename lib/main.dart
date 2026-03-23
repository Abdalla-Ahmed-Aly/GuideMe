import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/app.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/utils/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // await getIt<TokenService>().saveToken(
  //   "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YTJmZTBjZDg0NjI5MDhjYjlhYTVhYiIsInJvbGUiOiJ0b3VyaXN0IiwiaWF0IjoxNzcyMjg5NjE4fQ.SUrwoofufEYnl9fhhZZ6NvWjyF4gr5sWB4X92yDYkhk",
  // );

  Bloc.observer = const AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const GuideMe());
}
