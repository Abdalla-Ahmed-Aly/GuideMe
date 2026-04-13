import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/chat/presentation/cubits/conversation_cubit/conversation_cubit.dart';

class ConversationsSearchSection extends StatelessWidget {
  const ConversationsSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      fillColor: const Color(0xffF4EEE7),
      hintText: context.l10n.chat_search_hint,
      hintColor: const Color(0xff9C7A49),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withValues(alpha: .1)),
        borderRadius: BorderRadius.circular(20),
      ),
      onChanged: (value) {
        context.read<ConversationCubit>().search(value);
      },
    );
  }
}
