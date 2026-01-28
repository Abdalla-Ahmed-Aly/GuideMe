
import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/signup_and_login_widgets/signup_and_login_body.dart';

class SignupAndLoginScreen extends StatelessWidget {
  const SignupAndLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupAndLoginBody(),
    );
  }
}