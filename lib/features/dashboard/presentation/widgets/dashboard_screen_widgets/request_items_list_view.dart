import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/widgets/error_dailog.dart';
import 'package:guide_me/core/widgets/success_dialog.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_and_decline_cubit/accept_booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_package_cubit/accept_package_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/package_request_item.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_item.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_item_shimmer.dart';

class RequestItemsListView extends StatelessWidget {
  const RequestItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AcceptPackageCubit, AcceptPackageState>(
      listener: (context, state) {
        if (state is AcceptPackageSuccess) {
          context.read<DashboardCubit>().removeRequestLocally(
            state.packageId,
          );
          showDialog(
            context: context,
            builder: (context) {
              return SuccessDialog(
                title: "${context.l10n.accepted}!",
                message: context.l10n.thePackageRequestHasBeenAcceptedSuccessfully,
              );
            },
          );
        }
        if (state is AcceptPackageFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              title: "${context.l10n.error}!",
              message: error.message,
            ),
          );
        }
      },
      child: BlocListener<AcceptBookingCubit, AcceptBookingState>(
        listener: (context, state) {
          if (state is AcceptBookingSuccess) {
            context.read<DashboardCubit>().removeRequestLocally(
              state.bookingId,
            );
            showDialog(
              context: context,
              builder: (context) {
                return const SuccessDialog(
                  title: "Accepted!",
                  message:
                      "The booking request has been accepted successfully.",
                );
              },
            );
          }
          if (state is DeclineBookingSuccess) {
            context.read<DashboardCubit>().removeRequestLocally(
              state.bookingId,
            );
            context.showSuccessSnakbar(
              message: "Booking declined successfully",
            );
          }
          if (state is AcceptBookingFailure) {
            context.showErrorSnakbar(message: state.message);
          }
        },
        child: BlocConsumer<DashboardCubit, DashboardCubitState>(
          builder: (context, state) {
            if (state is DashboardCubitInitial) {
              return Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "You are currently offline. Open status to receive requests.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              );
            }
            if (state is DashboardCubitLoading) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: RequestsItemShimmer(),
                ),
              );
            }

            if (state is DashboardCubitSuccess) {
              final requests = state.requestsHistory;
              if (requests.isEmpty) {
                return Center(
                  child: Text(
                    "No requests available at the moment.",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (context, index) {
                  if (requests[index].type == 'package') {
                    return PackageRequestItem(request: requests[index]);
                  }

                  return RequestsItem(
                    requestModel: requests[index],
                  );
                },
                itemCount: requests.length,
              );
            }
            return const SizedBox();
          },
          listener: (BuildContext context, DashboardCubitState state) {
            if (state is DashboardCubitFailure) {
              final error = FailureUiMapper.map(
                context: context,
                failure: state.failure,
              );
              context.showErrorSnakbar(message: error.message);
            }
          },
        ),
      ),
    );
  }
}
