import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_input_section.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_trip_details_card.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/messages_list_view.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/quick_replies_section.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFAF8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Column(
          children: [
            Text(
              "Omar Yasser",
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.poppinsSemiBold20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "ONLINE",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.poppinsSemiBold14.copyWith(
                    color: const Color(0xff9C7A49),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              context.pop();
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const MessagesListView(),

                Positioned(
                  top: 16,
                  left: 24.p,
                  right: 24.p,
                  child: const ChatTripDetailsCard(),
                ),
              ],
            ),
          ),

          const QuickRepliesSection(),

          const ChatInputSection(),
        ],
      ),
    );
  }
}
