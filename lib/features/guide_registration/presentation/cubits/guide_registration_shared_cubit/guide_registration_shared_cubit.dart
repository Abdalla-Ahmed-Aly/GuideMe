import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import '../../../../../core/services/hive_service.dart';
import '../../../../../core/services/media_picker_service/media_picker_service.dart';
import '../../../data/models/guide_registration_model.dart';
import '../../../data/repositories/guide_registration_repository.dart';
import 'guide_registration_shared_state.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GuideRegistrationSharedCubit extends Cubit<GuideRegistrationSharedState> {
  final GuideRegistrationRepository _repository;
  final MediaPickerService _mediaPickerService;

  GuideRegistrationSharedCubit(
    this._repository, 
    this._mediaPickerService,
  ) : super(GuideRegistrationInitial());

  void initForm() async {
    final isEditMode = HiveService.loadEditMode();
    final savedData = HiveService.loadGuideData();

    // Check if we need to force edit mode due to rejection
    try {
      final statusResp = await _repository.getVerificationStatus();
      final status = statusResp.data['data']['status'];
      if (status == 'rejected') {
        // If rejected, we MUST use PATCH and should load server data
        _loadFromServer();
        return;
      }
    } catch (_) {}

    if (isEditMode && savedData != null) {
      // Ensure fields only contain valid ObjectIds (24-char hex strings)
      // and remove any legacy hardcoded strings like "Historical" or "Cairo"
      final validatedExpertise = savedData.expertise
          .where((e) => RegExp(r'^[0-9a-fA-F]{24}$').hasMatch(e))
          .toList();
      
      final validatedCities = savedData.guideCities
          .where((e) => RegExp(r'^[0-9a-fA-F]{24}$').hasMatch(e))
          .toList();
      
      final validatedData = savedData.copyWith(
        expertise: validatedExpertise,
        guideCities: validatedCities,
      );
      
      emit(GuideRegistrationFormData(
        model: validatedData,
        mode: OnboardingMode.edit,
        originalData: validatedData,
      ));
    } else {
      final initialData = savedData != null 
        ? savedData.copyWith(
            expertise: savedData.expertise
                .where((e) => RegExp(r'^[0-9a-fA-F]{24}$').hasMatch(e))
                .toList(),
            guideCities: savedData.guideCities
                .where((e) => RegExp(r'^[0-9a-fA-F]{24}$').hasMatch(e))
                .toList(),
          )
        : GuideRegistrationModel.initial();

      emit(GuideRegistrationFormData(
        model: initialData,
        mode: OnboardingMode.create,
      ));
    }
  }

  Future<void> _loadFromServer() async {
    emit(GuideRegistrationLoading());
    try {
      final response = await _repository.getOnboardingDetails();
      final data = response.data['data']['onboarding'];
      final model = GuideRegistrationModel.fromJson(data);
      
      emit(GuideRegistrationFormData(
        model: model,
        mode: OnboardingMode.edit,
        originalData: model,
      ));
      HiveService.saveGuideData(model);
    } catch (e) {
      emit(GuideRegistrationError("Failed to load existing data: $e"));
      // fallback to initial
      emit(GuideRegistrationFormData(
        model: GuideRegistrationModel.initial(),
        mode: OnboardingMode.create,
      ));
    }
  }

  void _updateModel(GuideRegistrationModel Function(GuideRegistrationModel) update) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final newModel = update(current.model);
      emit(current.copyWith(model: newModel));
      HiveService.saveGuideData(newModel);
    }
  }

  void setProfessionalInfo({
    int? yearsOfExperience,
    List<String>? languages,
    double? hourlyRate,
    String? currency,
    List<String>? guideCities,
  }) {
    _updateModel((m) => m.copyWith(
      yearsOfExperience: yearsOfExperience,
      languages: languages,
      hourlyRate: hourlyRate,
      currency: currency,
      guideCities: guideCities,
    ));
  }

  void setExpertise(List<String> expertise) {
    _updateModel((m) => m.copyWith(expertise: expertise));
  }

  void toggleExpertise(String expertise) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final list = List<String>.from(current.model.expertise);
      if (list.contains(expertise)) {
        list.remove(expertise);
      } else {
        list.add(expertise);
      }
      setExpertise(list);
    }
  }

  void toggleLanguage(String language) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final list = List<String>.from(current.model.languages);
      if (list.contains(language)) {
        list.remove(language);
      } else {
        list.add(language);
      }
      setProfessionalInfo(languages: list);
    }
  }

  void addLanguages(List<String> languages) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final list = List<String>.from(current.model.languages);
      for (var lang in languages) {
        if (!list.contains(lang)) list.add(lang);
      }
      setProfessionalInfo(languages: list);
    }
  }

  void removeLanguage(String language) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final list = List<String>.from(current.model.languages);
      list.remove(language);
      setProfessionalInfo(languages: list);
    }
  }

  void addCities(List<String> cities) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final list = List<String>.from(current.model.guideCities);
      for (var city in cities) {
        if (!list.contains(city)) list.add(city);
      }
      setProfessionalInfo(guideCities: list);
    }
  }

  void removeCity(String city) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final list = List<String>.from(current.model.guideCities);
      list.remove(city);
      setProfessionalInfo(guideCities: list);
    }
  }

  void setAvailability({
    List<String>? days,
    String? from,
    String? to,
  }) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      emit(current.copyWith(
        model: current.model.copyWith(
          availability: current.model.availability.copyWith(
            days: days,
            from: from,
            to: to,
          ),
        ),
      ));
      HiveService.saveGuideData((state as GuideRegistrationFormData).model);
    }
  }

  void toggleAvailabilityDay(String day) {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      final list = List<String>.from(current.model.availability.days);
      if (list.contains(day)) {
        list.remove(day);
      } else {
        list.add(day);
      }
      setAvailability(days: list);
    }
  }

  Future<void> pickProfilePhoto() async {
    final pickedFile = await _mediaPickerService.pickImage();
    if (pickedFile != null) {
      final persistedFile = await _mediaPickerService.persistFile(pickedFile, subDirectory: 'profile_photos');
      _updateModel((m) => m.copyWith(profilePhoto: persistedFile));
    }
  }

  Future<void> pickNationalId(int index) async {
    final file = await _mediaPickerService.pickFile(
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );
    if (file != null) {
      final persistedFile = await _mediaPickerService.persistFile(file, subDirectory: 'identity_docs');
      _updateModel((m) {
        final list = List<PickedFileModel?>.from(m.nationalId);
        // Ensure list has enough space
        while (list.length <= index) {
          list.add(null);
        }
        list[index] = persistedFile;
        return m.copyWith(nationalId: list);
      });
    }
  }

  void removeNationalId(int index) {
    _updateModel((m) {
      final list = List<PickedFileModel?>.from(m.nationalId);
      if (index < list.length) {
        list[index] = null;
      }
      return m.copyWith(nationalId: list);
    });
  }

  Future<void> pickGuideLicense() async {
    final pickedFile = await _mediaPickerService.pickFile(
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );
    if (pickedFile != null) {
      final persistedFile = await _mediaPickerService.persistFile(pickedFile, subDirectory: 'licenses');
      _updateModel((m) => m.copyWith(guideLicense: persistedFile));
    }
  }

  Future<void> submitOnboarding() async {
    if (state is! GuideRegistrationFormData) return;
    final current = state as GuideRegistrationFormData;

    emit(GuideRegistrationLoading());

    try {
      Response response;
      if (current.isEditMode) {
        final changedFields = _getChangedFields(
          current.originalData ?? GuideRegistrationModel.initial(),
          current.model,
        );

        response = await _repository.updateGuide(
          changedFields: changedFields,
          profilePhoto: current.model.profilePhoto,
          nationalId: current.model.nationalId,
          guideLicense: current.model.guideLicense,
        );
      } else {
        try {
          response = await _repository.createGuide(
            data: current.model,
          );
        } catch (e) {
          // If the entry already exists, try PATCH instead
          if (e is DioException && 
              (e.response?.statusCode == 400 || e.response?.statusCode == 409)) {
            final changedFields = _getChangedFields(
              GuideRegistrationModel.initial(),
              current.model,
            );
            response = await _repository.updateGuide(
              changedFields: changedFields,
              profilePhoto: current.model.profilePhoto,
              nationalId: current.model.nationalId,
              guideLicense: current.model.guideLicense,
            );
          } else {
            rethrow;
          }
        }
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        await HiveService.clearGuideData();
        emit(const GuideRegistrationSuccess(status: 'success'));
      } else {
        emit(const GuideRegistrationError('Submission failed'));
      }
    } catch (e) {
      if (e is DioException) {
        final errorMsg = e.response?.data['message'] ?? e.message ?? "Unknown Error";
        emit(GuideRegistrationError(errorMsg));
      } else {
        emit(GuideRegistrationError(e.toString()));
      }
      emit(current); 
    }
  }

  Map<String, dynamic> _getChangedFields(GuideRegistrationModel old, GuideRegistrationModel current) {
    final map = <String, dynamic>{};
    if (old.yearsOfExperience != current.yearsOfExperience) {
      map['yearsOfExperience'] = current.yearsOfExperience;
    }
    if (!const ListEquality().equals(old.languages, current.languages)) {
      map['languages'] = current.languages;
    }
    if (!const ListEquality().equals(old.expertise, current.expertise)) {
      map['expertise'] = current.expertise;
    }
    if (old.hourlyRate != current.hourlyRate) {
      map['hourlyRate'] = current.hourlyRate;
    }
    if (old.currency != current.currency) {
      map['currency'] = current.currency;
    }
    if (!const ListEquality().equals(old.guideCities, current.guideCities)) {
      map['guideCities'] = current.guideCities;
    }
    if (old.availability != current.availability) {
      map['availability'] = current.availability.toJson();
    }
    return map;
  }
}
