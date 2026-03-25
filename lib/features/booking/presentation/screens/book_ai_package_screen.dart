import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_ai_package_widgets/confirm_and_book_ai_package_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_ai_package_widgets/enter_reservation_details_section.dart';

class BookAiPackageScreen extends StatelessWidget {
  const BookAiPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFCFC),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.confirmAiPackage,
          style: AppTextStyles.poppinsBold22,
        ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Divider(
            color: AppColors.natural2,
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: EnterReservationDetailsSection(),
          ),

          ConfirmAndBookAiPackageSection(),
        ],
      ),
    );
  }
}
