import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/success_password_body/sucess_password_body.dart';

class SucessPasswordScreen extends StatelessWidget {
  const SucessPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessPasswordbody(),
    );
  }
}
