part of 'update_profile_cubit.dart';

class UpdateProfileState {
  final PickedFileModel? selectedPhoto;
  final MapLocationEntity? location;
  final bool isLoading;
  final bool isLocationLoading;
  final bool isLocationSuccess;
  final bool isSuccess;
  final Failure? failure;
  final UserEntity? user;
  final String? networkPhotoUrl;

  UpdateProfileState({
    this.networkPhotoUrl,
    this.selectedPhoto,
    this.isLoading = false,
    this.isLocationLoading = false,
    this.isLocationSuccess = false,
    this.isSuccess = false,
    this.failure,
    this.user,
    this.location,
  });

  UpdateProfileState copyWith({
    PickedFileModel? selectedPhoto,
    MapLocationEntity? location,
    bool? isLoading,
    bool? isLocationLoading,
    bool? isSuccess,
    bool? isLocationSuccess,
    Failure? failure,
    UserEntity? user,
    String? networkPhotoUrl,
  }) {
    return UpdateProfileState(
      networkPhotoUrl: networkPhotoUrl ?? this.networkPhotoUrl,
      selectedPhoto: selectedPhoto ?? this.selectedPhoto,
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      isLocationLoading: isLocationLoading ?? this.isLocationLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isLocationSuccess: isLocationSuccess ?? this.isLocationSuccess,
      failure: failure,
      user: user ?? this.user,
    );
  }

  UpdateProfileState resetState() => UpdateProfileState(
    networkPhotoUrl: networkPhotoUrl,
    selectedPhoto: selectedPhoto,
  );
}
