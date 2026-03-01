import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'chats_status_list_view.dart';

class ConvrsationsScreenHeader extends StatelessWidget {
  const ConvrsationsScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          fillColor: const Color(0xffF4EEE7),
          hintText: context.l10n.chat_search_hint,
          hintColor: const Color(0xff9C7A49),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withValues(alpha: .1)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 42.h,
          child: const ChatsStatusListView(),
        ),
      ],
    );
  }
}


