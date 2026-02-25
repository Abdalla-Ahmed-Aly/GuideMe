import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/booking_request_screen_widgets/booking_request_section.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(
            AppIcons.arrowBack,
            width: 15.w,
          ),
        ),
        title: Text(
          context.l10n.bookingRequest,
          style: AppTextStyles.poppinsSemiBold20,
          textAlign: TextAlign.center,
        ),
      ),
      body: const BookingRequestSection(),
    );
  }
}
