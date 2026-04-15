import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_package_cubit/accept_package_cubit.dart';

class AcceptPackageSection extends StatelessWidget {
  const AcceptPackageSection({super.key, required this.packageId});
  final String packageId;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.only(
        top: 8,
        left: 22.p,
        right: 22.p,
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.primary2.withValues(alpha: 0.3)),
        ),
      ),
      child: BlocBuilder<AcceptPackageCubit, AcceptPackageState>(
        builder: (context, state) {
          return AppButton(
            isLoading: state is AcceptPackageLoading,
            onPressed: () {
              context.read<AcceptPackageCubit>().acceptPackage(packageId);
            },
            text: context.l10n.accept,
            backgroundColor: AppColors.primary2,
            radius: 16,
          );
        },
      ),
    );
  }
}
