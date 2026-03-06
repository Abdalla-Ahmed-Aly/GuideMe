import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import '../widgets/add_certification_widgets/add_certification_screen_body.dart';

class AddCertificationScreen extends StatelessWidget {
  const AddCertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: false,
        title: Text(
          context.l10n.addCertification,
          style: AppTextStyles.poppinsSemiBold22,
        ),
        shape: const Border(
          bottom: BorderSide(color: AppColors.natural2),
        ),
      ),
      body: const AddCertificationScreenBody(),
    );
  }
}
