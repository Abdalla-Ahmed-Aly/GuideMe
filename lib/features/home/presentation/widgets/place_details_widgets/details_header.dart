import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/place_images.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        const PlaceImages(),
        // Arrow Back Button
        Positioned(
          top: context.isPortrait ? size.height * 0.05 : size.width * 0.03,
          left: 32.p,
          child: const ArrowBackButton(),
        ),
      ],
    );
  }
}
