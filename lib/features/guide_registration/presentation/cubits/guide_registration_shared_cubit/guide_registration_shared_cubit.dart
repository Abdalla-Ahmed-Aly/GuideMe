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
    final isEditModeStored = HiveService.loadEditMode();
    final savedData = HiveService.loadGuideData();

    // Check server status first to be sure
    try {
      final statusResp = await _repository.getVerificationStatus();
      final status = statusResp.data['data']['status'];
      
      if (status == 'rejected' || isEditModeStored) {
        // If rejected or flagged as edit, we MUST use PATCH
        // If we have local data, show it first while loading fresh data from server
        if (savedData != null) {
          emit(GuideRegistrationFormData(
            model: savedData,
            mode: OnboardingMode.edit,
            originalData: savedData,
          ));
        }
        
        await _loadFromServer();
        return;
      }
    } catch (e) {
      // If network fails but we have the flag, trust the flag
      if (isEditModeStored && savedData != null) {
         emit(GuideRegistrationFormData(
          model: savedData,
          mode: OnboardingMode.edit,
          originalData: savedData,
        ));
        return;
      }
    }

    // Default flow for new guides or normal local resume
    if (savedData != null) {
      emit(GuideRegistrationFormData(
        model: savedData,
        mode: isEditModeStored ? OnboardingMode.edit : OnboardingMode.create,
        originalData: isEditModeStored ? savedData : null,
      ));
    } else {
      emit(GuideRegistrationFormData(
        model: GuideRegistrationModel.initial(),
        mode: OnboardingMode.create,
      ));
    }
  }

  Future<void> _loadFromServer() async {
    if (state is! GuideRegistrationFormData) {
      emit(GuideRegistrationLoading());
    }
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

  void removeGuideLicense() {
    if (state is GuideRegistrationFormData) {
      final current = (state as GuideRegistrationFormData);
      emit(current.copyWith(
        model: GuideRegistrationModel(
          yearsOfExperience: current.model.yearsOfExperience,
          languages: current.model.languages,
          expertise: current.model.expertise,
          hourlyRate: current.model.hourlyRate,
          currency: current.model.currency,
          guideCities: current.model.guideCities,
          availability: current.model.availability,
          profilePhoto: current.model.profilePhoto,
          nationalId: current.model.nationalId,
          guideLicense: null,
        ),
      ));
      HiveService.saveGuideData((state as GuideRegistrationFormData).model);
    }
  }

  Future<void> submitOnboarding() async {
    if (state is! GuideRegistrationFormData) return;
    final current = state as GuideRegistrationFormData;

    emit(GuideRegistrationLoading());

    try {
      Response response;
      if (current.isEditMode) {
        response = await _repository.updateGuide(
          data: current.model,
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
            response = await _repository.updateGuide(
              data: current.model,
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
