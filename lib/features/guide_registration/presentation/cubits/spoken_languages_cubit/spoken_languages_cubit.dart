import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/spoken_languages_constants.dart';

part 'spoken_languages_state.dart';

class SpokenLanguagesCubit
    extends Cubit<SpokenLanguagesState> {
  SpokenLanguagesCubit()
      : super(
          SpokenLanguagesState(
            selectedLanguages: [],
            showedLanguages:
                SpokenLanguagesConstants.languages
                    .sublist(0, 4),
            allLanguages: SpokenLanguagesConstants.languages,
          ),
        );

  void toggleLanguage(String language) {
    final updatedSelected =
        List<String>.from(state.selectedLanguages);
    final updatedShowed =
        List<String>.from(state.showedLanguages);

    if (updatedSelected.contains(language)) {
      updatedSelected.remove(language);
    } else {
      updatedSelected.add(language);
      if (!updatedShowed.contains(language)) {
        updatedShowed.add(language);
      }
    }

    emit(
      state.copyWith(
        selectedLanguages: updatedSelected,
        showedLanguages: updatedShowed,
      ),
    );
  }

  void addLanguages(List<String> languages) {
    final updatedSelected = List<String>.from(state.selectedLanguages);
    final updatedShowed = List<String>.from(state.showedLanguages);

    for (var language in languages) {
      if (!updatedSelected.contains(language)) {
        updatedSelected.add(language);
      }
      if (!updatedShowed.contains(language)) {
        updatedShowed.add(language);
      }
    }

    emit(
      state.copyWith(
        selectedLanguages: updatedSelected,
        showedLanguages: updatedShowed,
      ),
    );
  }
}