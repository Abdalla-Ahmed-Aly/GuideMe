import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Toogle_Online_Status/toogle_online_status_cubit.dart';

class AvailabilityStatusSection extends StatefulWidget {
  const AvailabilityStatusSection({
    super.key,
  });

  @override
  State<AvailabilityStatusSection> createState() =>
      _AvailabilityStatusSectionState();
}

class _AvailabilityStatusSectionState extends State<AvailabilityStatusSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<ToogleOnlineStatusCubit, ToogleOnlineStatusState>(
        builder: (context, state) {
          final bool isOnline = context
              .read<ToogleOnlineStatusCubit>()
              .isOnline;
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
                        Text(
                          isOnline
                              ? context.l10n.onlineText
                              : context.l10n.offlineText,
                          style: AppTextStyles.poppinsMedium18.copyWith(
                            color: isOnline
                                ? AppColors.primary
                                : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Switch(
                activeThumbColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: AppColors.primary,
                inactiveTrackColor: AppColors.white,
                trackOutlineColor: WidgetStateProperty.all(AppColors.primary),
                value: isOnline,
                onChanged: (value) async {
                  final token = await getIt<TokenService>().getToken();
                  if (token != null) {
                    context.read<ToogleOnlineStatusCubit>().toogleOnlineStatus(
                      value,
                      token,
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
