import 'package:flutter/material.dart';
import 'package:guide_me/core/localization/generated/app_localizations.dart';

extension ContextExtention on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  Size get size => MediaQuery.sizeOf(this);
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
}
