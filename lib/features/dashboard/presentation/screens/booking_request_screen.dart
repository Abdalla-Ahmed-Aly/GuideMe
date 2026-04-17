import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/booking_request_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/booking_action_buttons.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key, required this.requestEntity});
  final RequestEntity requestEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.bookingRequest,
          style: AppTextStyles.poppinsSemiBold20,
        ),
      ),

      body: BookingRequestSection(
        requestEntity: requestEntity,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).padding.bottom + 8,
        ),
        decoration: const BoxDecoration(color: Colors.white),
        child: BookingActionButtons(bookingId: requestEntity.booking!.id),
      ),
    );
  }
}
