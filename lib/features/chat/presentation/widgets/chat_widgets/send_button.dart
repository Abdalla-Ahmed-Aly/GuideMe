import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.only(
          right: context.isEnglish ? 12 : 15,
          left: context.isEnglish ? 15 : 12,
        ),
        decoration: const BoxDecoration(
          color: Color(0xffF2930D),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.send_rounded,
            // size: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
