import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/spoken_languages_constants.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import 'package:guide_me/core/services/media_picker_service/media_picker_service.dart';

part 'guide_profile_state.dart';

class GuideProfileCubit extends Cubit<GuideProfileState> {
  GuideProfileCubit(this._mediaPickerService) : super(GuideProfileState.initial());
  final MediaPickerService _mediaPickerService;

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

  void addCertification(String certification) {
    emit(
      state.copyWith(
        certifications: [...state.certifications, certification],
      ),
    );
  }

  void removeCertification(String certification) {
    emit(
      state.copyWith(
        certifications: state.certifications.where((c) => c != certification).toList(),
      ),
    );
  }

  void updateProfileImage(String certification) {
    final updatedCertifications = state.certifications.where((c) => c != certification).toList();
    emit(
      state.copyWith(
        certifications: updatedCertifications,
      ),
    );
  }

  Future<void> pickCertificationFile() async {
    final pickedFile = await _mediaPickerService.pickFile(
      allowedExtensions: ['pdf', 'jpeg', 'png'],
    );
    if (pickedFile != null) {
      emit(state.copyWith(certificationName: pickedFile));
    }
  }
}
