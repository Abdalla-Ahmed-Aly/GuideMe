import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/user_profile_tile.dart';
import 'package:guide_me/features/dashboard/presentation/manager/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/manager/Toogle_Online_Status/toogle_online_status_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/manager/cubit/accept_booking_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/Availability_Status_Section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_Item.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/requests_item_shimmer.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ToogleOnlineStatusCubit, ToogleOnlineStatusState>(
      listener: (context, state) {
        if (state is ToogleOnlineStatusError) {
          context.showErrorSnakbar(message: state.message);
        } else if (state is ToogleOnlineStatusChanged) {
          if (state.isOnline) {
            context.read<DashboardCubit>().getRequestsHistory();
          } else {
            context.read<DashboardCubit>().resetToInitial();
          }
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.screenHeight * 0.05),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.p),
              child: UserProfileTile(
                onTap: () {
                  context.push(AppRoutes.tourGuideProfileScreen);
                },
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.p),
              child: const AvailabilityStatusSection(),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: EdgeInsets.only(left: 21.p, right: 15.p),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.l10n.newRequests,
                  style: AppTextStyles.poppinsMedium16.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.p, right: 15.p),
              child: const ListviewRequiestItem(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListviewRequiestItem extends StatelessWidget {
  const ListviewRequiestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AcceptBookingCubit, AcceptBookingState>(
      listener: (context, state) {
        if (state is AcceptBookingSuccess) {
      context.read<DashboardCubit>().removeRequestLocally(state.bookingId);
      showAcceptSuccessDialog(context);
    }
    if (state is DeclineBookingSuccess) {
      context.read<DashboardCubit>().removeRequestLocally(state.bookingId);
    context.showSuccessSnakbar(message: "Booking declined successfully");
    
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        AppRoutes.bookingRequestScreen,
                        extra: requests[index],
                      );
                    },
                    child: RequestsItem(
                      requestModel: requests[index],
                    ),
                  ),
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
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo(
    this.imageUrl, {
    super.key,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xffFFA537)),
        image: DecorationImage(
          image: (imageUrl != null && imageUrl!.isNotEmpty)
              ? NetworkImage(imageUrl!)
              : const AssetImage(AppImages.profileImageTest) as ImageProvider,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

void showAcceptSuccessDialog(BuildContext context) {
  

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) { 
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Accepted!", style: AppTextStyles.poppinsMedium18),
            const SizedBox(height: 10),
            const Text(
              "The booking request has been accepted successfully.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                
                
              },
              child: const Text("Done"),
            ),
          ),
        ],
      );
    },
  );
}
