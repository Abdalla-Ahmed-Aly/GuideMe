part of 'professional_info_cubit.dart';

class ProfessionalInfoState {
  final PickedFileModel? profilePhoto;
  final List<PickedFileModel?> nationalId;
  final PickedFileModel? tourGuideLicense;

  ProfessionalInfoState({
    this.profilePhoto,
    this.nationalId = const [],
    this.tourGuideLicense,
  });

  ProfessionalInfoState copyWith({
    PickedFileModel? profilePhoto,
    List<PickedFileModel?>? nationalId,
    PickedFileModel? tourGuideLicense,
  }) {
    return ProfessionalInfoState(
      profilePhoto: profilePhoto ?? this.profilePhoto,
      nationalId: nationalId ?? this.nationalId,
      tourGuideLicense: tourGuideLicense ?? this.tourGuideLicense,
    );
  }
}
