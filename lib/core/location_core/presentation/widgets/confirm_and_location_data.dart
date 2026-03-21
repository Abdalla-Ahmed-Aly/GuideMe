import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/location_core/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:guide_me/core/location_core/presentation/widgets/select_location_tile.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class ConfirmAndLocationData extends StatelessWidget {
  const ConfirmAndLocationData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SelectLocationTile(),

          BlocBuilder<PickLocationCubit, PickLocationState>(
            builder: (context, state) {
              if (state is PickLocationSuccess) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: AppButton(
                    onPressed: () {
                      context.pop(state.location.name);
                    },
                    text: context.l10n.confirmLocation,
                    height: 46,
                    radius: 16,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
