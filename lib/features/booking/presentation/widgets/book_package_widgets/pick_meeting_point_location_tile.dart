import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_package_cubit/book_package_cubit.dart';

class PickMeetingPointLocationTile extends StatelessWidget {
  const PickMeetingPointLocationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final location = await context.push<String>(
          AppRoutes.pickLocationScreen,
        );
        if (location != null) {
          context.read<BookPackageCubit>().pickLocation(location);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffF1F5F9)),
        ),
        child: Row(
          children: [
            _buildLocationIcon(),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.meetingPoint,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: const Color(0xff94A3B8),
                    ),
                  ),

                  const SizedBox(height: 4),

                  BlocBuilder<BookPackageCubit, BookPackageState>(
                    builder: (context, state) {
                      return Text(
                        state.data.location ??
                            context.l10n.chooseYourMeetingPoint,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.poppinsSemiBold16,
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.primary2,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildLocationIcon() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primary2.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.location_on_rounded,
        color: AppColors.primary2,
      ),
    );
  }
}
