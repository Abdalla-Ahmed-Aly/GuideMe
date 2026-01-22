import 'package:flutter/material.dart';
import 'package:guide_me/core/localization/generated/app_localizations.dart';

extension ContextExtention on BuildContext {
  dynamic get l10n => AppLocalizations.of(this)!;
}
