import 'package:flutter/material.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/admin_note_card.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/document_issues_list_view.dart';

class VerificationIssueSection extends StatelessWidget {
  const VerificationIssueSection({super.key});

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
      child: const Column(
        children: [
           DocumentIssuesListView(),
          
          AdminNoteCard(),
        ],
      ),
    );
  }
}

