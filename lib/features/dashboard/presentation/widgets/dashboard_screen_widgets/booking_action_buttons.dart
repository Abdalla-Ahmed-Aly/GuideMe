import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/app_outlined_button.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_and_decline_cubit/accept_booking_cubit.dart';

class BookingActionButtons extends StatelessWidget {
  const BookingActionButtons({
    super.key,
    required this.bookingId,
  });
  final String bookingId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<AcceptBookingCubit, AcceptBookingState>(
            builder: (context, state) {
              return AppOutlinedButton(
                isLoading:
                    state is AcceptBookingLoading &&
                    state.bookingId == bookingId &&
                    state.isDecline,
                height: 44,
                text: context.l10n.decline,
                textStyle: AppTextStyles.poppinsMedium14.copyWith(
                  color: AppColors.black,
                ),
                borderColor: Colors.black,
                radius: 12,
                onPressed: () {
                  context.read<AcceptBookingCubit>().declineBooking(bookingId);
                },
              );
            },
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: BlocBuilder<AcceptBookingCubit, AcceptBookingState>(
            builder: (context, state) {
              return AppButton(
                isLoading:
                    state is AcceptBookingLoading &&
                    state.bookingId == bookingId &&
                    state.isAccept,
                onPressed: () {
                  context.read<AcceptBookingCubit>().acceptBooking(bookingId);
                },
                text: context.l10n.accept,
                textStyle: AppTextStyles.poppinsMedium14.copyWith(
                  color: AppColors.white,
                ),
                height: 44,
                radius: 12,
                backgroundColor: AppColors.primary2,
              );
            },
          ),
        ),
      ],
    );
  }
}
