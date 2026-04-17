import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/success_dialog.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_and_decline_cubit/accept_booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/booking_request_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/booking_action_buttons.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key, required this.requestEntity});
  final RequestEntity requestEntity;
  @override
  Widget build(BuildContext context) {
    
    return BlocListener<AcceptBookingCubit, AcceptBookingState>(
      listener: (context, state) {
        if (state is AcceptBookingSuccess) {
          context.read<DashboardCubit>().removeBookingFromList(
            state.bookingId,
          );
          showDialog(
            context: context,
            builder: (context) => SuccessDialog(
              title: context.l10n.bookingAccepted,
              message: context.l10n.bookingAcceptedMessage,
            ),
          ).then((value) {
            context.pop();
          });
        } else if (state is DeclineBookingSuccess) {
          context.read<DashboardCubit>().removeBookingFromList(
            state.bookingId,
          );
          showDialog(
            context: context,
            builder: (context) => SuccessDialog(
              title: context.l10n.bookingDeclined,
              message: context.l10n.bookingDeclinedMessage,
            ),
          ).then((value) {
            context.pop();
          });
        } else if (state is AcceptBookingFailure) {
          if (state.failure.failureCode ==
              FailureCode.alreadyAcceptedByAnotherGuide) {
            context.read<DashboardCubit>().removeBookingFromList(
              state.bookingId,
            );
            context.pop();
          }
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          context.showErrorSnakbar(message: error.message);
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
          padding: EdgeInsets.only(
            top: 8,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 8,
          ),
          decoration: const BoxDecoration(color: Colors.white),
          child: BookingActionButtons(bookingId: requestEntity.booking!.id),
        ),
      ),
    );
  }
}
