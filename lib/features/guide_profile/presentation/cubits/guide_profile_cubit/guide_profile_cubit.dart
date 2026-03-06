import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/spoken_languages_constants.dart';

part 'guide_profile_state.dart';

class GuideProfileCubit extends Cubit<GuideProfileState> {
  GuideProfileCubit() : super(GuideProfileState.initial());

  void toggleLangEditMode() {
    emit(
      state.copyWith(
        inEditLangusgesMode: !state.inEditLangusgesMode,
      ),
    );
  }

  void toggleCertificationEditMode() {
    emit(
      state.copyWith(
        inEditCertificationsMode: !state.inEditCertificationsMode,
      ),
    );
  }

  void addLanguage(String language) {
    emit(
      state.copyWith(
        languages: [...state.languages, language],
      ),
    );
  }

  void removeLanguage(String language) {
    emit(
      state.copyWith(
        languages: state.languages.where((l) => l != language).toList(),
      ),
    );
  }
}
