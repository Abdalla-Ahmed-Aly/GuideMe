import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/utils/hive_helper.dart';

@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(_getInitialLocale());

  static Locale _getInitialLocale() {
    final saved = HiveHelper.get<String>(
      boxName: HiveConstants.localeBox,
      key: HiveConstants.localeKey,
    );
    return Locale(saved ?? 'en');
  }

  Future<void> toggle() async {
    final newLocale = state.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');

    await HiveHelper.put<String>(
      boxName: HiveConstants.localeBox,
      key: HiveConstants.localeKey,
      data: newLocale.languageCode,
    );

    emit(newLocale);
  }
}