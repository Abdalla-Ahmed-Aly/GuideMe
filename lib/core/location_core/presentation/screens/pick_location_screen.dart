import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/location_core/presentation/widgets/confirm_and_location_data.dart';
import 'package:guide_me/core/location_core/presentation/widgets/get_current_location_button.dart';
import 'package:guide_me/core/location_core/presentation/widgets/map_bloc_builder.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';

class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          const MapBlocBuilder(),

          // Serach bar
          _buildSearchBarAndArrowBackButton(context),

          // 
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 16,
            left: 20,
            right: 20,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GetCurrentLocationButton(),

                SizedBox(height: 16),

                ConfirmAndLocationData(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildSearchBarAndArrowBackButton(BuildContext context) {
    return Positioned(
          top: MediaQuery.of(context).padding.top + 24,
          left: 20,
          right: 20,
          child: CustomTextField(
            hintText: context.l10n.search,
            prefixIcon: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        );
  }
}

