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
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YmYxNjMwNGExOTNkNDM4NjQyZTk2NiIsInJvbGUiOiJ0b3VyaXN0IiwiaWF0IjoxNzc0MTM2MTQzfQ.0MQGitqCIVNJpXWREZnBJxS10Cj3Lgem3QMT5qHYMnE',
  );

  // // Clear any expired or invalid tokens for a clean login
  // await getIt<TokenService>().deleteToken();

  Bloc.observer = const AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const GuideMe());
}
