import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/reset_password_widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email, required this.otp});
  final String email;
  final String otp;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ResetPasswordBody(email: email, otp: otp,),
    );
  }
}
