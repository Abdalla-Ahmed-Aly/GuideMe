import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/receiver_message_bubble.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/sender_message_bubble.dart';
import 'package:intl/intl.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({super.key, required this.messages});
  final List<MessageEntity> messages;

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<dynamic> _buildChatItems(List<MessageEntity> messages) {
    final items = <dynamic>[];
    String? lastLabel;

    for (final msg in messages) {
      final label = _getDateLabel(msg.createdAt.toLocal());
      if (label != lastLabel) {
        items.add(label);
        lastLabel = label;
      }
      items.add(msg);
    }

    return items.reversed.toList();
  }

  String _getDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final msgDay = DateTime(date.year, date.month, date.day);
    final diff = today.difference(msgDay).inDays;

    if (diff == 0) return context.l10n.today;
    if (diff == 1) return context.l10n.yesterday;
    return DateFormat('MMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildChatItems(widget.messages);

    return ListView.builder(
      controller: _scrollController,
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 6),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is String) {
          return _DateHeader(label: item);
        }

        final currentMessage = item as MessageEntity;
        final nextItem = index < items.length - 1 ? items[index + 1] : null;
        final nextMessage = nextItem is MessageEntity ? nextItem : null;
        final makeRadius =
            nextMessage != null && nextMessage.isMine == currentMessage.isMine;

        return currentMessage.isMine
            ? SenderMessageBubble(
                makeRaduis: makeRadius,
                message: currentMessage,
              )
            : ReceiverMessageBubble(
                makeRaduis: makeRadius,
                message: currentMessage,
              );
      },
    );
  }
}

class _DateHeader extends StatelessWidget {
  const _DateHeader({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: AppTextStyles.poppinsMedium14.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
