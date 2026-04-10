import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:guide_me/features/chat/presentation/cubits/tracking_details_cubit/tracking_details_cubit.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/receiver_message_bubble.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/sender_message_bubble.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({super.key, required this.messages});
  final List<MessageEntity> messages;

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
    final cubit = context.read<TrackingDetailsCubit>();

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
    return ListView.builder(
      controller: scrollController,
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 4),
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        return widget.messages[index].isMine
            ? SenderMessageBubble(
                message: widget.messages[index],
              )
            : ReceiverMessageBubble(
                message: widget.messages[index],
              );
      },
    );
  }
}
