import 'package:flutter/material.dart';

class ChatAttachmentButton extends StatelessWidget {
  const ChatAttachmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xffF3F4F6),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.add,
          size: 28,
          color: Color(0xff9C7A49),
        ),
      ),
    );
  }
}

