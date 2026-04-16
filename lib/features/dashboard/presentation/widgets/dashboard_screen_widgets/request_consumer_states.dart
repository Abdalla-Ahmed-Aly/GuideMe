import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/error_dailog.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/core/widgets/success_dialog.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_and_decline_cubit/accept_booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/accept_package_cubit/accept_package_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_list_view.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_shimmer_list_view.dart';

class RequestConsumerStates extends StatelessWidget {
  const RequestConsumerStates({
    super.key,
  });

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
          );
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
          );
        } else if (state is AcceptBookingFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          context.showErrorSnakbar(message: error.message);
        }
      },
      child: BlocListener<PackageActionsCubit, PackageActionsState>(
        listener: (context, state) {
          if (state is PackageActionsSuccess) {
            context.read<DashboardCubit>().removePackageFromList(
              state.packageId,
            );
            showDialog(
              context: context,
              builder: (context) {
                return SuccessDialog(
                  title: "${context.l10n.accepted}!",
                  message:
                      context.l10n.thePackageRequestHasBeenAcceptedSuccessfully,
                );
              },
            );
          }
          if (state is PackageActionsFailure) {
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
        child: BlocBuilder<DashboardCubit, DashboardCubitState>(
          builder: (context, state) {
            if (state is DashboardCubitInitial) {
              return Container(
                height: context.screenHeight * .6,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  context
                      .l10n
                      .youAreCurrentlyOfflineOpenStatusToReceiveRequests,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.interMedium16,
                ),
              );
            } else if (state is DashboardCubitLoading) {
              return const RequestsShimmerListView();
            } else if (state is DashboardCubitSuccess) {
              final requests = state.requestsHistory;
              if (requests.isEmpty) {
                return Center(
                  child: Text(
                    context.l10n.noRequestsAvailableAtTheMoment,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                );
              }
              return RequestsListView(requests: requests);
            } else if (state is DashboardCubitFailure) {
              final error = FailureUiMapper.map(
                context: context,
                failure: state.failure,
              );
              return FailureMessageWidget(error: error.message);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
