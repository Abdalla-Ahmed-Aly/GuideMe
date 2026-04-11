import 'package:flutter/material.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/verification_failed_widgets/admin_note_card.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/verification_failed_widgets/document_issues_list_view.dart';

class VerificationIssueSection extends StatelessWidget {
  final String? reason;
  const VerificationIssueSection({super.key, this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff8C8C8C).withValues(alpha: 0.2),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const DocumentIssuesListView(),
          AdminNoteCard(reason: reason),
        ],
      ),
    );
  }
}
