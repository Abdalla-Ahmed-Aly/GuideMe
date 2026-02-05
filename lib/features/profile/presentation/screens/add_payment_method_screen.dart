import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/profile/presentation/widgets/payment_widgets/payment_app_bar.dart';
import 'package:guide_me/features/profile/presentation/widgets/payment_widgets/payment_section.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.isPortrait ? size.height * 0.05 : size.width * 0.05,
          ),

          // App Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: const PaymentAppBar(),
          ),

          const SizedBox(height: 8),

          const Expanded(
            child: PaymentSection(),
          ),
        ],
      ),
    );
  }
}
