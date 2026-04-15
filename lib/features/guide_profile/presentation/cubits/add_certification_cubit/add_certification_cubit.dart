import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/services/media_picker_service/media_picker_service.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import 'package:guide_me/features/guide_profile/data/models/add_certification_model.dart';
import 'package:guide_me/features/guide_profile/domain/use_cases/add_certification_use_case.dart';
import 'package:guide_me/features/guide_profile/domain/use_cases/delete_certificate_use_case.dart';
import 'package:injectable/injectable.dart';

part 'add_certification_state.dart';

@injectable
class AddCertificationCubit extends Cubit<AddCertificationState> {
  AddCertificationCubit(this._addCertificationUseCase, this._mediaPickerService, this._deleteCertificateUseCase)
    : super(AddCertificationInitial());
  final AddCertificationUseCase _addCertificationUseCase;
  final DeleteCertificateUseCase _deleteCertificateUseCase;
  final MediaPickerService _mediaPickerService;

  PickedFileModel? certificationFile;
  String? certificationName;
  String? certificationOrganization;
  String? certificationIssueDate;
  String? certificationExpiryDate;

  void safeEmit(AddCertificationState state) {
    if (!isClosed) emit(state);
  }

  Future<void> pickCertificationFile() async {
    final pickedFile = await _mediaPickerService.pickFile(
      allowedExtensions: ['pdf', 'jpeg', 'png'],
    );
    if (pickedFile != null) {
      certificationFile = pickedFile;
      safeEmit(AddCertificationInitial());
    }
  }

  void removeCertificationFile() {
    certificationFile = null;
    safeEmit(AddCertificationInitial());
  }

  Future<void> addCertification({
    required String userId,
  }) async {
    safeEmit(AddCertificationLoading());
    final certification = AddCertificationModel(
      name: certificationName!,
      organization: certificationOrganization!,
      issueDate: certificationIssueDate!,
      expirationDate: certificationExpiryDate,
      certificate: certificationFile!,
    );
    final result = await _addCertificationUseCase.call(
      userId,
      certification,
    );
    result.fold(
      (failure) => safeEmit(AddCertificationFailure(failure: failure)),
      (user) => safeEmit(AddCertificationSuccess(user: user)),
    );
  }

  Future<void> deleteCertification({
    required String userId,
    required String certificationId,
  }) async {
    safeEmit(AddCertificationLoading());
    final result = await _deleteCertificateUseCase.call(
      userId,
      certificationId,
    );
    result.fold(
      (failure) => safeEmit(AddCertificationFailure(failure: failure)),
      (user) => safeEmit(AddCertificationSuccess(user: user)),
    );
  }

  bool validateCertificationForm() {
    return certificationName != null &&
        certificationName!.isNotEmpty &&
        certificationOrganization != null &&
        certificationOrganization!.isNotEmpty &&
        certificationIssueDate != null &&
        certificationIssueDate!.isNotEmpty &&
        certificationFile != null;
  }
}
