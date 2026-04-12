import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/manager/cubit/accept_booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/booking_request_section.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key, required this.requestEntity});
  final RequestCardEntity requestEntity;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AcceptBookingCubit, AcceptBookingState>(
      listener: (context, state) {
        if (state is AcceptBookingSuccess) {
          _showActionSuccessDialog(context, isAccept: true);
        } else if (state is DeclineBookingSuccess) {
          _showActionSuccessDialog(context, isAccept: false);
        } else if (state is AcceptBookingFailure) {
          context.showErrorSnakbar(message: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text(
            context.l10n.bookingRequest,
            style: AppTextStyles.poppinsSemiBold20,
          ),
        ),

        body: BookingRequestSection(
          requestEntity: requestEntity,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 13,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFEF4E6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  AppImages.chat,
                  width: 20.w,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.read<AcceptBookingCubit>().declineBooking(
                      requestEntity.bookingid,
                    );
                  },
                  child: Text(
                    context.l10n.decline,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.read<AcceptBookingCubit>().acceptBooking(
                      requestEntity.bookingid,
                    );
                  },
                  child: Text(
                    context.l10n.accept,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showActionSuccessDialog(BuildContext context, {required bool isAccept}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Icon(
          isAccept ? Icons.check_circle : Icons.cancel,
          color: isAccept ? Colors.green : Colors.red,
          size: 60,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isAccept ? "Accepted!" : "Declined!",
              style: AppTextStyles.poppinsMedium18,
            ),
            const SizedBox(height: 10),
            Text(
              isAccept
                  ? "The booking request has been accepted successfully."
                  : "The booking request has been declined.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // قفل الدايلوج
                context.pop(); // الرجوع لصفحة الداشبورد
              },
              child: const Text("Done"),
            ),
          ),
        ],
      );
    },
  );
}
