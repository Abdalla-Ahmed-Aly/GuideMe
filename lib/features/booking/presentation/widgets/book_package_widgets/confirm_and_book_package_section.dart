import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_package_cubit/book_package_cubit.dart';

class ConfirmAndBookPackageSection extends StatelessWidget {
  const ConfirmAndBookPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            context.read<BookPackageCubit>().resetValidation();
          }
        },
        builder: (context, state) {
          return AppButton(
            onPressed: () {
              if (context.read<BookPackageCubit>().validate(context)) {
                // context.read<BookPackageCubit>().bookPackage();
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
