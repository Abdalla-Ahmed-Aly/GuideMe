import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Toogle_Online_Status/toogle_online_status_cubit.dart';

class AvailabilityStatusSection extends StatelessWidget {
  const AvailabilityStatusSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<ToggleOnlineStatusCubit, ToogleOnlineStatusState>(
        builder: (context, state) {
          final bool isOnline = context
              .read<ToggleOnlineStatusCubit>()
              .isOnline;
          final isLoading = state is ToogleOnlineStatusLoading;
          return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.availability,
                      style: AppTextStyles.poppinsMedium18,
                    ),
                    Row(
                      children: [
                        Text(
                          context.l10n.yourAreCurrently,
                          style: AppTextStyles.poppinsMedium18.copyWith(
                            color: const Color(0xffB59A64),
                          ),
                        ),
                        const SizedBox(width: 3),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Text(
                            key: ValueKey(isOnline),
                            isOnline
                                ? context.l10n.onlineText
                                : context.l10n.offlineText,
                            style: AppTextStyles.poppinsMedium18.copyWith(
                              color: isOnline
                                  ? AppColors.primary
                                  : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 60,
                height: 48,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: isLoading
                      ? const _LoadingIcon()
                      : Switch(
                          activeThumbColor: AppColors.white,
                          activeTrackColor: AppColors.primary2,
                          inactiveThumbColor: AppColors.primary2,
                          inactiveTrackColor: AppColors.white,
                          trackOutlineColor: WidgetStateProperty.all(
                            AppColors.primary2,
                          ),
                          value: isOnline,
                          onChanged: isLoading
                              ? null
                              : (value) async {
                                  final token = await getIt<TokenService>()
                                      .getToken();
                                  if (token != null) {
                                    context
                                        .read<ToggleOnlineStatusCubit>()
                                        .toogleOnlineStatus(
                                          value,
                                          token,
                                        );
                                  }
                                },
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _LoadingIcon extends StatefulWidget {
  const _LoadingIcon();

  @override
  State<_LoadingIcon> createState() => __LoadingIconState();
}

class __LoadingIconState extends State<_LoadingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late List<Animation<double>> _scales;
  late List<Animation<double>> _opacities;

  static const _primary = AppColors.primary2;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat();

    _scales = List.generate(3, (i) {
      final start = i * 0.25;
      return Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: Interval(
            start,
            (start + 0.55).clamp(0, 1),
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    _opacities = List.generate(3, (i) {
      final start = i * 0.25;
      return Tween<double>(begin: 0.75, end: 0.0).animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: Interval(
            start,
            (start + 0.55).clamp(0, 1),
            curve: Curves.easeOut,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // exact same footprint as Flutter's Switch widget
    final ringSizes = [16.0, 24.0, 32.0];

    return SizedBox(
      width: 60,
      height: 48,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Opacity(
                  opacity: _opacities[i].value,
                  child: Transform.scale(
                    scale: _scales[i].value,
                    child: Container(
                      width: ringSizes[i],
                      height: ringSizes[i],
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _primary,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: _primary,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
