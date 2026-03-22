import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import 'package:guide_me/core/services/media_picker_service/media_picker_service.dart';

part 'professional_info_state.dart';

class ProfessionalInfoCubit extends Cubit<ProfessionalInfoState> {
  ProfessionalInfoCubit(this._mediaPickerService)
    : super(ProfessionalInfoState());

  final MediaPickerService _mediaPickerService;

  Future<void> pickProfilePhoto() async {
    final pickedFile = await _mediaPickerService.pickImage();
    if (pickedFile != null) {
      emit(state.copyWith(profilePhoto: pickedFile));
    }
  }

  Future<void> pickNationalId() async {
    final pickedFiles = await _mediaPickerService.pickFiles(
      allowedExtensions: ['pdf', 'jpeg', 'png'],
    );
    if (pickedFiles.isNotEmpty) {
      emit(state.copyWith(nationalId: pickedFiles));
    }
  }

  Future<void> pickTourGuideLicense() async {
    final pickedFile = await _mediaPickerService.pickFile(
      allowedExtensions: ['pdf', 'jpeg', 'png'],
    );
    if (pickedFile != null) {
      emit(state.copyWith(tourGuideLicense: pickedFile));
    }
  }
}
