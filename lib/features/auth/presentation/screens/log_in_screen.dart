import 'package:flutter/material.dart';
import 'package:guide_me/features/auth/presentation/widgets/log_in_widgets/log_in_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LogInBody(),
    );
  }
}
