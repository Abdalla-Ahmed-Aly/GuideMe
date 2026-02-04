import 'package:flutter/material.dart';
import 'package:guide_me/core/localization/generated/app_localizations.dart';

extension ContextExtention on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  
}
