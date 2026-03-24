import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/localization/generated/app_localizations.dart';
import 'package:guide_me/core/responsive/responsive_config.dart';
import 'package:guide_me/core/routes/router.dart';
import 'package:guide_me/core/theme/app_theme.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart';

class GuideMe extends StatelessWidget {
  const GuideMe({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TouristNavBarCubit()..init(),
        ),
        BlocProvider(
          create: (context) => getIt<GetHomeCubit>()..getHomeData(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAiPackageCubit>()..getAiPackages(),
        ),
      ],
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
