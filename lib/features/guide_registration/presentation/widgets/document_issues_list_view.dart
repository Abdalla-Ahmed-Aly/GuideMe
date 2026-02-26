import 'package:flutter/material.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/document_issue_tile.dart';

class DocumentIssuesListView extends StatelessWidget {
  const DocumentIssuesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(18),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return const DocumentIssueTile();
      },
    );
  }
}
