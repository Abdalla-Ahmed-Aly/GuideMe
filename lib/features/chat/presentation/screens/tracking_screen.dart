import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/chat/presentation/widgets/tracking_widgets/tracking_draggable_section.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Stack(
        children: [
          // map
          Center(
            child: Container(
              decoration: const BoxDecoration(),
              child: const Icon(
                Icons.location_on,
                size: 40,
                color: Colors.orange,
              ),
            ),
          ),

          // arrow back
          Positioned(
            top: context.isPortrait
                ? context.screenHeight * 0.05
                : context.screenWidth * 0.03,
            left: 16.p,
            child: const ArrowBackButton(),
          ),

          // data
          const TrackingDraggableSection(),
        ],
      ),
    );
  }
}
