import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/error_model.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_cubit.dart';

class HomeScreenFailure extends StatelessWidget {
  const HomeScreenFailure({
    super.key,
    required this.error,
  });
  final ErrorModel error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.oopsSomethingWentWrong,
              style: AppTextStyles.poppinsBold18,
            ),
            const SizedBox(height: 8),
            Text(
              error.message,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsRegular14,
            ),
            const SizedBox(height: 24),
            AppButton(
              onPressed: () => context.read<GetHomeCubit>().getHomeData(),
              text: context.l10n.tryAgain,
            ),
          ],
        ),
      ),
    );
  }
}
