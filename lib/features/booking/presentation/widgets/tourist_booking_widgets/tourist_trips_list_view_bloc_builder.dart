import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/features/booking/presentation/cubits/tourist_booking_cubit/tourist_booking_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/booking_shimmer_list_view.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/trips_list_view.dart';

class TouristTripsListViewBlocBuilder extends StatelessWidget {
  const TouristTripsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TouristBookingCubit, TouristBookingState>(
      builder: (context, state) {
        if (state is TouristBookingFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return Center(child: Text(error.message));
        } else if (state is TouristBookingSuccess) {
          return TripsListView(bookings: state.touristBookings);
        }
        return const BookingShimmerListView();
      },
    );
  }
}
