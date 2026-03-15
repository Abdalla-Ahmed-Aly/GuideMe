import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/app.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/utils/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  // Temporary token injection for home page development
  await getIt<TokenService>().saveToken(
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ODM4MGZhOTM2ZDAyMmNiM2Y4NGUzNSIsInJvbGUiOiJndWlkZSIsImlhdCI6MTc3MjExNjk5OH0.MMeeKRF_40l9ZEAoGDMkTbS2axFt05sGTFw4X-43q9E',
  );

  Bloc.observer = const AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const GuideMe());
}
