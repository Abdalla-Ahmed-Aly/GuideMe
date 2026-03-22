import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/args/book_place_args.dart';
import 'package:guide_me/features/booking/presentation/cubits/add_booking_cubit/add_booking_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_confirmation_widgets/booking_place_details_section.dart';

class BookingDetailsDraggable extends StatelessWidget {
  const BookingDetailsDraggable({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 22.p),
      children: [
        const BookingPlaceDetailsSection(),

        BlocConsumer<AddBookingCubit, AddBookingState>(
          listener: (context, state) {
            if (state is AddBookingSuccess) {
              context.push(
                AppRoutes.pendingApprovalScreen,
                extra: state.booking,
              );
            } else if (state is AddBookingError) {
              final error = FailureUiMapper.map(
                context: context,
                failure: state.failure,
              );
              context.showErrorSnakbar(message: error.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: AppButton(
                isLoading: state is AddBookingLoading,
                onPressed: () async {
                  final bookPlaceArgs =
                      GoRouterState.of(context).extra as BookPlaceArgs;

                  await context.read<AddBookingCubit>().addBooking(
                    addBookingRequest: bookPlaceArgs.addBookingRequest,
                  );
                },
                text: context.l10n.apply,
              ),
            );
          },
        ),
      ],
    );
  }
}
