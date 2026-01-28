import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/check_email_body/check_email_body.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckEmailBody(),
    );
  }
}
