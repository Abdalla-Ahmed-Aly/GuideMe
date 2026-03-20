import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/location_core/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class GetCurrentLocationButton extends StatelessWidget {
  const GetCurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickLocationCubit, PickLocationState>(
      builder: (context, state) {
        return IconButton(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            if (state is! PickLocationLoading &&
                state is! PickLocationSuccessLoading) {
              context.read<PickLocationCubit>().getCurrentLocation();
            }
          },
          icon: SizedBox(
            width: 28,
            height: 28,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: state is PickLocationLoading
                  ? const _LoadingIcon(key: ValueKey('loading'))
                  : const Icon(
                      key: ValueKey('icon'),
                      Icons.my_location_rounded,
                      color: AppColors.primary2,
                      size: 28,
                    ),
            ),
          ),
        );
      },
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
                width: 28,
                height: 28,
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
