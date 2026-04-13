import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/args/chat_args.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_attachment_button.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/send_button.dart';

class ChatInputSection extends StatefulWidget {
  const ChatInputSection({
    super.key,
  });

  @override
  State<ChatInputSection> createState() => _ChatInputSectionState();
}

class _ChatInputSectionState extends State<ChatInputSection> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as ChatArgs;
    return Container(
      padding: EdgeInsets.only(
        left: 12.p,
        right: 12.p,
        bottom: 40,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const ChatAttachmentButton(),

          const SizedBox(width: 8),

          Expanded(
            child: CustomTextField(
              controller: _messageController,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              hintText: context.l10n.chat_type_message_hint,
              hintColor: const Color(0xff9C7A49),
              fillColor: const Color(0xffF3F4F6),
            ),
          ),

          const SizedBox(width: 8),

          SendButton(
            onPressed: () {
              if (_messageController.text.trim().isNotEmpty) {
                context.read<ChatCubit>().sendMessage(
                  SendMessageModel(
                    bookingId: args.bookingId,
                    message: _messageController.text.trim(),
                  ),
                );
                _messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
