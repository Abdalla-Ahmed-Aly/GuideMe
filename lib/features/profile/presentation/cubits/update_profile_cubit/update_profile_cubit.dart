import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';
import 'package:guide_me/core/location_core/domain/use_cases/get_current_location_use_case.dart';
import 'package:guide_me/core/services/media_picker_service/media_picker_service.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import 'package:guide_me/features/profile/data/models/update_profile_request_model.dart';
import 'package:guide_me/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:injectable/injectable.dart';

part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(
    this._updateProfileUseCase,
    this._getCurrentLocationUseCase,
    this._mediaPickerService,
  ) : super(UpdateProfileState());
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;
  final MediaPickerService _mediaPickerService;

  void safeEmit(UpdateProfileState state) {
    if (!isClosed) emit(state);
  }

  Future<void> pickProfilePhoto() async {
    final pickedFile = await _mediaPickerService.pickImage();
    if (pickedFile != null) {
      safeEmit(state.copyWith(selectedPhoto: pickedFile));
    }
  }

  void init(UserEntity user) {
    emit(state.copyWith(networkPhotoUrl: user.photoUrl));
  }

  Future<void> updateProfile({
    String? name,
    String? phone,
  }) async {
    safeEmit(state.copyWith(isLoading: true));
    final result = await _updateProfileUseCase.call(
      UpdateProfileRequestModel(
        name: name,
        phone: phone,
        file: state.selectedPhoto,
        lat: state.location?.lat.toString(),
        long: state.location?.lng.toString(),
      ),
    );
    result.fold(
      (failure) => safeEmit(
        state.copyWith(isSuccess: false, isLoading: false, failure: failure),
      ),
      (user) => safeEmit(
        state.copyWith(isSuccess: true, isLoading: false, user: user),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    safeEmit(state.copyWith(isLocationLoading: true));
    final result = await _getCurrentLocationUseCase.call();
    result.fold(
      (failure) =>
          safeEmit(state.copyWith(isLocationSuccess: false, failure: failure)),
      (location) => safeEmit(
        state.copyWith(
          isLocationSuccess: true,
          isLocationLoading: false,
          location: location,
        ),
      ),
    );
  }

  bool isDataChanges({
    String? name,
    String? phone,
    required UserEntity oldData,
  }) {
    return state.selectedPhoto != null ||
        (state.location != null && state.location!.name != oldData.location) ||
        oldData.name != name ||
        oldData.phone != phone;
  }

  void resetState() => safeEmit(state.resetState());
}
