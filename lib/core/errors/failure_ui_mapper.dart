// import 'package:flutter/material.dart';
// import 'package:guide_me/core/extentions/context_extentions.dart';

// import '../app_assets/app_images.dart';
// import 'error_model.dart';
// import 'failure.dart';
// import 'failure_code.dart';

// class FailureUiMapper {
//   static ErrorModel map({
//     required BuildContext context,
//     required Failure failure,
//   }) {
//     switch (failure.failureCode) {
//       case FailureCode.network:
//         return ErrorModel(
//           message: context.l10n.errorNetwork,
//           image: AppImages.networkError,
//         );

//       case FailureCode.timeout:
//         return ErrorModel(
//           message: context.l10n.errorTimeout,
//           image: AppImages.networkError,
//         );

//       case FailureCode.unauthorized:
//         return ErrorModel(
//           message: context.l10n.errorUnauthorized,
//           image: AppImages.unauthorizedError,
//         );

//       case FailureCode.forbidden:
//         return ErrorModel(
//           message: context.l10n.errorForbidden,
//           image: AppImages.unauthorizedError,
//         );

//       case FailureCode.sessionExpired:
//         return ErrorModel(
//           message: context.l10n.errorSessionExpired,
//           image: AppImages.unauthorizedError,
//         );

//       case FailureCode.badRequest:
//         return ErrorModel(
//           message: context.l10n.errorBadRequest,
//           image: AppImages.networkError,
//         );

//       case FailureCode.notFound:
//         return ErrorModel(
//           message: context.l10n.errorNotFound,
//           image: AppImages.dataError,
//         );

//       case FailureCode.conflict:
//         return ErrorModel(
//           message: context.l10n.errorConflict,
//           image: AppImages.unkownError,
//         );

//       case FailureCode.server:
//         return ErrorModel(
//           message: context.l10n.errorServer,
//           image: AppImages.networkError,
//         );

//       case FailureCode.cache:
//         return ErrorModel(
//           message: context.l10n.errorCache,
//           image: AppImages.dataError,
//         );

//       case FailureCode.database:
//         return ErrorModel(
//           message: context.l10n.errorDatabase,
//           image: AppImages.dataError,
//         );

//       case FailureCode.validation:
//         return ErrorModel(
//           message: context.l10n.errorValidation,
//           image: AppImages.unkownError,
//         );

//       case FailureCode.emptyData:
//         return ErrorModel(
//           message: context.l10n.errorEmptyData,
//           image: AppImages.dataError,
//         );

//       case FailureCode.cancelled:
//         return ErrorModel(
//           message: context.l10n.errorCancelled,
//           image: AppImages.cancelledError,
//         );

//       case FailureCode.unknown:
//         return ErrorModel(
//           message: context.l10n.errorUnknown,
//           image: AppImages.unkownError,
//         );
//     }
//   }
// }