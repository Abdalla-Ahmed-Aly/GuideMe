import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';
import 'package:guide_me/features/booking/presentation/args/book_package_args.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_ai_package_cubit/book_ai_package_cubit.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class ConfirmAndBookAiPackageSection extends StatelessWidget {
  const ConfirmAndBookAiPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final package = GoRouterState.of(context).extra as PackageEntity;
    final cubit = context.read<BookAiPackageCubit>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20.p,
        right: 20.p,
        top: 16,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(color: Color(0xffF3F4F6)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BlocConsumer<BookAiPackageCubit, BookAiPackageState>(
        listener: (context, state) {
          if (state is BookAiPackageSuccess) {
            final PackageArgs args = PackageArgs(
              numberOfPersons: state.data.numberOfPersons,
              package: BookingPackageEntity(
                places: package.places,
                totalPrice: package.totalPrice.toDouble(),
              ),
            );

            context.go(
              AppRoutes.packageBookingSuccessScreen,
              extra: BookPackageArgs(
                bookPackageResponseModel: state.bookPackageResponseModel,
                packageArgs: args,
              ),
            );
          } else if (state is BookAiPackageFailure) {
            if (state.failure.failureCode != FailureCode.validation) {
              final error = FailureUiMapper.map(
                context: context,
                failure: state.failure,
              );
              context.showErrorSnakbar(message: error.message);
            } else {
              context.showErrorSnakbar(
                message: state.failure.message ?? context.l10n.errorUnknown,
              );
            }
            cubit.resetState();
          }
        },
        builder: (context, state) {
          return AppButton(
            isLoading: state is BookAiPackageLoading,
            onPressed: () {
              if (cubit.validate(context)) {
                cubit.bookAiPackage();
              }
            },
            text: context.l10n.confirmAndBookNow,
            radius: 16,
          );
        },
      ),
    );
  }
}
