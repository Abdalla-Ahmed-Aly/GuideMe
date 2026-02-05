import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class TouristBookingAppBar extends StatelessWidget {
  const TouristBookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        top: context.isPortrait ? size.height * 0.06 : size.width * 0.05,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.touristBookings,
                  style: AppTextStyles.poppinsBold26,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          const Divider(
            height: 1,
            thickness: 2,
            color: Color(0xFFE0E0E0),
          ),
        ],
      ),
    );
  }
}
