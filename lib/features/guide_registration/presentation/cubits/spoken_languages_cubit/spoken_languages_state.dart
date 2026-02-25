part of 'spoken_languages_cubit.dart';

class SpokenLanguagesState {
  final List<String> selectedLanguages;
  final List<String> showedLanguages;
  final List<String> allLanguages;

  const SpokenLanguagesState({
    required this.selectedLanguages,
    required this.showedLanguages,
    required this.allLanguages,
  });

  SpokenLanguagesState copyWith({
    List<String>? selectedLanguages,
    List<String>? showedLanguages,
    List<String>? allLanguages,
  }) {
    return SpokenLanguagesState(
      selectedLanguages:
          selectedLanguages ?? this.selectedLanguages,
      showedLanguages:
          showedLanguages ?? this.showedLanguages,
      allLanguages: allLanguages ?? this.allLanguages,
    );
  }
}

