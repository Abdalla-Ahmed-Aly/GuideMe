import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';

class PaymentAppBar extends StatelessWidget {
  const PaymentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ArrowBackButton(),

        Text(
          context.l10n.paymentMethod,
          style: AppTextStyles.poppinsBold20,
        ),

        SizedBox(
          width: context.isPortrait ? size.height * 0.05 : size.width * 0.05,
        ),
      ],
    );
  }
}
