
import 'package:flutter/material.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/dashboard_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardSection(),
    );
  }
}