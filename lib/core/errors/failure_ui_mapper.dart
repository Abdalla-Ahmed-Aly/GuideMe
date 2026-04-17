import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';

import '../app_assets/app_images.dart';
import 'error_model.dart';
import 'failure.dart';
import 'failure_code.dart';

class FailureUiMapper {
  static ErrorModel map({
    required BuildContext context,
    required Failure failure,
  }) {
    switch (failure.failureCode) {
      case FailureCode.network:
        return ErrorModel(
          message: context.l10n.errorNetwork,
          image: AppImages.placeTest,
        );

      case FailureCode.timeout:
        return ErrorModel(
          message: context.l10n.errorTimeout,
          image: AppImages.placeTest,
        );

      case FailureCode.unauthorized:
        return ErrorModel(
          message: context.l10n.errorUnauthorized,
          image: AppImages.placeTest,
        );

      case FailureCode.forbidden:
        return ErrorModel(
          message: context.l10n.errorForbidden,
          image: AppImages.placeTest,
        );

      case FailureCode.sessionExpired:
        return ErrorModel(
          message: context.l10n.errorSessionExpired,
          image: AppImages.placeTest,
        );

      case FailureCode.badRequest:
        return ErrorModel(
          message: context.l10n.errorBadRequest,
          image: AppImages.placeTest,
        );

      case FailureCode.notFound:
        return ErrorModel(
          message: context.l10n.errorNotFound,
          image: AppImages.placeTest,
        );

      case FailureCode.conflict:
        return ErrorModel(
          message: context.l10n.errorConflict,
          image: AppImages.placeTest,
        );

      case FailureCode.server:
        return ErrorModel(
          message: context.l10n.errorServer,
          image: AppImages.placeTest,
        );

      case FailureCode.cache:
        return ErrorModel(
          message: context.l10n.errorCache,
          image: AppImages.placeTest,
        );

      case FailureCode.database:
        return ErrorModel(
          message: context.l10n.errorDatabase,
          image: AppImages.placeTest,
        );

      case FailureCode.validation:
        return ErrorModel(
          message: context.l10n.errorValidation,
          image: AppImages.placeTest,
        );

      case FailureCode.emptyData:
        return ErrorModel(
          message: context.l10n.errorEmptyData,
          image: AppImages.placeTest,
        );

      case FailureCode.cancelled:
        return ErrorModel(
          message: context.l10n.errorCancelled,
          image: AppImages.placeTest,
        );

      case FailureCode.locationPermissionDenied:
        return ErrorModel(
          message: context.l10n.errorLocationPermissionDenied,
          image: AppImages.placeTest,
        );

      case FailureCode.locationPermissionDeniedForever:
        return ErrorModel(
          message: context.l10n.errorLocationPermissionDeniedForever,
          image: AppImages.placeTest,
        );

      case FailureCode.locationServiceDisabled:
        return ErrorModel(
          message: context.l10n.errorLocationServiceDisabled,
          image: AppImages.placeTest,
        );

      case FailureCode.emailNotRegistered:
        return ErrorModel(
          message: context.l10n.emailNotRegistered,
          image: AppImages.placeTest,
        );
      case FailureCode.emailAlreadyRegistered:
        return ErrorModel(
          message: context.l10n.emailAlreadyRegistered,
          image: AppImages.placeTest,
        );
      case FailureCode.invalidEmailOrPassword:
        return ErrorModel(
          message: context.l10n.invalidEmailOrPassword,
          image: AppImages.placeTest,
        );
      case FailureCode.userNotFound:
        return ErrorModel(
          message: context.l10n.userNotFound,
          image: AppImages.placeTest,
        );
      case FailureCode.otpExpired:
        return ErrorModel(
          message: context.l10n.otpExpired,
          image: AppImages.placeTest,
        );
      case FailureCode.invalidOtp:
        return ErrorModel(
          message: context.l10n.invalidOtp,
          image: AppImages.placeTest,
        );
      case FailureCode.placeAlreadyBooked:
        return ErrorModel(
          message: context.l10n.placeAlreadyBooked,
          image: AppImages.placeTest,
        );
      case FailureCode.youAlreadyHaveATripOnThisDay:
        return ErrorModel(
          message: context.l10n.youAlreadyHaveATripOnThisDay,
          image: AppImages.placeTest,
        );
      case FailureCode.tourCanOnlyBeStartedOnTheBookingDay:
        return ErrorModel(
          message: context.l10n.tourCanOnlyBeStartedOnTheBookingDay,
          image: AppImages.placeTest,
        );
      case FailureCode.alreadyAcceptedByAnotherGuide:
        return ErrorModel(
          message: context.l10n.alreadyAcceptedByAnotherGuide,
          image: AppImages.placeTest,
        );
      case FailureCode.packageAlreadyTaken:
        return ErrorModel(
          message: context.l10n.packageAlreadyTaken,
          image: AppImages.placeTest,
        );
      case FailureCode.unknown:
        return ErrorModel(
          message: context.l10n.errorUnknown,
          image: AppImages.placeTest,
        );
    }
  }
}
