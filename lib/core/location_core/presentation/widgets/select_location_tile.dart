import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/location_core/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

class SelectLocationTile extends StatelessWidget {
  const SelectLocationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary2.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.location_on,
            color: AppColors.primary2,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.selectedLocation,
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: AppColors.primary2,
                ),
              ),

              const SizedBox(height: 4),

              BlocBuilder<PickLocationCubit, PickLocationState>(
                builder: (context, state) {
                  if (state is PickLocationSuccess) {
                    return Text(
                      state.location.name ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.poppinsSemiBold16,
                    );
                  } else if (state is PickLocationLoading ||
                      state is PickLocationSuccessLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 16,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    );
                  } else if (state is PickLocationFailure) {
                    final error = FailureUiMapper.map(
                      context: context,
                      failure: state.failure,
                    );
                    return Text(
                      error.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.poppinsSemiBold16,
                    );
                  }
                  return Text(
                    context.l10n.noLocationSelected,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppinsSemiBold16,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
