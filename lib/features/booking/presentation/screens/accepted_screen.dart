
import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/Accepted_screen_widgets/accepted_screen_body.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: AcceptedScreenBody()),
    );
  }
}