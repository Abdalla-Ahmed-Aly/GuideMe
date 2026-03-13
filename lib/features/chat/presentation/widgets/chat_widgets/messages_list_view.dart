import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/receiver_message_bubble.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/sender_message_bubble.dart';

import '../../../cubits/chat_cubit/chat_cubit.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({super.key});

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final cubit = context.read<ChatCubit>();

    if (scrollController.offset <= 0) {
      cubit.showTrackingCard();
    } else {
      cubit.hideTrackingCard();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> messages = [
      "Welcome Sarah! I’m standing right by the main Sphinx ticket office entrance. I’m wearing a “GUID ME” cap.",
      "I’m wearing a “GUID ME” cap. sadadasdasdasdasdasdasdbsavdasvdhgasvdhagsvdhgv",
      " office entrance. I’m wearing a “GUID ME” cap.",
      "Hello",
      "Hi",
      "Hi",
      "Hi",
      "Hi",
      "Hi",
      "Hi",
      "Hi",
      "Hi2",
      "test",
    ].reversed.toList();

    return ListView.builder(
      controller: scrollController,
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 8.p, vertical: 4),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return index % 2 == 0
            ? SenderMessageBubble(
                message: messages[index],
              )
            : ReceiverMessageBubble(
                message: messages[index],
              );
      },
    );
  }
}
