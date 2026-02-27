
import 'package:flutter/material.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_screen_section.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnalysisScreenSection(),
    );
  }
}