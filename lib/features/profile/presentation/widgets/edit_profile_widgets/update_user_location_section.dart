import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:shimmer/shimmer.dart';

class UpdateUserLocationSection extends StatelessWidget {
  const UpdateUserLocationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = (context.read<UserCubit>().state as UserSuccess).user;
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<UpdateProfileCubit>().getCurrentLocation();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.natural2,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.locationOutline),

                const SizedBox(width: 12),

                Expanded(
                  child: state.isLocationLoading
                      ? _buildTextShimmer()
                      : Text(
                          state.location?.name ??
                              user.location ??
                              context.l10n.pickCurrentLocation,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.interRegular16,
                        ),
                ),

                const SizedBox(width: 8),

                SizedBox(
                  width: 24,
                  height: 24,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.isLocationLoading
                        ? const _LoadingIcon(key: ValueKey('loading'))
                        : const Icon(
                            key: ValueKey('icon'),
                            Icons.my_location_rounded,
                            color: AppColors.primary2,
                            size: 24,
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Shimmer _buildTextShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 16,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatefulWidget {
  const _LoadingIcon({super.key});

  @override
  State<_LoadingIcon> createState() => __LoadingIconState();
}

class __LoadingIconState extends State<_LoadingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _animation = Tween<double>(begin: 5, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final scale = (_animation.value - 5) / 15;
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: scale,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
            ),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary2,
              ),
            ),
          ],
        );
      },
    );
  }
}
