import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class CompletedTripHeader extends StatelessWidget {
  const CompletedTripHeader({
    super.key,
    required this.booking,
  });

  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserCubit>().state;
    if (userState is! UserSuccess) return const SizedBox.shrink();
    final user = userState.user;
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              text: "${context.l10n.theTourwaswith}\n",
              style: AppTextStyles.poppinsSemiBold28.copyWith(
                color: AppColors.primary2,
              ),
              children: [
                TextSpan(
                  text: user.id == booking.guider!.id
                      ? booking.user.name
                      : booking.guider!.name,
                  style: AppTextStyles.poppinsBold32.copyWith(
                    color: AppColors.primary2,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Guider photo
        if (user.id != booking.guider!.id)
          Container(
            height: 90,
            width: 90,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffFFA537),
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child:
                booking.guider!.photo != null &&
                    booking.guider!.photo!.url != null
                ? CustomNetworkImage(
                    imageUrl: booking.guider!.photo!.url!,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.person_outline,
                    size: 44,
                    color: AppColors.primary2,
                  ),
          ),

        // Tourist photo
        if (user.id == booking.guider!.id)
          Container(
            height: 90,
            width: 90,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffFFA537),
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: booking.user.photo != null && booking.user.photo!.url != null
                ? CustomNetworkImage(
                    imageUrl: booking.user.photo!.url!,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.person_outline,
                    size: 44,
                    color: AppColors.primary2,
                  ),
          ),
      ],
    );
  }
}
