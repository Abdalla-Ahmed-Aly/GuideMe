import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/widgets/conversations_widgets/conversations_list_view.dart';
import 'package:guide_me/features/chat/presentation/widgets/conversations_widgets/convrsations_screen_header.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFAF8),
        title: Text(
          context.l10n.messages,
          style: AppTextStyles.poppinsSemiBold20,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.p),
        child: const Column(
          children: [
            SizedBox(height: 8),

            ConvrsationsScreenHeader(),

            ConversationsListView(),
          ],
        ),
      ),
    );
  }
}
