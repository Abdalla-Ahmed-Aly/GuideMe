import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/args/chat_args.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';

class QuickRepliesSection extends StatelessWidget {
  const QuickRepliesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as ChatArgs;
    final List<String> quickReplies = [
      context.l10n.chat_i_am_at_the_entrance,
      context.l10n.chat_5_mins_away,
      context.l10n.chat_found_you,
      context.l10n.chat_whats_your_name,
      context.l10n.chat_how_are_you,
    ];
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(left: 12.p, right: 12.p, top: 8, bottom: 2),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: quickReplies.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<ChatCubit>().sendMessage(
                SendMessageModel(
                  bookingId: args.bookingId,
                  message: quickReplies[index],
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  quickReplies[index],
                  style: AppTextStyles.poppinsSemiBold14.copyWith(
                    color: const Color(0xff9C7A49),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
