import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/verification_code_widgets/verification_code_screen_body.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerificationCodeScreenBody(),
    );
  }
}
