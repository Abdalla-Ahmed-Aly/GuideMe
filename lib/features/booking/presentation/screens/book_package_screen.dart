import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_package_widgets/book_package_screen_body.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_package_widgets/confirm_and_book_package_section.dart';

class BookPackageScreen extends StatelessWidget {
  const BookPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F6F6),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        leadingWidth: 65,
        title: Text(
          context.l10n.confirmPackage,
          style: AppTextStyles.poppinsBold22,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: const Color(0xffE2E8F0),
          ),
        ),
      ),
      body: const Column(
        children: [
          Expanded(child: BookPackageScreenBody()),
          ConfirmAndBookPackageSection(),
        ],
      ),
    );
  }
}
