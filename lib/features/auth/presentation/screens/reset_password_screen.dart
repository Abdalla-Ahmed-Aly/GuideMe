
import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/reset_password_widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResetPasswordBody(),
    );
  }
}