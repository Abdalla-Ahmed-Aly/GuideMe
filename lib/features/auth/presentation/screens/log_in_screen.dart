
import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_body/log_in_body_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LogInBodyWidget(),
    );
  }
}