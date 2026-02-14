import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/padding_approval_body.dart';

class PandingApprovalScreen extends StatelessWidget {
  const PandingApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(top: false, child: PandingApprovalBody()),
    );
  }
}
