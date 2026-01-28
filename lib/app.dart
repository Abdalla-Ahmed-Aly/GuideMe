import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/core/localization/generated/app_localizations.dart';
import 'package:guide_me/core/responsive/responsive_config.dart';
import 'package:guide_me/core/routes/router.dart';
import 'package:guide_me/core/theme/app_theme.dart';
  
class GuideMe extends StatelessWidget {
  const GuideMe({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GuideMe',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.appRouter,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      
    );
  }
}
