import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_lotties.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/cubits/cancel_booking_cubit/cancel_booking_cubit.dart';
import 'package:lottie/lottie.dart';

class CancelBookingBottomSheet extends StatelessWidget {
  const CancelBookingBottomSheet({
    super.key,
    required this.booking,
  });
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppLotties.cancelBubbles,
              height: 150.h,
            ),

            Text(
              context.l10n.cancelBookingRequest,
              style: AppTextStyles.poppinsSemiBold26,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.only(left: 25.p),
              child: Text(
                context.l10n.cancelMassage,
                textAlign: TextAlign.center,
                style: AppTextStyles.poppinsLight20.copyWith(
                  color: const Color(0xff9C7A49),
                ),
                softWrap: true,
              ),
            ),

            const SizedBox(height: 28),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.p),
              child: BlocConsumer<CancelBookingCubit, CancelBookingState>(
                listener: (context, state) {
                  if (state is CancelBookingSuccess) {
                    context.pop();
                    context.pop();
                    context.showSuccessSnakbar(
                      message: context.l10n.bookingCancelledSuccessfully,
                    );
                  } else if (state is CancelBookingFailure) {
                    final error = FailureUiMapper.map(
                      context: context,
                      failure: state.failure,
                    );
                    context.pop();
                    context.showErrorSnakbar(message: error.message);
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    isLoading: state is CancelBookingLoading,
                    onPressed: () async {
                      await context.read<CancelBookingCubit>().cancelBooking(
                        bookingId: booking.id,
                      );
                    },
                    text: context.l10n.yesCancelRequest,
                    radius: 16,
                    height: 48,
                    backgroundColor: const Color(0xffF2930D),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.p),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xffF2930D)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    context.l10n.goBack,
                    style: AppTextStyles.poppinsSemiBold16.copyWith(
                      color: const Color(0xffFFAA00),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
