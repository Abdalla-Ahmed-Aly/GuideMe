import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/data/models/booking_package_request_model.dart';
import 'package:guide_me/features/booking/presentation/args/book_package_args.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_package_cubit/book_package_cubit.dart';

class ConfirmAndBookPackageSection extends StatelessWidget {
  const ConfirmAndBookPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final package = GoRouterState.of(context).extra as PackageArgs;
    final bookingPackageCubit = context.read<BookPackageCubit>();
    return Container(
      padding: EdgeInsets.only(
        left: 16.p,
        right: 16.p,
        top: 16,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xffE2E8F0)),
        ),
      ),
      child: BlocConsumer<BookPackageCubit, BookPackageState>(
        listener: (context, state) {
          if (state is BookPackageFailure) {
            final errorMessage = state.failure.message;
            context.showErrorSnakbar(
              message: errorMessage ?? context.l10n.errorUnknown,
            );
            bookingPackageCubit.resetValidation();
          } else if (state is BookPackageSuccess) {
            context.showSuccessSnakbar(
              message: context.l10n.packageBookedSuccessfully,
            );
            bookingPackageCubit.resetValidation();

            final args = BookPackageArgs(
              bookPackageResponseModel: state.bookPackageResponseModel,
              packageArgs: package,
            );

            context.go(
              AppRoutes.packageBookingSuccessScreen,
              extra: args,
            );
          }
        },
        builder: (context, state) {
          return AppButton(
            isLoading: state is BookPackageLoading,
            onPressed: () {
              if (bookingPackageCubit.validate(context)) {
                bookingPackageCubit.bookPackage(
                  bookingPackageRequestModel: BookingPackageRequestModel(
                    places: package.package.places.map((p) => p.id).toList(),
                    date: state.data.formatDateTime,
                    persons: package.numberOfPersons,
                    pickupLocation: state.data.location!,
                  ),
                );
              }
            },
            text: context.l10n.confirmAndBookNow,
            textStyle: AppTextStyles.poppinsBold18,
            backgroundColor: AppColors.primary2,
          );
        },
      ),
    );
  }
}
