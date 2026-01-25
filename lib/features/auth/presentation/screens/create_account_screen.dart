
import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_body/create_account_body.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateAccountBody(),
    );
  }
}