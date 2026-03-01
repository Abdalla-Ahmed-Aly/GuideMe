import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/localization/generated/app_localizations.dart';
import 'package:guide_me/core/responsive/responsive_config.dart';
import 'package:guide_me/core/routes/router.dart';
import 'package:guide_me/core/theme/app_theme.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart';

class GuideMe extends StatelessWidget {
  const GuideMe({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    return BlocProvider(
      create: (context) => TouristNavBarCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'GuideMe',
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.appRouter,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
