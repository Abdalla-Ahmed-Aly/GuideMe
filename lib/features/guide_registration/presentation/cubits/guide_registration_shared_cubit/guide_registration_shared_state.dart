import '../../../data/models/guide_registration_model.dart';

enum OnboardingMode { create, edit }

abstract class GuideRegistrationSharedState {
  const GuideRegistrationSharedState();
}

class GuideRegistrationInitial extends GuideRegistrationSharedState {}

class GuideRegistrationLoading extends GuideRegistrationSharedState {}

class GuideRegistrationFormData extends GuideRegistrationSharedState {
  final GuideRegistrationModel model;
  final OnboardingMode mode;
  final GuideRegistrationModel? originalData;

  const GuideRegistrationFormData({
    required this.model,
    this.mode = OnboardingMode.create,
    this.originalData,
  });

  GuideRegistrationFormData copyWith({
    GuideRegistrationModel? model,
    OnboardingMode? mode,
    GuideRegistrationModel? originalData,
  }) {
    return GuideRegistrationFormData(
      model: model ?? this.model,
      mode: mode ?? this.mode,
      originalData: originalData ?? this.originalData,
    );
  }

  bool get isEditMode => mode == OnboardingMode.edit;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuideRegistrationFormData &&
          runtimeType == other.runtimeType &&
          model == other.model &&
          mode == other.mode &&
          originalData == other.originalData;

  @override
  int get hashCode => Object.hashAll([model, mode, originalData]);
}

class GuideRegistrationSuccess extends GuideRegistrationSharedState {
  final String status;
  final String? message;

  const GuideRegistrationSuccess({required this.status, this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuideRegistrationSuccess &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          message == other.message;

  @override
  int get hashCode => Object.hashAll([status, message]);
}

class GuideRegistrationError extends GuideRegistrationSharedState {
  final String message;

  const GuideRegistrationError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuideRegistrationError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
