part of 'guide_profile_cubit.dart';

class GuideProfileState {
  final bool inEditLangusgesMode;
  final bool inEditCertificationsMode;
  final List<String> languages;
  final List<String> certifications;
  PickedFileModel? certificationName;

  GuideProfileState({
    required this.inEditLangusgesMode,
    required this.inEditCertificationsMode,
    required this.languages,
    required this.certifications,
    this.certificationName,
  });

  factory GuideProfileState.initial() {
    return GuideProfileState(
      languages: SpokenLanguagesConstants.languages.sublist(0, 3),
      certifications: [],
      inEditLangusgesMode: false,
      inEditCertificationsMode: false,
      certificationName: null,
    );
  }

  GuideProfileState copyWith({
    bool? inEditLangusgesMode,
    bool? inEditCertificationsMode,
    List<String>? languages,
    List<String>? certifications,
    PickedFileModel? certificationName,
  }) {
    return GuideProfileState(
      languages: languages ?? this.languages,
      certifications: certifications ?? this.certifications,
      inEditLangusgesMode: inEditLangusgesMode ?? this.inEditLangusgesMode,
      inEditCertificationsMode:
          inEditCertificationsMode ?? this.inEditCertificationsMode,
      certificationName: certificationName ?? this.certificationName,
    );
  }
}
