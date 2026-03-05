import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/chat_attachment_button.dart';
import 'package:guide_me/features/chat/presentation/widgets/chat_widgets/send_button.dart';

class ChatInputSection extends StatelessWidget {
  const ChatInputSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.p,
        right: 16.p,
        bottom: 40,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const ChatAttachmentButton(),
    
              const SizedBox(width: 12),
    
              Expanded(
                child: CustomTextField(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  hintText: context.l10n.chat_type_message_hint,
                  hintColor: const Color(0xff9C7A49),
                  fillColor: const Color(0xffF3F4F6),
                ),
              ),
    
              const SizedBox(width: 12),
    
              const SendButton(),
            ],
          ),
        ],
      ),
    );
  }
}

