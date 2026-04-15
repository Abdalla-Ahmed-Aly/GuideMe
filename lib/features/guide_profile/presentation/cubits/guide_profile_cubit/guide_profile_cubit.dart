import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/guide_profile/domain/use_cases/update_bio_use_case.dart';
import 'package:guide_me/features/guide_profile/domain/use_cases/update_languages_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';

part 'guide_profile_state.dart';

@injectable
class GuideProfileCubit extends Cubit<GuideProfileState> {
  GuideProfileCubit(this._updateBioUseCase, this._updateLanguagesUseCase)
    : super(GuideProfileInitial());
  final UpdateBioUseCase _updateBioUseCase;
  final UpdateLanguagesUseCase _updateLanguagesUseCase;

  bool isAddingLanguage = false;
  bool isDeletingLanguage = false;
  bool isUpdatingBio = false;

  bool languageInEditMode = false;
  bool certificationInEditMode = false;

  void safeEmit(GuideProfileState state) {
    if (!isClosed) emit(state);
  }

  Future<void> updateBio({required String userId, required String bio}) async {
    safeEmit(GuideProfileLoading());
    final result = await _updateBioUseCase.call(userId: userId, bio: bio);
    result.fold(
      (failure) => safeEmit(GuideProfileFailure(failure: failure)),
      (user) {
        isUpdatingBio = true;
        safeEmit(GuideProfileSuccess(user: user));
      },
    );
  }

  Future<void> deleteLanguage({
    required String userId,
    required String language,
    required List<String> languages,
  }) async {
    final updatedLanguages = List<String>.from(languages);
    updatedLanguages.remove(language);
    safeEmit(GuideProfileLoading(language: language));
    final result = await _updateLanguagesUseCase.call(
      userId: userId,
      languages: updatedLanguages,
    );
    result.fold(
      (failure) => safeEmit(GuideProfileFailure(failure: failure)),
      (user) {
        isDeletingLanguage = true;
        safeEmit(GuideProfileSuccess(user: user));
      },
    );
  }

  Future<void> addLanguage({
    required String userId,
    required String language,
    required List<String> languages,
  }) async {
    final updatedLanguages = List<String>.from(languages);
    updatedLanguages.add(language);
    safeEmit(GuideProfileLoading());
    final result = await _updateLanguagesUseCase.call(
      userId: userId,
      languages: updatedLanguages,
    );
    result.fold(
      (failure) => safeEmit(GuideProfileFailure(failure: failure)),
      (user) {
        isAddingLanguage = true;
        safeEmit(GuideProfileSuccess(user: user));
      },
    );
  }

  void toggleLanguageEditMode() {
    languageInEditMode = !languageInEditMode;
    safeEmit(GuideProfileInitial());
  }

  void toggleCertificationEditMode() {
    certificationInEditMode = !certificationInEditMode;
    safeEmit(GuideProfileInitial());
  }
}
