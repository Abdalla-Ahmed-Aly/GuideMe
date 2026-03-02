import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class QuickRepliesSection extends StatelessWidget {
  const QuickRepliesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> quickReplies = [
      "I’m at the entrance",
      "5 mins away",
      "Found you",
      "What's your name?",
      "How are you?",
      "What's your name?",
    ];
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(left: 16.p, right: 16.p, top: 8, bottom: 2),
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
          return Container(
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
          );
        },
      ),
    );
  }
}
