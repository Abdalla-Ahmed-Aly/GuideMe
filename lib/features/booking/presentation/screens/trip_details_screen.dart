import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/cubits/review_cubit/review_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/review_dialog.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/trip_details_screen_body.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkReviewStatus();
    });
  }

  void _checkReviewStatus() async {
    final userState = context.read<UserCubit>().state;
    if (userState is UserSuccess) {
      final user = userState.user;
      if (user.role == UserRole.tourist) {
        final booking = GoRouterState.of(context).extra as BookingEntity;
        await context.read<ReviewCubit>().checkReviewStatus(
          bookingId: booking.id,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final booking = GoRouterState.of(context).extra as BookingEntity;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          context.l10n.details,
          style: AppTextStyles.poppinsBold24,
        ),
      ),
      body: BlocListener<ReviewCubit, ReviewState>(
        listener: (context, state) {
          if (state is CheckReviewStatusSuccess) {
            final check = state.reviewStatus;
            if (check.canReview) {
              ReviewDialog.show(context, booking: booking);
            }
          }
        },
        child: const CompletedTripScreenBody(),
      ),
    );
  }
}
