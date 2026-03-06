import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_screen_section.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.analysis,
          style: AppTextStyles.poppinsSemiBold20,
        ),
      ),
      body: const AnalysisScreenSection(),
    );
  }
}
