import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/user_profile_tile.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Dashboard_Cubit/dashboard_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Toogle_Online_Status/toogle_online_status_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/Availability_Status_Section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/request_items_list_view.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 20.p),
              child: Align(
                alignment: Alignment.centerLeft,
                child: BlocBuilder<DashboardCubit, DashboardCubitState>(
                  builder: (context, state) {
                    if (state is DashboardCubitSuccess) {
                      return Text(
                        "${context.l10n.newRequests} (${state.requestsHistory.length})",
                        style: AppTextStyles.poppinsMedium16.copyWith(
                          color: AppColors.black,
                        ),
                      );
                    }
                    return Text(
                      "${context.l10n.newRequests} (0)",
                      style: AppTextStyles.poppinsMedium16.copyWith(
                        color: AppColors.black,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.p, right: 15.p),
              child: const RequestItemsListView(),
            ),
          ],
        ),
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
      ),
      child: (imageUrl != null && imageUrl!.isNotEmpty)
          ? CachedNetworkImage(imageUrl: imageUrl!, fit: BoxFit.cover)
          : const Icon(
              Icons.person_outline_rounded,
              color: AppColors.primary2,
              size: 30,
            ),
    );
  }
}
